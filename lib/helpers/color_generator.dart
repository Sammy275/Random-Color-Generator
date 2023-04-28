import 'dart:math';

import 'package:flutter/material.dart' show Color;

/// This class provides methods to generate values for colors in hex.
/// If needed then more methods can be added for specific needs.
class ColorGenerator {
  static const int _maxColorRange = 4294967295;

  static const int _blackColor = 0xFF000000;
  static const int _whiteColor = 0xFFFFFFFF;

  static const int _lightYellow = 0xFFFFE54D;
  static const int _darkYellow = 0xFFFFB700;
  static const int _orange = 0xFFFF7000;
  static const int _lightBlue = 0xFF00CCFF;
  static const int _darkBlue = 0xFF0067FF;

  /// Returns a random integer that represents a color in HEX value.
  static int getRandomColorValue() {
    return Random().nextInt(_maxColorRange);
  }

  /// Calculates the brightness of the provided color and returns a color value.
  /// The color value is either black or white.
  /// This method can be used to provide an appropriate foreground color.
  /// Please note that this method does not return accurate value all the time.
  static int calculateForegroundColor(int colorValue) {
    final Color color = Color(colorValue);

    // Calculate the HSP value of the color
    final double hsp = sqrt(0.299 * pow(color.red, 2) +
        0.587 * pow(color.green, 2) +
        0.114 * pow(color.blue, 2));

    bool isBright = false;

    if (hsp >= 127.5) {
      isBright = true;
    }

    // If the HSP value is greater than 100.5, use black text, otherwise use white text
    return isBright ? _blackColor : _whiteColor;
  }

  /// This method will convert the temperature to the appropriate color.
  /// Higher temperatures will return shades of yellow and lower temperatures will return shades of blue
  static int convertTemperatureToColor(double temperature) {
    int chosenColor;
    if (temperature >= 50.0) {
      chosenColor = _orange;
    } else if (temperature >= 40 && temperature < 50) {
      chosenColor = _darkYellow;
    } else if (temperature >= 30 && temperature < 40) {
      chosenColor = _lightYellow;
    } else if (temperature >= 20 && temperature < 30) {
      chosenColor = _lightBlue;
    } else if (temperature >= 10 && temperature < 20) {
      chosenColor = _darkBlue;
    } else {
      chosenColor = _whiteColor;
    }

    return chosenColor;
  }
}
