import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customTextFields extends StatelessWidget {
  var _controller = TextEditingController();
  final String labelText;

  customTextFields({
    Key? key,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8), // Padding of 8
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // Rounded borders
          ),
          labelText: labelText),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $labelText';
        }
        return null;
      },)
    );
  }

  String getController() {
    return _controller.text;
  }
}
