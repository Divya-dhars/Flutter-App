import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[800],
        primarySwatch: Colors.yellow,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSqrt = false;
  String result = "", text = "", op = "";
  double first = 0, second = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                CustomOutlinedButton("C"),
                CustomOutlinedButton("√"),
                CustomOutlinedButton("%"),
                CustomOutlinedButton("⌫"),
              ],
            ),
            Row(
              children: <Widget>[
                CustomOutlinedButton("7"),
                CustomOutlinedButton("8"),
                CustomOutlinedButton("9"),
                CustomOutlinedButton("/"),
              ],
            ),
            Row(
              children: <Widget>[
                CustomOutlinedButton("4"),
                CustomOutlinedButton("5"),
                CustomOutlinedButton("6"),
                CustomOutlinedButton("x"),
              ],
            ),
            Row(
              children: <Widget>[
                CustomOutlinedButton("1"),
                CustomOutlinedButton("2"),
                CustomOutlinedButton("3"),
                CustomOutlinedButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                CustomOutlinedButton("0"),
                CustomOutlinedButton("."),
                CustomOutlinedButton("="),
                CustomOutlinedButton("+"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget CustomOutlinedButton(String val) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => btnClicked(val),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            val,
            style: TextStyle(fontSize: 25.0),
          ),
        ),
      ),
    );
  }

  void btnClicked(String val) {
    if (val == "C") {
      result = "";
      text = "";
      first = 0;
      second = 0;
      isSqrt = false;
    } else if (val == "+" ||
        val == "-" ||
        val == "x" ||
        val == "/" ||
        val == "%" ||
        val == "√") {
      if (val == "√") {
        if (!isSqrt && text.isNotEmpty) {
          first = double.parse(text);
          if (first >= 0) {
            result = sqrt(first).toString();
          } else {
            result = "Error";
          }
          text = result;
          isSqrt = true;
        }
      } else {
        if (text.isNotEmpty) {
          first = double.parse(text);
          result = "";
          op = val;
        }
        isSqrt = false;
      }
    } else if (val == "=") {
      if (!isSqrt && op.isNotEmpty && text.isNotEmpty) {
        second = double.parse(text);
        switch (op) {
          case "+":
            result = (first + second).toString();
            break;
          case "-":
            result = (first - second).toString();
            break;
          case "x":
            result = (first * second).toString();
            break;
          case "/":
            if (second != 0) {
              result = (first / second).toString();
            } else {
              result = "Error";
            }
            break;
          case "%":
            result = (first % second).toString();
            break;
        }
      }
      isSqrt = false;
    } else if (val == "⌫") {
      if (result.isNotEmpty) {
        result = result.substring(0, result.length - 1);
        if (result.isEmpty || result == "-") {
          result = "0";
        }
        text = result;
      }
    } else if (val == ".") {
      if (result.isEmpty) {
        result = "0.";
      } else if (!result.contains(".")) {
        result = result + ".";
      }
    } else {
      result = result + val;
    }
    setState(() {
      text = isSqrt ? "$text" : result;
    });
  }
}