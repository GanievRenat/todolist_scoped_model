import 'package:flutter/material.dart';

class Task {
  String name;
  bool isDone;
  IconData icon;

  Task({this.name, this.isDone, this.icon});

  void toggleDone() {
    isDone = !isDone;
  }
}
