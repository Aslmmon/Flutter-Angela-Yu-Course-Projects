import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/addTaskScreen.dart';
import 'package:todoapp/widgets/TaskList.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen()));
        },
        backgroundColor: Colors.lightBlueAccent,
        hoverColor: Colors.yellow,
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 20, left: 20, bottom: 30, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      color: Colors.lightBlueAccent,
                      size: 30,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Todeoy",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  Text(
                    "12 Tasks",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Expanded(
              child: RoundedContainer(),
            )
          ],
        ),
      ),
    );
  }
}

class RoundedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: ListView(
        children: <Widget>[
          ListTaskWidget(),
          ListTaskWidget(),
          ListTaskWidget(),
        ],
      ),
    );
  }
}
