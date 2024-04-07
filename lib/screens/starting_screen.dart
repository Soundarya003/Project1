import 'package:flutter/material.dart';
import 'package:whatsloan/widgets/btn_pressed_bg_color.dart';
import 'package:whatsloan/screens/login_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({Key? key}) : super(key: key);
  static const String id = 'selection_screen';
  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  late Map<String,String> information = new Map();
  late String buttonSelected;
  final Uri _url = Uri.parse('https://wa.me/phone=${9035702942}');
  launchApp() async {
    if (!await launchUrl(_url)) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("WhatsApp not installed")));
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'images/farming.png',
            fit: BoxFit.fill,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonPressed(
                    buttonName: 'BC Assisted',
                    onPressed: () {
                      information.addAll({
                        'type': 'bc_assisted'
                      });
                      Navigator.pushNamed(context, LoginScreen.id,
                          arguments: information);
                    }),
                SizedBox(
                  height: 30.0,
                ),
                ButtonPressed(
                    buttonName: 'Bank Assisted',
                    onPressed: () {
                      information.addAll({
                        'type': 'bank_assisted'
                      });
                      Navigator.pushNamed(context, LoginScreen.id, arguments: information);
                    })
              ],
            ),
          )
        ],
      ),
    ));
  }
}
