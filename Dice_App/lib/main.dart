import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    appBar: AppBar(
      title: const Text('Dice',
          style: TextStyle(
            color: Colors.white,
          )),
      backgroundColor: Color.fromARGB(222, 21, 140, 153),
    ),
    body: DicePage(),
  )));
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1; //1-6
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDiceFace();
              },
              child: Image.asset('assets/dice$leftDiceNumber.jpg'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDiceFace();
              },
              child: Image.asset('assets/dice$rightDiceNumber.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
