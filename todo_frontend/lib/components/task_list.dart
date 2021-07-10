import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo/models/task_data.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            print(task['isdone']);
            return GestureDetector(
              onLongPress: () {
                setState(() {
                  taskData.deleteTask(task['todo_id'].toString());
                });
              },
              child: CheckboxListTile(
                title: Text(
                  task['description'] == null ? "error" : task['description'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    decoration:
                        task['isdone'] ? TextDecoration.lineThrough : null,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    taskData.updateTask(task['todo_id'].toString());
                  });
                },
                value: task['isdone'],
                activeColor: Color(0xFFEB1555),
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
