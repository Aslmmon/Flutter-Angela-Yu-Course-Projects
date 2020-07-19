import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Add Task",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 24)),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center),
            SizedBox(height: 20),
            FlatButton(
              padding: EdgeInsets.all(20),
              onPressed: () {},
              color: Colors.lightBlueAccent,
              child: Text("Add",style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
