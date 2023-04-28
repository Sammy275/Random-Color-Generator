import 'package:flutter/material.dart';

import '../../../app_constants/text_constants.dart';

class TemperatureWidget extends StatelessWidget {
  final String labelText;
  /// A simple container widget that displays the text given as parameter.
  const TemperatureWidget(this.labelText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red[900]!, Colors.red],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        shape: BoxShape.circle,
      ),
      child: Text(
        '$labelText C',
        style: const TextStyle(
          fontSize: TextConstants.textSizeMedium,
          color: Colors.white,
        ),
      ),
    );
  }
}
