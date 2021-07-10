import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
      color: Colors.black,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white12,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
          child: Column(
            children: [
              Text(
                'Add Task',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 30,
                ),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newValue) {
                  newTaskTitle = newValue;
                },
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                color: Color(0xFFEB1555),
                minWidth: double.infinity,
                height: 48,
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle);
                  Navigator.pop(context);
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
