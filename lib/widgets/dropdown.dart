import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  late List<String> list1;
  late Function(String?)? onPressed;
  late String hintText;
  DropDown({required this.onPressed, required this.list1, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      hintText: hintText,
      inputDecorationTheme: InputDecorationTheme(),
      onSelected: onPressed,
      dropdownMenuEntries: list1.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
