import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todolist/widgest/empty_list.dart';
import 'package:todolist/widgest/task_title.dart';
import 'package:todolist/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<TaskData>(
      builder: (context, child, tasks) {
        if (tasks.tasksCoun == 0)
          return EmptyList();
        else
          return ListView.builder(
            itemBuilder: (context, index) {
              return TaskTitle(
                name: tasks.tasks[index].name,
                isChecked: tasks.tasks[index].isDone,
                icon: tasks.tasks[index].icon,
                chackBoxCallback: (value) {
                  tasks.checkTask(index: index);
                },
                longClick: () {
                  tasks.removeTask(index: index);
                },
              );
            },
            itemCount: tasks.tasksCoun,
          );
      },
    );
  }
}
