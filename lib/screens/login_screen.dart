import 'package:flutter/material.dart';
import 'package:whatsloan/screens/starting_screen.dart';
import 'package:whatsloan/widgets/black_button.dart';
import 'package:whatsloan/screens/aadharLogin_screen.dart';
import 'package:whatsloan/API/networking.dart';
import 'package:whatsloan/screens/fingerprint_screen.dart';


class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  late Map<String, dynamic> accumulatedData;
  LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String chosenOption = '';
  TextEditingController _loginID = TextEditingController();

  static const URL =
      'https://kccnewuat.unionbankofindia.co.in/v1/users/getUserVerified';
  var jsonData;
  Future<void> loadJsonAsset(String user_id, String type) async {
    NetworkHelper networkHelper = NetworkHelper(URL);
    var data = await networkHelper.postData(user_id, type);
    print(data);
    setState(() {
      jsonData = data;
    });
  }

  void _confirmDialog(BuildContext context, String info) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            contentPadding: EdgeInsets.all(20.0),
            insetPadding: EdgeInsets.all(30.0),
            title: Text('Are you ${info}, Please confirm', textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                        ),
                        onPressed: () =>
                        {
                          Navigator.pushNamed(context, FingerprintScreen.id)},
                        child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'YES',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                        ),
                        onPressed: () => {
                          Navigator.pop(context)
                        },
                        child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'NO',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }

  void _loadingDialog(BuildContext context){
    showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            content: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Please wait'),
                SizedBox(width: 8),
                CircularProgressIndicator(),
              ],
            ),
          );
        }
    );
  }

  void _hideDialog(){
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Map<String, String> information = ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    chosenOption = (information['type']=='bc_assisted') ? 'BC':'Bank';
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Transform.scale(
                scale: 0.5, // Set the scale factor to 0.5 for half the original size
                child: Image.asset('images/logo2.png'),
              ),
              SizedBox(height: screenHeight*0.02,),
              Text(
                'Login for ${chosenOption}',
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
                controller: _loginID,
                decoration: InputDecoration(hintText: 'Enter ID', counterText: ''),
                keyboardType: TextInputType.number,
                maxLength: 6,
              ),
              SizedBox(height: screenHeight*0.5,),
              DisabledBlackButton(buttonName: 'CONTINUE', onPressed: () async {
                if(_loginID.text.length >= 5){
                  Navigator.pushNamed(context, FingerprintScreen.id);
                  // loadJsonAsset(_loginID.text, information['type']!);
                  // print(jsonData);
                  // try{
                  //   _loadingDialog(context);
                  //   await Future.delayed(Duration(seconds: 3));
                  //   if(jsonData['success']){
                  //     _hideDialog();
                  //     _confirmDialog(context, jsonData['result']['referenceName']);
                  //   }
                  //   else{
                  //     _hideDialog();
                  //     showDialog(context: context, builder: (BuildContext context) {return AlertDialog(title: Text(jsonData['message']));});
                  //   }
                  // }catch(error){
                  //    print('Error ${error}');
                  //    _hideDialog();
                  // }
                  // information.addAll({
                  //   'user_id' : _loginID.text
                  // });
                }
              }, buttonColor: _loginID.text.length >= 5 ? Colors.black : Colors.grey,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
