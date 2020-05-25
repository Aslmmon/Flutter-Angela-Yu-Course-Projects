import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          title: Text('Ask me Anything'),
          backgroundColor: Colors.blue,
        ),
        body: MagicBallState(),
      ),
    ),
  );
}

class MagicBallState extends StatefulWidget {
  @override
  _MagicBallStateState createState() => _MagicBallStateState();
}

class _MagicBallStateState extends State<MagicBallState> {
  var iconName = 1;
  void changeIconOnClick(){
    setState(() {
      iconName = Random().nextInt(5) +1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        onPressed: (){
          changeIconOnClick();
          print(iconName);
        },
        child: Container(

          child: Image.asset("images/ball$iconName.png"),

        ),
      ),

    );
  }
}
