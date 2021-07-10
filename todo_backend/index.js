const express = require("express");
const pool = require("./db");

const app = express();

app.use(express.json()); // => req.body

//Routes//

//get all todos

app.get("/todo", async (req, res) => {
  try {
    const allTodos = await pool.query(`SELECT * FROM todo`);
    res.json(allTodos.rows);
  } catch (error) {
    console.log(error);
  }
});
// get a todo

app.get("/todo/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const todo = await pool.query("SELECT * FROM todo WHERE id = ($1)", [id]);
    res.json(todo.rows[0]);
  } catch (error) {
    console.log(error);
  }
});
//create a todo

app.post("/todo", async (req, res) => {
  try {
    const { description } = req.body;
    const newTodo = await pool.query(
      `INSERT INTO todo (description) VALUES ($1) RETURNING *`,
      [description]
    );
    res.status(200).json(newTodo.rows[0]);
  } catch (error) {
    console.log(error.message);
  }
});
// update a todo

app.patch("/todo/:id", async (req, res) => {
  try {
    const { id } = req.params;

    await pool.query(
      `UPDATE todo SET isDone = NOT isDone WHERE todo_id = ($1)`,
      [id]
    );
    res.status(200).json({
      message: "todo updated",
    });
  } catch (error) {
    console.log(error);
  }
});
// delete a todo

app.delete("/todo/:id", async (req, res) => {
  const { id } = req.params;
  try {
    await pool.query(`DELETE FROM todo WHERE todo_id = ($1)`, [id]);
    res.json({
      message: "Todo was deleted",
    });
  } catch (error) {
    console.log(error);
  }
});

app.listen(3000, "192.168.0.104", () => {
  console.log("Server is listening at port 3000");
});
