import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimatedContainerApp());
}

class AnimatedContainerApp extends StatefulWidget {
  const AnimatedContainerApp({Key? key}) : super(key: key);

  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  double _width = 70.0;
  double _height = 70.0;
  Color _color = Colors.brown;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animated Container Practice'),
          backgroundColor: Colors.brown,
        ),
        body: Center(
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
            ),
            curve: Curves.fastOutSlowIn,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.play_arrow),
          backgroundColor: Colors.brown,
          onPressed: () {
            setState(() {
              final random = Random();
              _width = random.nextInt(500).toDouble();
              _height = random.nextInt(500).toDouble();

              _color = Color.fromRGBO(
                random.nextInt(300),
                random.nextInt(300),
                random.nextInt(300),
                1,
              );

              _borderRadius =
                  BorderRadius.circular(random.nextInt(100).toDouble());
            });
          },
        ),
      ),
    );
  }
}