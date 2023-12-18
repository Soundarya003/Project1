import 'package:flutter/material.dart';

class BlackButton extends StatelessWidget {
  late String buttonName;
  late Function()? onPressed;
  BlackButton({required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              buttonName,
              style: TextStyle(color: Colors.white),
            )),
        style: TextButton.styleFrom(backgroundColor: Colors.black),
      ),
    );
  }
}


