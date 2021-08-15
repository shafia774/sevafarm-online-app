import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:fluttertoast/fluttertoast.dart';


class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  var _payment=['SELECT YOUR PAYMENT METHOD','CASH ON DELIVERY','UPI'];
  var currentMethodSelected='SELECT YOUR PAYMENT METHOD';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'PAYMENT',
          style: TextStyle(
              fontFamily: 'Varela', fontSize: 20.0, color: Color(0xFF46EA13)),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                SizedBox(height: 20),
                    DropdownButton<String>(
                      items:_payment.map((String dropDownStringItem)
                      {
                        return DropdownMenuItem<String>(
                          value:dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );

                      }).toList(),
                      onChanged: (String newValue) {
                        setState(() {
                          this.currentMethodSelected=newValue;
                        });
                      },
                      value: this.currentMethodSelected,


                    )


              ],
            ),
          ),Container(padding: EdgeInsets.fromLTRB(240.0, 200.0, 0.0, 0.0),
              child: RaisedButton(
                  child: Text('PAY'),
                  onPressed: () async {
                  Fluttertoast.showToast(
                    msg: "PAYMENT successfull",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.greenAccent,
                    fontSize: 20.0,
                  );
                  })

          ),],),),);
  }
}