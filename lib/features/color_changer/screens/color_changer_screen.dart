import 'package:flutter/material.dart';

import '../../../app_constants/text_constants.dart';
import '../helpers/color_generator.dart';

/// This screen will change color when tapped
class ColorChangerScreen extends StatefulWidget {
  /// This screen will change color when tapped
  const ColorChangerScreen({super.key});

  @override
  State<ColorChangerScreen> createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  int _backgroundColor = 0xFFFFFFFF;
  int _textColor = 0xFF000000;

  void _setRandomBackgroundColor() {
    _backgroundColor = ColorGenerator.getRandomColorValue();
    _textColor = ColorGenerator.calculateForegroundColor(_backgroundColor);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Color(_backgroundColor)),
          Center(
            child: Text(
              'Hello There!',
              style: TextStyle(
                fontSize: TextConstants.textSizeMedium,
                color: Color(_textColor),
              ),
            ),
          ),
          GestureDetector(
            onTap: _setRandomBackgroundColor,
          )
        ],
      ),
    );
  }
}
