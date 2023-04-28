import 'package:flutter/material.dart';

import '../widgets/temperature_widget.dart';
import '../widgets/coordinate_input_form/coordinate_input_form.dart';
import '../../../helpers/color_generator.dart';

class DisplayTemperatureScreen extends StatefulWidget {
  /// Name of the route for the screen
  static const String routeName = '/display-temperature-screen';

  /// Screen that will display the temperature of a place
  const DisplayTemperatureScreen({Key? key}) : super(key: key);

  @override
  State<DisplayTemperatureScreen> createState() =>
      _DisplayTemperatureScreenState();
}

class _DisplayTemperatureScreenState extends State<DisplayTemperatureScreen> {
  double temperature = 0.0;
  int _backgroundColor = 0xFFFFFFFF;

  void setTemperature(double newTemperature) {
    temperature = newTemperature;
    _backgroundColor = ColorGenerator.convertTemperatureToColor(temperature);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Color(_backgroundColor),
        padding: const EdgeInsets.symmetric(horizontal: 70.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TemperatureWidget(temperature.toStringAsFixed(2)),
              const SizedBox(height: 30.0),
              CoordinateInputForm(setTemperature),
            ],
          ),
        ),
      ),
    );
  }
}
