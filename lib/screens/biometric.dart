import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:whatsloan/screens/fingerprint_screen.dart';
import 'package:whatsloan/widgets/black_button.dart';

class BiometricScreen extends StatefulWidget {
  const BiometricScreen({Key? key}) : super(key: key);
  static const String id = 'biometric_screen';

  @override
  State<BiometricScreen> createState() => _BiometricScreenState();
}

class _BiometricScreenState extends State<BiometricScreen> {
  final LocalAuthentication auth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Transform.scale(
                  scale:
                  0.5, // Set the scale factor to 0.5 for half the original size
                  child: Image.asset('images/logo2.png'),
                ),
                SizedBox(height: screenHeight*0.05,),
                Text(
                    'Initiate biometric \n application',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: screenWidth*0.06
                  ),
                ),
                SizedBox(height: screenHeight*0.03,),
                Text(
                    'Click on initiate biometric application button to get started',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth*0.04
                  ),
                ),
                SizedBox(height: screenHeight*0.20,),
                BlackButton(buttonName: 'INITIATE BIOMETRIC', onPressed: (){
                  Navigator.pushNamed(context, FingerprintScreen.id);
                }),
                SizedBox(height: screenHeight*0.05,),
                BlackButton(buttonName: 'DEVICE INFO', onPressed: (){})
              ],
            ),
          ),
        )
    );
  }
}
