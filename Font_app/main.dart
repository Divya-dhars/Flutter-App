import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Example',
      home: ButtonExample(),
    );
  }
}

class ButtonExample extends StatefulWidget {
  @override
  _ButtonExampleState createState() => _ButtonExampleState();
}

class _ButtonExampleState extends State<ButtonExample> {
  final colors = [
    Colors.red,
    Colors.white,
    Colors.green,
    Colors.blue,
    Colors.orange,
  ];
  int colorIndex = 0;
  Color currentColor = Colors.red;
  final fontFamilies = [
    'Arial',
    'Courier New',
    'Times New Roman',
  ];
  int fontFamilyIndex = 0;
  String currentFontFamily = 'Arial';

  void changeBackgroundColor() {
    setState(() {
      colorIndex = (colorIndex + 1) % colors.length;
      currentColor = colors[colorIndex];
    });
  }

  void changeFontFamily() {
    setState(() {
      fontFamilyIndex = (fontFamilyIndex + 1) % fontFamilies.length;
      currentFontFamily = fontFamilies[fontFamilyIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color-Font App'),
      ),
      body: Container(
        color: currentColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Change Background Color',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: currentFontFamily,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: changeBackgroundColor,
                child: Text(
                  'Change Color',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  primary: currentColor,
                  elevation: 10.0, // Adjust the elevation value here
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Change Font Family',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: currentFontFamily,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: changeFontFamily,
                child: Text(
                  'Change Font',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}