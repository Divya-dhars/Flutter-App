import 'dart:ui' as ui;

import 'package:flutter/material.dart';

void main() {
  runApp(DrawingApp());
}

class DrawingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawing App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DrawingScreen(),
    );
  }
}

class DrawingScreen extends StatefulWidget {
  @override
  _DrawingScreenState createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  List<List<Offset>> drawings = [];
  List<Offset> currentDrawing = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawing App'),
      ),
      body: GestureDetector(
        onPanDown: (details) {
          setState(() {
            currentDrawing.add(details.localPosition);
          });
        },
        onPanUpdate: (details) {
          setState(() {
            currentDrawing.add(details.localPosition);
          });
        },
        onPanEnd: (details) {
          setState(() {
            drawings.add(currentDrawing);
            currentDrawing = [];
          });
        },
        child: CustomPaint(
          painter: DrawingPainter(drawings),
          size: Size.infinite,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.clear),
        onPressed: () {
          setState(() {
            drawings.clear();
          });
        },
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<List<Offset>> drawings;

  DrawingPainter(this.drawings);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    for (final drawing in drawings) {
      for (int i = 0; i < drawing.length - 1; i++) {
        canvas.drawLine(drawing[i], drawing[i + 1], paint);
      }
      if (drawing.isNotEmpty) {
        canvas.drawPoints(ui.PointMode.points, drawing, paint);
      }
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true;
}