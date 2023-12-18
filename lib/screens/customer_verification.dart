import 'package:flutter/material.dart';

class CustomerVerification extends StatefulWidget {
  const CustomerVerification({Key? key}) : super(key: key);
  static const String id = 'customerVerification_screen';

  @override
  State<CustomerVerification> createState() => _CustomerVerificationState();
}

class _CustomerVerificationState extends State<CustomerVerification> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Show AlertDialog after a short delay
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _showOpeningDialog(context);
    });
  }
  void _showOpeningDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            contentPadding: EdgeInsets.all(20.0),
            insetPadding: EdgeInsets.all(30.0),
            title: Text('Your Reference No'),
            content: Text('Dear Customer, Your Loan reference No is UBIKCC00000828'),
            actions: <Widget>[
              Row(
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
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black, padding: EdgeInsets.symmetric(horizontal: 20.0), ),
                      onPressed: () => {
                        Navigator.pop(context)
                      },
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'OK',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ],
              )
            ],
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text('UBI BC Assist')
                ],
              ),
            ),
          )
        )
    );
  }
}
