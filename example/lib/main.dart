import 'package:flippable_box/flippable_box.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlippableExample(),
    );
  }
}

class FlippableExample extends StatefulWidget {
  @override
  _FlippableExampleState createState() => _FlippableExampleState();
}

class _FlippableExampleState extends State<FlippableExample> with SingleTickerProviderStateMixin {
  bool _isFlipped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade100,
        body: Center(
          child: GestureDetector(
            onTap: () => setState(() => _isFlipped = !_isFlipped),
            child: FlippableBox(
              front: _buildCard("Front!", 250, 200, Colors.green),
              back: _buildCard("Back...", 350, 350, Colors.red),
              isFlipped: _isFlipped,
            ),
          ),
        ));
  }

  Widget _buildCard(String label, double width, double height, Color color) {
    return Container(
      color: color,
      width: width,
      height: height,
      child: Center(
        child: Text(label, style: TextStyle(fontSize: 32)),
      ),
    );
  }
}
