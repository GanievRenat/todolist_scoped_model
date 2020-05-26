import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todolist/models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  List<IconData> listIcons = [
    FontAwesomeIcons.gamepad,
    FontAwesomeIcons.fan,
    FontAwesomeIcons.addressBook,
    FontAwesomeIcons.android,
    FontAwesomeIcons.conciergeBell,
    FontAwesomeIcons.flagUsa
  ];
  IconData select_icon;
  String new_task_title;

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<TaskData>(builder: (context, child, tasks) {
      return Container(
        color: Color(0xFF757575),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Add new task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: getListIcons(),
              ),
              TextField(
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.done,
                autofocus: true,
                onChanged: (value) {
                  new_task_title = value;
                },
                onSubmitted: (value) {
                  if (select_icon != null) {
                    tasks.addTask(newTaskName: new_task_title, iconData: select_icon);
                    Navigator.pop(context);
                  } else {}
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              /*FlatButton(
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blue,
                onPressed: () {
                  if (select_icon != null) {
                    tasks.addTask(newTaskName: new_task_title, iconData: select_icon);
                    Navigator.pop(context);
                  } else {}
                },
              ),*/
            ],
          ),
        ),
      );
    });
  }

  List<Widget> getListIcons() {
    List<Widget> list = [];
    for (IconData icon in listIcons) {
      list.add(Expanded(
        child: GestureDetector(
          child: CircleAvatar(
            backgroundColor: (icon == select_icon) ? Colors.blue : Colors.white,
            child: FaIcon(
              icon,
              color: (icon == select_icon) ? Colors.white : Colors.blue,
            ),
          ),
          onTap: () {
            setState(() {
              select_icon = icon;
            });
          },
        ),
      ));
    }
    return list;
  }
}
