import 'package:flutter/material.dart';
import 'package:whatsloan/widgets/black_button.dart';

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
            content: Text(
              'Dear Customer, Your Loan reference No is UBIKCC00000828\n\n '
                  'Please use this Number along with your registered mobile number for futher logins. '
                  'The reference number has been sent on your mobile no. and on the email-id registered with the bank.',
              textAlign: TextAlign.center,),
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
          appBar: AppBar(
            title: Text('UBI BC Assist', style: TextStyle(color: Colors.black, ),),
            backgroundColor: Colors.white,
          ),
          backgroundColor: Color(0xFFFCFBF4),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white
                    ),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.black, // Set the background color for the row
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Customer Details', style: TextStyle(color: Colors.white)
                              ,), Icon(Icons.check_circle, color: Colors.white,)],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Align( alignment: Alignment.centerLeft, child: Text('Enter customer aadhar number',)),
                              TextField(decoration: InputDecoration(hintText: '8520002434'),keyboardType: TextInputType.number,),
                              SizedBox(height: 20.0,),
                              Text('PRATAP SINGH', style: TextStyle(fontWeight: FontWeight.w800),),
                              SizedBox(height: 15.0,),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                                child: ElevatedButton(
                                  onPressed: (){}, child: Text('VERIFY'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                    padding: EdgeInsets.symmetric(horizontal: 30.0)
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          color: Colors.black, // Set the background color for the row
                          padding: EdgeInsets.all(16.0),
                          child: Text('Land Details', style: TextStyle(color: Colors.white)
                            ,),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Select District',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 15.0),),
                              TextField(decoration: InputDecoration(hintText: 'Select district', labelStyle: TextStyle(fontSize: 15.0)),),
                              SizedBox(height: 10.0,),
                              Text('Select Tehsil',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 15.0),),
                              TextField(decoration: InputDecoration(hintText: 'Select Tehisl', labelStyle: TextStyle(fontSize: 15.0)),),
                              SizedBox(height: 10.0,),
                              Text('Select Halka',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 15.0),),
                              TextField(decoration: InputDecoration(hintText: 'Select Halka', labelStyle: TextStyle(fontSize: 15.0)),),
                              SizedBox(height: 10.0,),
                              Text('Select Village',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 15.0),),
                              TextField(decoration: InputDecoration(hintText: 'Select Village', labelStyle: TextStyle(fontSize: 15.0)),),
                              SizedBox(height: 10.0,),
                              Text('Enter Khasra',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 15.0),),
                              TextField(decoration: InputDecoration(hintText: 'Enter Khasra No', labelStyle: TextStyle(fontSize: 15.0)),),
                              SizedBox(height: 25.0,),
                              BlackButton(buttonName: 'FETCH LAND DETAILS', onPressed: (){})
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ),
          )
        )
    );
  }
}
