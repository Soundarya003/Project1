import 'package:flutter/material.dart';
import 'package:whatsloan/screens/biometric.dart';
import 'package:whatsloan/widgets/black_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.scale(
              scale: 0.5, // Set the scale factor to 0.5 for half the original size
              child: Image.asset('images/unionbank_logo.png'),
            ),
            SizedBox(height: screenHeight*0.02,),
            Text(
              'Login for BC',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 0.06* screenWidth,
              ),
            ),
            SizedBox(height: screenHeight*0.015,),
            Text('Enter your ID to continue', style: TextStyle(fontSize: 0.04*screenWidth),),
            SizedBox(height: screenHeight*0.05,),
            TextField(
              decoration: InputDecoration(hintText: 'Enter ID'),
            ),
            SizedBox(height: screenHeight*0.5,),
            BlackButton(buttonName: 'CONITNUE', onPressed: (){
              Navigator.pushNamed(context, BiometricScreen.id);
            })
          ],
        ),
      ),
    ));
  }
}
