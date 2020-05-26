import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todolist/screens/tasks_screen.dart';
import 'package:todolist/models/task_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TaskData tasks = TaskData();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<TaskData>(
      model: tasks,
      child: MaterialApp(
        title: 'My To-Do List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TasksScreen(),
      ),
    );
  }
}
