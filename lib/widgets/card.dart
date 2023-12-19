import 'package:flutter/material.dart';
class CreamCard extends StatelessWidget {

  late String heading, content;
  CreamCard({required this.heading, required this.content});
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Color(0xFFFCFBF4),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(heading),
            SizedBox(height:5.0),
            Text(content, style: TextStyle(fontWeight: FontWeight.w700),),
          ],
        ),
      ),
    );
  }
}
