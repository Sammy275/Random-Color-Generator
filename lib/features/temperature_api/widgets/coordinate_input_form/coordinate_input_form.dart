import 'package:color_generator/features/temperature_api/helpers/weather_service.dart';
import 'package:flutter/material.dart';

import './custom_text_field.dart';
import '../../../../app_constants/text_constants.dart';

class CoordinateInputForm extends StatefulWidget {
  final Function(double) callback;

  /// Displays the fields to enter coordinates.
  /// Validates the input.
  /// Sends the data to weather api and gets the temperature as response
  CoordinateInputForm(this.callback, {Key? key}) : super(key: key);

  @override
  State<CoordinateInputForm> createState() => _CoordinateInputFormState();
}

class _CoordinateInputFormState extends State<CoordinateInputForm> {
  bool _loading = false;

  final TextEditingController _latitudeController = TextEditingController();

  final TextEditingController _longitudeController = TextEditingController();

  Future<void> _getTemperatureFromApi() async {
    final double latitude;
    final double longitude;
    try {
      latitude = double.parse(_latitudeController.text);
      longitude = double.parse(_longitudeController.text);
    } catch (e) {
      throw Exception('Wrong input');
    }

    final double temperature =
        await WeatherService.getTemperatureFromAPI(latitude, longitude);

    widget.callback(temperature);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(_latitudeController, 'Latitude'),
        const SizedBox(height: 20.0),
        CustomTextField(_longitudeController, 'Longitude'),
        const SizedBox(height: 30.0),
        ElevatedButton(
          onPressed: _loading
              ? () {}
              : () async {
                  setState(() {
                    _loading = true;
                  });
                  try {
                    await _getTemperatureFromApi();
                  } catch (e) {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }

                  setState(() {
                    _loading = false;
                  });
                },
          child: _loading
              ? Container(
                  padding: const EdgeInsets.all(10.0),
                  child: const CircularProgressIndicator(color: Colors.white),
                )
              : const Text(
                  'Get Temperature',
                  style: TextStyle(fontSize: TextConstants.textSizeSmall),
                ),
        ),
      ],
    );
  }
}
