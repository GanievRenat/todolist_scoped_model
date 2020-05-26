import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaskTitle extends StatelessWidget {
  final bool isChecked;
  final String name;
  final IconData icon;
  final Function chackBoxCallback;
  final Function longClick;

  TaskTitle({this.name, this.isChecked, this.icon, this.chackBoxCallback, this.longClick});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longClick,
      title: Row(
        children: <Widget>[
          FaIcon(
            icon,
            color: isChecked ? Colors.grey : Colors.blue,
            size: 20.0,
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                  decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none,
                  color: isChecked ? Colors.grey : Colors.black),
            ),
          )
        ],
      ),
      trailing: Checkbox(
        activeColor: Colors.blue,
        value: isChecked,
        onChanged: chackBoxCallback,
      ),
    );
  }
}
