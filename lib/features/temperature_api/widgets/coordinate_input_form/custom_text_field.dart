import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  /// Text controller for the field
  TextEditingController controller;
  /// The label for the text field
  String labelText;

  /// Text Fields to get coordinate cata
  CustomTextField(this.controller, this.labelText);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black),
        color: Colors.white60,
      ),
      child: TextField(
        controller: controller,
        keyboardType:
            const TextInputType.numberWithOptions(signed: true, decimal: true),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.black),
          floatingLabelStyle: const TextStyle(color: Colors.black54),
        ),
      ),
    );
  }
}
