import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("This is Task 1"),
      trailing: Checkbox(
          value: false,
          onChanged: (val) {
            print(val);
          }),
    );
  }
}
