import 'package:flutter/material.dart';
import 'package:whatsloan/widgets/black_button.dart';
import 'package:whatsloan/widgets/dropdown.dart';
import 'package:whatsloan/widgets/textfield.dart';
import 'package:whatsloan/widgets/card.dart';

// ignore: prefer_expression_function_bodies

class CustomerVerification extends StatefulWidget {
  const CustomerVerification({Key? key}) : super(key: key);
  static const String id = 'customerVerification_screen';

  @override
  State<CustomerVerification> createState() => _CustomerVerificationState();
}

enum DifferentLoanAmount { Yes, No }

enum DocumentExecution { Digital }

class _CustomerVerificationState extends State<CustomerVerification> {
  late String district, Tehsil, Halka, Village;
  late int Khasara;
  late List<String> crops = ['Ragi', 'Rice', 'Wheat'];
  DifferentLoanAmount _differentLoanAmount = DifferentLoanAmount.Yes;
  DocumentExecution _documentExecution = DocumentExecution.Digital;
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool isLandVerification = false;
  bool isCropVerified = false;
  bool isSanction = false;
  bool fetchLandDetails = false;
  bool submitDetails1 = false;
  bool submitDetails2 = false;
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  TextEditingController _aadhar = TextEditingController();
  TextEditingController _district = TextEditingController();
  TextEditingController _tehsil = TextEditingController();
  TextEditingController _village = TextEditingController();
  TextEditingController _khasra = TextEditingController();
  TextEditingController _halka = TextEditingController();
  TextEditingController _estimatedLoan = TextEditingController();
  TextEditingController _requestedLoan = TextEditingController();
  String kharifCrop1 = '';
  String kharifCrop2 = '';
  String rabiCrop1 = '';
  String rabiCrop2 = '';
  List<String> kharifCrops = [
    'Wheat',
    'barley',
    'oat',
    'peas',
    'potato',
    'tomato',
    'beet',
    'cabbage',
    'alfalfa'
  ];
  List<String> rabiCrops = ['Barley', 'Gram', 'Rapeseed', 'Mustard', 'Oat', 'Wheat', 'Bajra'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Show AlertDialog after a short delay
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _showOpeningDialog(context);
    });
  }

  void _showOpeningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            contentPadding: EdgeInsets.all(20.0),
            insetPadding: EdgeInsets.all(30.0),
            title: Text('Your Reference No'),
            content: Text(
              'Dear Customer, Your Loan reference No is UBIKCC00000828\n\n '
              'Please use this Number along with your registered mobile number for futher logins. '
              'The reference number has been sent on your mobile no. and on the email-id registered with the bank.',
              textAlign: TextAlign.center,
            ),
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                      ),
                      onPressed: () => {Navigator.pop(context)},
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
        });
  }

  void _showClosingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            contentPadding: EdgeInsets.all(20.0),
            insetPadding: EdgeInsets.all(30.0),
            content: Text(
              'Thanks for Opting for Digital Document Execution, '
              'you will receive a SMS from NeSL on your registered mobile number to initiate e-sign. '
              'Please read through the document before signing it.',
              textAlign: TextAlign.center,
            ),
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                      ),
                      onPressed: () => {
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'UBI BC Assist',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        Container(
                          color: Colors
                              .black, // Set the background color for the row
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Customer Details',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.check_circle,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Enter customer aadhar number',
                                  )),
                              NumberTextField(
                                  userhintText: 'Enter your aadhar number',
                                  textEditingController: _aadhar,
                                  maxLength: 12),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                'PRATAP SINGH',
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text('VERIFY'),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30.0)),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          color: Colors
                              .black, // Set the background color for the row
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Land Details',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Select District',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15.0),
                                ),
                                StringTextField(
                                    userhintText: 'Select District',
                                    textEditingController: _district,
                                    maxLength: 100),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const Text(
                                  'Select Tehsil',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15.0),
                                ),
                                StringTextField(
                                    userhintText: 'Select Tehsil',
                                    textEditingController: _tehsil,
                                    maxLength: 100),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const Text(
                                  'Select Halka',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15.0),
                                ),
                                StringTextField(
                                    userhintText: 'Select Halka',
                                    textEditingController: _halka,
                                    maxLength: 100),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const Text(
                                  'Select Village',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15.0),
                                ),
                                StringTextField(
                                    userhintText: 'Select Village',
                                    textEditingController: _village,
                                    maxLength: 100),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const Text(
                                  'Enter Khasra',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15.0),
                                ),
                                NumberTextField(
                                    userhintText: 'Select Khasra',
                                    textEditingController: _khasra,
                                    maxLength: 100),
                                const SizedBox(
                                  height: 25.0,
                                ),
                                DisabledBlackButton(
                                  buttonName: 'FETCH LAND DETAILS',
                                  onPressed: fetchLandDetails
                                      ? null
                                      : () {
                                          setState(() {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              isLandVerification = true;
                                              fetchLandDetails = true;
                                            }
                                          });
                                        },
                                  buttonColor: fetchLandDetails
                                      ? Colors.grey
                                      : Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                        // LAND VERIFICATION
                        Visibility(
                          visible: isLandVerification,
                          child: Table(
                            border: TableBorder.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 0.5),
                            children: [
                              TableRow(children: [
                                const TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        8.0), // Add padding as needed
                                    child: Align(
                                      alignment: Alignment
                                          .centerLeft, // Align content to the left
                                      child: Text('District'),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        8.0), // Add padding as needed
                                    child: Align(
                                      alignment: Alignment
                                          .centerLeft, // Align content to the left
                                      child: Text(_district.text),
                                    ),
                                  ),
                                ),
                              ]),
                               TableRow(children: [
                                const TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        8.0), // Add padding as needed
                                    child: Align(
                                      alignment: Alignment
                                          .centerLeft, // Align content to the left
                                      child: Text('Tehsil'),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        8.0), // Add padding as needed
                                    child: Align(
                                      alignment: Alignment
                                          .centerLeft, // Align content to the left
                                      child: Text(_tehsil.text),
                                    ),
                                  ),
                                ),
                              ]),
                              TableRow(children: [
                                const TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        8.0), // Add padding as needed
                                    child: Align(
                                      alignment: Alignment
                                          .centerLeft, // Align content to the left
                                      child: Text('Halka'),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        8.0), // Add padding as needed
                                    child: Align(
                                      alignment: Alignment
                                          .centerLeft, // Align content to the left
                                      child: Text(_halka.text),
                                    ),
                                  ),
                                ),
                              ]),
                              TableRow(children: [
                                const TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        8.0), // Add padding as needed
                                    child: Align(
                                      alignment: Alignment
                                          .centerLeft, // Align content to the left
                                      child: Text('Village'),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        8.0), // Add padding as needed
                                    child: Align(
                                      alignment: Alignment
                                          .centerLeft, // Align content to the left
                                      child: Text(_village.text),
                                    ),
                                  ),
                                ),
                              ]),
                              TableRow(children: [
                                const TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        8.0), // Add padding as needed
                                    child: Align(
                                      alignment: Alignment
                                          .centerLeft, // Align content to the left
                                      child: Text('Khasra No'),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        8.0), // Add padding as needed
                                    child: Align(
                                      alignment: Alignment
                                          .centerLeft, // Align content to the left
                                      child: Text(_khasra.text),
                                    ),
                                  ),
                                ),
                              ]),
                              TableRow(children: [
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        8.0), // Add padding as needed
                                    child: Align(
                                      alignment: Alignment
                                          .centerLeft, // Align content to the left
                                      child: Text('Land Area'),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        8.0), // Add padding as needed
                                    child: Align(
                                      alignment: Alignment
                                          .centerLeft, // Align content to the left
                                      child: Text('1.2750'),
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: isLandVerification,
                    child: Form(
                      key: _formKey1,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 40.0,
                                  decoration: BoxDecoration(color: Colors.black),
                                  child: Text(''),
                                ),
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Total land area of above khasaras (in hecatares'),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text('1.275')
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 50.0,
                                  decoration: BoxDecoration(color: Colors.black),
                                  child: Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Text(
                                        'Crops Proposed To Be Grown',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Table(
                                    border: TableBorder.all(color: Colors.black),
                                    children: [
                                      TableRow(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration:
                                            BoxDecoration(color: Colors.black),
                                            child: Padding(
                                                padding: EdgeInsets.all(15.0),
                                                child: Text(
                                                  '1. Kharif',
                                                  style:
                                                  TextStyle(color: Colors.white),
                                                )),
                                          ),
                                        ]
                                      ),
                                      TableRow(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: DropDown(
                                                  onPressed: (String? value) {
                                                    kharifCrop1 = value!;
                                                  },
                                                  list1: kharifCrops,
                                                  hintText: 'Choose a crop',
                                                  onSaved: (String? value) {
                                                    setState(() {
                                                      kharifCrop1 = value!;
                                                    });
                                                  }),
                                            )
                                          ]
                                      ),
                                      TableRow(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: DropDown(
                                                  onPressed: (String? value) {
                                                    kharifCrop2 = value!;
                                                  },
                                                  list1: kharifCrops,
                                                  hintText: 'Choose a crop',
                                                  onSaved: (String? value) {
                                                    setState(() {
                                                      kharifCrop2 = value!;
                                                    });
                                                  }),
                                            )
                                          ]
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Table(
                                    border: TableBorder.all(color: Colors.black),
                                    children: [
                                      TableRow(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 50.0,
                                              decoration:
                                              BoxDecoration(color: Colors.black),
                                              child: Padding(
                                                  padding: EdgeInsets.all(15.0),
                                                  child: Text(
                                                    '2. Rabi',
                                                    style:
                                                    TextStyle(color: Colors.white),
                                                  )),
                                            ),
                                          ]
                                      ),
                                      TableRow(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: DropDown(
                                                  onPressed: (String? value) {
                                                    rabiCrop1 = value!;
                                                  },
                                                  list1: rabiCrops,
                                                  hintText: 'Choose a crop',
                                                  onSaved: (String? value) {
                                                    setState(() {
                                                      rabiCrop1 = value!;
                                                    });
                                                  }),
                                            )
                                          ]
                                      ),
                                      TableRow(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(20.0),
                                              child: DropDown(
                                                  onPressed: (String? value) {
                                                    rabiCrop2 = value!;
                                                  },
                                                  list1: rabiCrops,
                                                  hintText: 'Choose a crop',
                                                  onSaved: (String? value) {
                                                    setState(() {
                                                      rabiCrop2 = value!;
                                                    });
                                                  }),
                                            )
                                          ]
                                      ),
                                    ],
                                  ),
                                ),
                                DisabledBlackButton(
                                  buttonName: 'SUBMIT DETAILS',
                                  onPressed: submitDetails1
                                      ? null
                                      : () {
                                          if (_formKey1.currentState!.validate()) {
                                            setState(() {
                                              isCropVerified = true;
                                              submitDetails1 = true;
                                            });
                                          }
                                        },
                                  buttonColor:
                                      isCropVerified ? Colors.grey : Colors.black,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Visibility(
                    visible: isCropVerified,
                    child: Container(
                      color: Colors.white,
                      child: Form(
                        key: _formKey2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(color: Colors.black),
                              child: Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    'Loan Amount Details',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Estimated Loan Amount'),
                                  NumberTextField(userhintText: 'Enter amount', textEditingController: _estimatedLoan, maxLength: 12),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                      'Would you like to request a different loan amount'),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: ListTile(
                                        title: Text('Yes'),
                                        leading: Radio<DifferentLoanAmount>(
                                          value: DifferentLoanAmount.Yes,
                                          groupValue: _differentLoanAmount,
                                          onChanged:
                                              (DifferentLoanAmount? value) {
                                            setState(() {
                                              _differentLoanAmount = value!;
                                            });
                                          },
                                        ),
                                      )),
                                      Expanded(
                                          child: ListTile(
                                        title: Text('No'),
                                        leading: Radio<DifferentLoanAmount>(
                                          value: DifferentLoanAmount.No,
                                          groupValue: _differentLoanAmount,
                                          onChanged:
                                              (DifferentLoanAmount? value) {
                                            setState(() {
                                              _differentLoanAmount = value!;
                                            });
                                          },
                                        ),
                                      ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text('Requested Loan Amount'),
                                  NumberTextField(userhintText: 'Enter amount', textEditingController: _requestedLoan, maxLength: 12),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                          checkColor: Colors.black,
                                          value: checkbox1,
                                          onChanged: (bool? selectedValue) {
                                            setState(() {
                                              checkbox1 = selectedValue!;
                                            });
                                          }),
                                      Expanded(
                                          child: Text(
                                              'I provide my consent to Bank to hold on selected operative towards recovery of dues.'))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                          checkColor: Colors.black,
                                          value: checkbox2,
                                          onChanged: (bool? selectedValue) {
                                            setState(() {
                                              checkbox2 = selectedValue!;
                                            });
                                          }),
                                      Expanded(
                                          child: Text(
                                              'I provide my consent for extraction of credit information report from CIC’s & also to disclose the information '
                                              'relating to credit facilities availed / to be availed.'))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  DisabledBlackButton(
                                    buttonName: 'SUBMIT DETAILS',
                                    onPressed: submitDetails2
                                        ? null
                                        : () {
                                      if (_formKey2.currentState!.validate() && checkbox1==true && checkbox2==true) {
                                        setState(() {
                                          isSanction = true;
                                          submitDetails2 = true;
                                        });
                                      }
                                      else{
                                        final snackBar = SnackBar(
                                          content: const Text('Agree to terms and conditions to proceed'),
                                          action: SnackBarAction(
                                            label: 'Ok',
                                            onPressed: () {

                                            },
                                          ),
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                      }
                                          },
                                    buttonColor: submitDetails2
                                        ? Colors.grey
                                        : Colors.black,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isSanction,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 30.0,
                                decoration: BoxDecoration(color: Colors.black),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                'Congratulations!',
                                style: TextStyle(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              Container(
                                height: 60.0,
                              ),
                              Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration:
                                          BoxDecoration(color: Colors.black),
                                      child: Padding(
                                          padding: EdgeInsets.all(15.0),
                                          child: Text(
                                            'Your loan has been Sanctioned',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ),
                                    CreamCard(
                                        heading: 'Loan Amount',
                                        content: 'Rs 160000'),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    CreamCard(
                                        heading: 'Rate of Interest',
                                        content: '9.30%p.a'),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    CreamCard(
                                        heading: 'Digital Convenience fee:',
                                        content:
                                            'Rs. 500 + GST (i.e Rs 590 at present, Non-Refundable)'),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    CreamCard(
                                        heading: '',
                                        content:
                                            '(Will be collected upfront from KCC Loan A/C'),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        children: [
                                          BlackButton(
                                              buttonName:
                                                  'VIEW SANCTION LETTER',
                                              onPressed: () {}),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          BlackButton(
                                              buttonName:
                                                  'VIEW LOAN APPLICATION',
                                              onPressed: () {})
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: BoxDecoration(color: Colors.black),
                                child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      'Documentation execution',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Text(
                                        'How would you want your loan documents to be executed'),
                                    SizedBox(height: 15.0),
                                    ListTile(
                                      title: Text('Digital'),
                                      leading: Radio(
                                          value: _documentExecution,
                                          groupValue: DocumentExecution.Digital,
                                          onChanged:
                                              (DocumentExecution? value) {
                                            setState(() {
                                              _documentExecution = value!;
                                            });
                                          }),
                                    ),
                                    BlackButton(
                                      buttonName: 'INITIATE ESIGN',
                                      onPressed: () {
                                        _showClosingDialog(context);
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(color: Colors.black),
                          child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                'ई-साइन (E-SIGN)',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        Padding(
                            padding: EdgeInsets.all(30.0),
                          child: Column(
                              children: [
                                Text('"आपके केसीसी ऋण दस्तावेज़ों पर सफलतापूर्वक ई-हस्ताक्षर कर दिए गए हैं!!"', textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w800),
                                ),
                                Text('"YOUR KCC LOAN DOCUMENTS HAVE BEEN E-SIGNED SUCCESSFULLY!!"', textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w800),
                                ),
                                SizedBox(height: 30.0,),
                                Text('हस्ताक्षरित दस्तावेज़', textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15.0),
                                ),
                                Text('(Signed Document)', textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w800),
                                ),
                                Icon(Icons.attachment, color: Colors.black,)
                              ],
                          ),
                        ),
                        Divider(color: Colors.black,),
                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              Text('एप्लिकेशन लेनदेन आईडी: MP_NESL00003019"', textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w800),
                              ),
                              Text('(Application Transaction ID)', textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w800),
                              ),
                              SizedBox(height: 30.0,),
                              Text('NeSL एनईएसएल लेनदेन आईडी: MP_NESL00003019', textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15.0),
                              ),
                              Text('(NESL Transaction ID)', textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w800),
                              ),
                              Icon(Icons.attachment, color: Colors.black,)
                            ],
                          ),
                        ),
                        Divider(color: Colors.black,),
                        BlackButton(buttonName: 'SUBMIT', onPressed: (){
                         
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(color: Colors.black),
                          child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                'संवितरण विवरण (Disbursement Details)',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        SizedBox(height: 20.0,),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 30.0),
                          child: Table(
                            border: TableBorder.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 0.5),
                            children: [
                              TableRow(
                                children: [
                                  Padding(padding: EdgeInsets.all(15.0),
                                   child: Text('आवेदक का नाम\nApplicant Name')),
                                  Padding(padding: EdgeInsets.all(15.0),
                                  child: Text('UDIT TIWARI',textAlign: TextAlign.right,))
                                ]
                              ),
                              TableRow(
                                  children: [
                                    Padding(padding: EdgeInsets.all(15.0),
                                        child: Text('आवेदन संख्या\nApplication No')),
                                    Padding(padding: EdgeInsets.all(15.0),
                                        child: Text('566805030000000066\n(Created On: July 10, 2023 10:33 AM)',textAlign: TextAlign.right,))
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    Padding(padding: EdgeInsets.all(15.0),
                                        child: Text('ऋण खाता संख्या\nLoan A/C No')),
                                    Padding(padding: EdgeInsets.all(15.0),
                                        child: Text('566805030000000066\n(Created On: July 10, 2023 10:33 AM)',textAlign: TextAlign.right,))
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    Padding(padding: EdgeInsets.all(15.0),
                                        child: Text('डिजिटल सुविधा शुल्क\nDigital Convenience Fee')),
                                    Padding(padding: EdgeInsets.all(15.0),
                                        child: Text('Rs. 500 + जीएसटी GST (i.e Rs. 590 at present, अप्रतिदेय या गैर वापसी Non - Refundable)',textAlign: TextAlign.right,))
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    Padding(padding: EdgeInsets.all(15.0),
                                        child: Text('स्टाम्प शुल्क\nStamp duty')),
                                    Padding(padding: EdgeInsets.all(15.0),
                                        child: Text('Nil',textAlign: TextAlign.right,))
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    Padding(padding: EdgeInsets.all(15.0),
                                        child: Text('दस्तावेज़ शुल्क\nDigital Convenience Fee')),
                                    Padding(padding: EdgeInsets.all(15.0),
                                        child: Text('Nil',textAlign: TextAlign.right,))
                                  ]
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
