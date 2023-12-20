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
  Future<bool> authenticate() async {
    try {
      var localAuth = LocalAuthentication();
      bool canCheckBiometrics = await localAuth.canCheckBiometrics;
      List<BiometricType> availableBiometrics = await localAuth.getAvailableBiometrics();

      if (canCheckBiometrics && availableBiometrics.isNotEmpty) {
        // Authenticate using biometrics
        return await localAuth.authenticate(
          localizedReason: 'Authenticate to access the app',

        );
      } else {
        // Biometrics not available on the device
        print('Biometrics not available');
        return false;
      }
    } catch (e) {
      print('Error during biometric authentication: $e');
      return false;
    }
  }

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
                ElevatedButton(
                  onPressed: () async {
                    bool isAuthenticated = await authenticate();
                    if (isAuthenticated) {
                      print('Authentication successful');
                      Navigator.pushNamed(context, AadharLogin.id);
                    } else {
                      print('Authentication failed');
                    }
                  },
                  child: Text('Authenticate with Fingerprint'),
                ),
              ],
            ),
          ),
        )
    );
  }
}
