import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play("note$soundNumber.wav");
  }

  Widget buildKey(int soundNumber, Color colorName) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          playSound(2);
        },
        child: Text("click me"),
        color: colorName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildKey(1, Colors.red),
            buildKey(2, Colors.orange),
            buildKey(3, Colors.redAccent),
            buildKey(4, Colors.blue),
            buildKey(5, Colors.greenAccent),
            buildKey(6, Colors.grey),
            buildKey(7, Colors.purple)
          ],
        )),
      ),
    );
  }
}
