import 'dart:convert';
import 'auth.dart';
import 'username.dart';
import 'order-api.dart';
import 'package:flutter/material.dart';
import 'package:sevafarm_app/appscreens/signup.dart';
import 'package:sevafarm_app/appscreens/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;



class loginscreen extends StatefulWidget {
  @override
  _loginscreenState createState() => new _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  final user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Auth authUser;
  @override
  void initState() {
    super.initState();
  }



  Future login() async {
    var url = 'http://sevafarm-portal.000webhostapp.com/api/login.php';
    var response = await http.post(url, body: {
      "username": user.text,
      "password": pass.text,


    });


    var data = json.decode(response.body);
    print(data);

    if (data['status'] == "Success") {
      authUser = new Auth();
      authUser.setUserFromMap(data['user']);
      Fluttertoast.showToast(
        msg: data['message'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.greenAccent,
        fontSize: 20.0,
      );

      Navigator.push(context, MaterialPageRoute(builder: (context)=>homepage(),),);
    } else {
      Fluttertoast.showToast(
        msg: "Username or Password is Invalid",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.greenAccent,
        fontSize: 20.0,
      );
    }
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Container(
            child: Stack(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('LOGIN',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold,color:   const Color(0xFF424242) ))
                         )],
                        )
                                      ),Container(
          padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    labelText: 'USER ID',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))),
                controller: user,
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))),
                controller: pass,
                obscureText: true,
              ),
              SizedBox(height: 5.0),
              Container(
                alignment: Alignment(1.0, 0.0),
                padding: EdgeInsets.only(top: 15.0, left: 20.0),
                child: GestureDetector(
                  onTap: () {Navigator.push(context,
    MaterialPageRoute(builder: (context) => SignupPage()));

    },child: InkWell(
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',),
                  ),
                ),
                ),),SizedBox(height: 40.0),
              Container(
                height: 40.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Colors.greenAccent,
                  color: Colors.green,
                  elevation: 7.0,
                  child: GestureDetector(
                    onTap: () async{
    login();clearText();},
                    child: Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),],),);

  }
  void clearText() {
    pass.clear();

  }
}
