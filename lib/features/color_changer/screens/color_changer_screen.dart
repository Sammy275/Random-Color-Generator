import 'package:flutter/material.dart';

import '../../../app_constants/text_constants.dart';
import '../../../helpers/color_generator.dart';
import '../../temperature_api/screens/display_temperature_screen.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello There!',
                  style: TextStyle(
                    fontSize: TextConstants.textSizeMedium,
                    color: Color(_textColor),
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Press long enough to get weather details',
                  style: TextStyle(
                    fontSize: TextConstants.textSizeSmall,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: _setRandomBackgroundColor,
            onLongPress: () => Navigator.of(context)
                .pushNamed(DisplayTemperatureScreen.routeName),
          )
        ],
      ),
    );
  }
}
