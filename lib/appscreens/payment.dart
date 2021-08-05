import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:fluttertoast/fluttertoast.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {





@override
Widget build(BuildContext context) {
  return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'PAYMENT',
                    style:
                    TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold,color:Colors.lightGreen),
                  ),
                ),

              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'ENTER DEBIT CARD NO',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'ENTER MOBILE NO ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),

                  ),
                  SizedBox(height: 10.0),
                  TextField(keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'ENTER OTP ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () {

                        },
                        child:

                        Center(
                          child: Text('GET OTP',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ),


                      ),
                    ),),
                  SizedBox(height: 20.0),
                  Container(height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.lightGreen,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            Fluttertoast.showToast(
                              msg: "Payment has been done successfully",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.blueAccent,
                              fontSize: 15.0,
                            );Navigator.of(context).pop();},
                          child: Center(
                            child: Text(
                              'PAY',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      )
                  ),
                ],
              )),
          // SizedBox(height: 15.0),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text(
          //
          //       style: TextStyle(
          //         fontFamily: 'Montserrat',
          //       ),
          //     ),
          //     SizedBox(width: 5.0),
          //     InkWell(
          //       child: Text('Register',
          //           style: TextStyle(
          //               color: Colors.green,
          //               fontFamily: 'Montserrat',
          //               fontWeight: FontWeight.bold,
          //               decoration: TextDecoration.underline)),
          //     )
          //   ],
          // )
        ]),
      ));
}
}

