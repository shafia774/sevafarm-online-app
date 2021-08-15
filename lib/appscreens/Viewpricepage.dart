import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'payment.dart';
import 'viewcartpage.dart';

class ViewpricePage extends StatefulWidget {
  @override
  _ViewpricePageState createState() => _ViewpricePageState();
}

class _ViewpricePageState extends State<ViewpricePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'VIEW PRICE',
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
        Container(
        padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
    child: Text(
    'The Total price is ',
    style:
    TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold,color:Colors.lightGreen),
    ),
    ),

    ],
    ),
    ),Container(padding: EdgeInsets.fromLTRB(240.0, 200.0, 0.0, 0.0),
        child: RaisedButton(
              child: Text('Place Order'),
              onPressed: () async {Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaymentPage()));
                Fluttertoast.showToast(
                  msg: "Order is placed successfully",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.greenAccent,
                  fontSize: 20.0,
                );
              })

      ),],),),);
  }
}