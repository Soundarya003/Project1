import 'package:flutter/material.dart';

class Agreement extends StatefulWidget {
  static const String id = 'landVerification_id';
  const Agreement({Key? key}) : super(key: key);

  @override
  State<Agreement> createState() => _AgreementState();
}

class _AgreementState extends State<Agreement> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFFCFBF4),
          body: SingleChildScrollView(
            child: Column(

            ),
          ),
    )
    );
  }
}
