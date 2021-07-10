import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/task_screen.dart';
import 'package:todo/models/task_data.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          accentColor: Color(0xFFEB1555),
        ),
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
