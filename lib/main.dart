import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsloan/screens/login_screen.dart';
import 'package:whatsloan/screens/biometric.dart';
import 'package:whatsloan/screens/fingerprint_screen.dart';
import 'package:whatsloan/screens/aadharLogin_screen.dart';
import 'package:whatsloan/screens/customer_verification.dart';
import 'package:whatsloan/screens/agreement.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        BiometricScreen.id: (context) => BiometricScreen(),
        FingerprintScreen.id : (context) => FingerprintScreen(),
        AadharLogin.id : (context) => AadharLogin(),
        CustomerVerification.id :(context) => CustomerVerification(),
        Agreement.id : (context) => Agreement(),
      },
    );
  }
}


