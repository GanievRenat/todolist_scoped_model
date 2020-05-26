import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todolist/widgest/tasks_list.dart';
import 'package:todolist/screens/add_task_screen.dart';
import 'package:todolist/models/task_data.dart';
import 'package:todolist/widgest/empty_list.dart';
import 'package:file_picker/file_picker.dart';

class MenuItem {
  const MenuItem({this.title, this.icon});

  final String title;
  final IconData icon;
}

class TasksScreen extends StatelessWidget {
  static const List<MenuItem> menuItems = const <MenuItem>[
    const MenuItem(title: 'Удалить отмеченные', icon: Icons.delete_outline),
    const MenuItem(title: 'Очистить список', icon: Icons.clear_all),
  ];

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<TaskData>(builder: (context, child, tasks) {
      return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            child: Icon(Icons.add),
            onPressed: () {
              //new FilePickerDemo();
              /*showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => SingleChildScrollView(
                    child: Container(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen(),
                )),
              );*/
              //showBottomSheet(context: context, builder: buildBottomSheet);
            },
          ),
          backgroundColor: Colors.blue,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      child: Icon(
                        Icons.list,
                        size: 30.0,
                        color: Colors.blue,
                      ),
                      radius: 30.0,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Todoey',
                            style: TextStyle(
                              fontSize: 50.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        PopupMenuButton<MenuItem>(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onSelected: (menuItem) {
                            if (menuItem == menuItems[0]) {
                              tasks.removeChecked();
                            }
                            if (menuItem == menuItems[1]) {
                              tasks.removeAll();
                            }
                          },
                          itemBuilder: (BuildContext context) {
                            return menuItems.map((MenuItem menuItem) {
                              return PopupMenuItem<MenuItem>(
                                  value: menuItem,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(menuItem.title),
                                      ),
                                      Icon(
                                        menuItem.icon,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ));
                            }).toList();
                          },
                        ),
                      ],
                    ),
                    Text(
                      '${tasks.tasksCoun} Tasks',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: TasksList(),
                ),
              ),
            ],
          ));
    });
  }
}
