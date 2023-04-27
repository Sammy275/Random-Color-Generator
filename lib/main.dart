import 'package:flutter/material.dart';

import './features/color_changer/screens/color_changer_screen.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Color Generator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const ColorChangerScreen(),
    );
  }
}
