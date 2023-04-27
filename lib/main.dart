import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

/// The root widget that runApp function instantiates
class App extends StatelessWidget {
  /// Basic Constructor for the App class
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Generator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomeScreen(),
    );
  }
}

/// Contains the widgets that will change colors
class HomeScreen extends StatefulWidget {
  /// Constructor for HomeScreen
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _backgroundColorHex = 'FFFFFFFF';

  static const int _maxColorRange = 4294967295;
  static const int baseOfHex = 16;

  void setRandomColorHex() {
    setState(() {
      _backgroundColorHex =
          Random().nextInt(_maxColorRange).toRadixString(baseOfHex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Generator'),
      ),
      body: Stack(
        children: [
          Container(
            color: Color(int.parse(_backgroundColorHex, radix: baseOfHex)),
          ),
          const Center(
            child: Text(
              'Hello There!',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: setRandomColorHex,
          )
        ],
      ),
    );
  }
}
