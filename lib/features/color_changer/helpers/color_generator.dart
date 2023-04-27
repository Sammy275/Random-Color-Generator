import 'dart:math';

import 'package:flutter/material.dart' show Color;

/// This class provides methods to generate values for colors in hex.
/// If needed then more methods can be added for specific needs.
class ColorGenerator {
  static const int _maxColorRange = 4294967295;

  static const int _blackColor = 0xFF000000;
  static const int _whiteColor = 0xFFFFFFFF;

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
}
