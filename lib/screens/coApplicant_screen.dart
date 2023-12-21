import 'package:flutter/material.dart';
import 'package:whatsloan/widgets/dropdown.dart';
import 'package:whatsloan/screens/customer_verification.dart';
import 'package:whatsloan/widgets/textfield.dart';

class CoApplicant extends StatefulWidget {

  static const String id = 'coApplicant_screen';
  @override
  State<CoApplicant> createState() => _CoApplicantState();
}
enum DocumentNeeded { PAN, VoterID }
class _CoApplicantState extends State<CoApplicant> {
  TextEditingController _aadharCard = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _fatherName = TextEditingController();
  TextEditingController _motherName = TextEditingController();
  TextEditingController _netWorth = TextEditingController();
  TextEditingController _panNo = TextEditingController();
  TextEditingController _voterNo = TextEditingController();

  List<String> religions = ['Hindu', 'Muslim', 'Christian', 'Other'];
  List<String> maritalStatus = ['Married', 'Unmarried'];
  List<String> socialCategory = ['General', 'OBC', 'SC', 'ST'];
  late String selected_religion, selected_marital, selected_social;
  DocumentNeeded _documentNeeded = DocumentNeeded.PAN;
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> applicantInformation = new Map<String,dynamic>();


  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: const Text(
          'Co- Applicant aadhaar verified successfully',
          style: TextStyle(fontSize: 15),
        ),
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
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
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                ),
                onPressed: () {
                   Navigator.pushNamed(context, CustomerVerification.id);
                },
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'OK',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale:
                    0.5, // Set the scale factor to 0.5 for half the original size
                    child: Image.asset('images/logo2.png'),
                  ),
                  SizedBox(
                    height: 0.02 * screenHeight,
                  ),
                  Text(
                    'Aadhar Verification',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 0.06 * screenWidth),
                  ),
                  SizedBox(
                    height: 0.01 * screenHeight,
                  ),
                  Text(
                    'Enter Co-applicant details',
                    style: TextStyle(
                        color: Colors.black, fontSize: 0.04 * screenWidth),
                  ),
                  SizedBox(
                    height: 0.02 * screenHeight,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              NumberTextField(
                                userhintText: 'Enter applicant mobile number', textEditingController: _mobile, maxLength: 10,

                              ),
                              NumberTextField(
                                userhintText: 'Enter aadhaar number', textEditingController: _aadharCard, maxLength: 12,

                              ),
                              StringTextField(
                                userhintText: 'Enter father name', textEditingController: _fatherName, maxLength: 100,

                              ),
                              StringTextField(
                                userhintText: 'Enter mother name',
                                textEditingController: _motherName, maxLength: 100,
                              ),
                              DropDown(
                                onPressed: (String? newValue) {
                                  setState(() {
                                    selected_religion = newValue!;
                                  });
                                },
                                list1: religions,
                                hintText: 'Select religion',
                                onSaved: (String? value) {

                                },
                              ),
                              DropDown(
                                onPressed: (String? newValue) {
                                  setState(() {
                                    selected_social = newValue!;
                                  });
                                },
                                list1: socialCategory,
                                hintText: 'Select social category',
                                onSaved: (String? value) {

                                },
                              ),
                              DropDown(
                                onPressed: (String? value) {
                                  setState(() {
                                    selected_marital = value!;
                                  });
                                },
                                list1: maritalStatus,
                                hintText: 'Choose marital status',
                                onSaved: (String? value) {

                                },
                              ),
                              NumberTextField(
                                userhintText: 'Enter net worth', textEditingController: _netWorth, maxLength: 100,

                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      title: Text('PAN'),
                                      leading: Radio<DocumentNeeded>(
                                        value: DocumentNeeded.PAN,
                                        groupValue: _documentNeeded,
                                        onChanged: (DocumentNeeded? value) {
                                          setState(() {
                                            _documentNeeded = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('Voter ID'),
                                      leading: Radio<DocumentNeeded>(
                                        value: DocumentNeeded.VoterID,
                                        groupValue: _documentNeeded,
                                        onChanged: (DocumentNeeded? value) {
                                          setState(() {
                                            _documentNeeded = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              if (_documentNeeded == DocumentNeeded.PAN)
                                NumberTextField(
                                  userhintText: 'Enter PAN no', textEditingController: _panNo, maxLength: 10,

                                )
                              else
                                StringTextField(
                                  userhintText: 'Enter VOTER ID number', textEditingController: _voterNo, maxLength: 12,

                                )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 0.05 * screenHeight,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print('Hello');
                                print(_panNo.text);
                                _showDialog(context);
                              }
                            },
                            style:
                            TextButton.styleFrom(backgroundColor: Colors.black),
                            child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'CONTINUE',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
