import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  late List<String> list1;
  late Function(String?)? onPressed;
  late String hintText;
  late Function(String?)? onSaved;

  DropDown({required this.onPressed, required this.list1, required this.hintText, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select an option';
        }
        return null;
      },
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black), // Set the color here
        ),
      ),
      hint: Text(hintText),
      isExpanded: true, // Set this property to true
      onChanged: onPressed,
      items: list1.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
