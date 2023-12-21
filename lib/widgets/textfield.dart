import 'package:flutter/material.dart';

class StringTextField extends StatelessWidget {

  late String userhintText;
  late TextEditingController textEditingController;
  late int maxLength;
  StringTextField({required this.userhintText, required this.textEditingController, required this.maxLength});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      keyboardType: TextInputType.name,
      controller: textEditingController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the value';
        }
        return null;
      },
      decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black), // Set the color here
          ),
          hintText: userhintText,
        counterText: "",
      ),
    );
  }
}

class NumberTextField extends StatelessWidget {

  late String userhintText;
  late TextEditingController textEditingController;
  late int maxLength;
  NumberTextField({required this.userhintText, required this.textEditingController, required this.maxLength});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      controller: textEditingController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 15.0),
        counterText: "",
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black), // Set the color here
        ),
        hintText: userhintText,

      ),
    );
  }
}

