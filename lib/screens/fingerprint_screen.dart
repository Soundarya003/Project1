import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:whatsloan/screens/aadharLogin_screen.dart';

class FingerprintScreen extends StatefulWidget {
  static const String id = 'fingerprint_screen';
  const FingerprintScreen({Key? key}) : super(key: key);

  @override
  State<FingerprintScreen> createState() => _FingerprintScreenState();
}

class _FingerprintScreenState extends State<FingerprintScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.all(0.2*screenWidth),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    'Input your fingerprint',
                  style: TextStyle(
                      color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 0.05*screenWidth
                  ),
                ),
                SizedBox(height: 0.05*screenWidth,),
                Text(
                    'Please place applicant finger into the biometric device',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 0.1*screenWidth,),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context, AadharLogin.id);
                }, child: Text('Go to next screen'))
              ],
            ),
          ),
        )
    );
  }
}
