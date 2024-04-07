import 'package:flutter/material.dart';

class ButtonPressed extends StatelessWidget {
  late String buttonName;
  late Function()? onPressed;
  ButtonPressed({required this.buttonName, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.6,
      padding: EdgeInsets.all(18.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0)),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white
        ),
          onPressed: onPressed,
          child: Text(buttonName, style: TextStyle(color: Color(0xFFDB2016), fontSize: 18, fontWeight: FontWeight.w700),)),
    );
  }
}
