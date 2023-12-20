import 'package:flutter/material.dart';
import 'package:whatsloan/widgets/dropdown.dart';
import 'package:whatsloan/screens/customer_verification.dart';

class CoApplicant extends StatefulWidget {

  static const String id = 'coApplicant_screen';
  @override
  State<CoApplicant> createState() => _CoApplicantState();
}
enum DocumentNeeded { PAN, VoterID }
class _CoApplicantState extends State<CoApplicant> {
  List<String> religions = <String>['Hindu', 'Muslim', 'Christian', 'Other'];
  String selected_region = 'One';
  DocumentNeeded _documentNeeded = DocumentNeeded.PAN;

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
                    child: Image.asset('images/unionbank_logo.png'),
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
                    'Enter co-applicant details',
                    style: TextStyle(
                        color: Colors.black, fontSize: 0.04 * screenWidth),
                  ),
                  SizedBox(
                    height: 0.02 * screenHeight,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Enter applicant mobile number'),
                        ),
                        TextField(
                          decoration:
                          InputDecoration(hintText: 'Enter aadhaar number'),
                        ),
                        TextField(
                          decoration:
                          InputDecoration(hintText: 'Enter father name'),
                        ),
                        TextField(
                          decoration:
                          InputDecoration(hintText: 'Enter mother name'),
                        ),
                        DropDown(
                          onPressed: (String? value) {
                            setState(() {
                              selected_region = value!;
                            });
                          },
                          list1: religions,
                          hintText: 'Select religion',
                        ),
                        DropDown(
                          onPressed: (String? value) {
                            setState(() {
                              selected_region = value!;
                            });
                          },
                          list1: religions,
                          hintText: 'Select social category',
                        ),
                        DropDown(
                          onPressed: (String? value) {
                            setState(() {
                              selected_region = value!;
                            });
                          },
                          list1: religions,
                          hintText: 'Choose marital status',
                        ),
                        TextField(
                          decoration: InputDecoration(hintText: 'Enter net worth'),
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
                          TextField(
                            decoration:
                            InputDecoration(hintText: 'Enter PAN number'),
                          )
                        else
                          TextField(
                            decoration:
                            InputDecoration(hintText: 'Enter Voter ID number'),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.05*screenHeight,),
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
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          title: const Text('Co - Applicant aadhaar verified successfully', style: TextStyle(fontSize: 15),),
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
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black, padding: EdgeInsets.symmetric(horizontal: 30.0), ),
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
                      ),
                      style: TextButton.styleFrom(backgroundColor: Colors.black),
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
            ),
          ),
        ));
  }
}
