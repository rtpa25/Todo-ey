import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class TaskData extends ChangeNotifier {
  List<dynamic> tasks;

  Future<void> getTasks() async {
    http.Response response = await http.get(
      Uri.parse('http://192.168.0.104:3000/todo'),
    );
    tasks = jsonDecode(response.body) as List;

    // print(jsonDecode(response.body));
    notifyListeners();
  }

  int get taskCount {
    return tasks.length;
  }

  Future<void> addTask(String newTaskTitle) async {
    await http.post(
      Uri.parse('http://192.168.0.104:3000/todo'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'description': newTaskTitle,
      }),
    );
    getTasks();
  }

  Future<void> updateTask(String todo_id) async {
    await http.patch(
      Uri.parse('http://192.168.0.104:3000/todo/${todo_id}'),
    );

    getTasks();
  }

  void deleteTask(String todo_id) async {
    await http.delete(
      Uri.parse('http://192.168.0.104:3000/todo/${todo_id}'),
    );
    getTasks();
  }
}
