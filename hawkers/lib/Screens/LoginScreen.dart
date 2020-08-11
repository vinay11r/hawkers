import 'package:flutter/material.dart';
import 'package:hawkers/Screens/Registration.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:convert';
import 'package:hawkers/Provider/userProvider.dart';
import 'package:hawkers/Screens/Otp.dart';

class Login extends StatefulWidget {
  static const routeName = '/Login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _mobileController = new TextEditingController();

  String _mobile;

  bool loading = false;
  _login() async {
    _mobile = _mobileController.text;
//

    if (_mobile != '') {
      String body = json.encode({
        "mobile": _mobile,
      });
      setState(() {
        loading = true;
      });
      final response =
          await Provider.of<User>(context, listen: false).login(body);

      setState(() {
        loading = true;
      });

      if (response.success == true) {
        _mobileController.clear();
        Navigator.of(context).pushNamed(Otp.routeName);
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text(
            'My Account',
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 60, 30, 0),
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 35, 260, 0),
                child: Text('Mobile',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(9, 0, 0, 0),
                child: Container(
                    margin: EdgeInsets.all(0),
                    height: 38,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(5)),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                          child: Text('+91',
                              style:
                                  TextStyle(fontSize: 19, color: Colors.black)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(38, 0, 0, 4),
                          child: Container(
                              child: TextField(
                            controller: _mobileController,
                            textAlign: TextAlign.start,
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black, fontSize: 19),
                            //     color:Colors.grey,

                            decoration: InputDecoration(
                              border: InputBorder.none,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                          )),
                        )
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 35, 200, 0),
                child: Text(
                  'Important Tip:',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 25, 174, 0),
                child: Text(
                  'The Hawkers is...',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _login();
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Container(
                    height: 38,
                    width: 400,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5)
//      border: Border(
//        right: BorderSide(
//          color: Colors.black,
//          width: 8.0,
//        ),
//        bottom: BorderSide(
//          color: Colors.black,
//          width: 7.0,
//        ),
//        left: BorderSide(
//          color: Colors.black,
//          width: 2.0,
//        ),
//        top: BorderSide(
//          color: Colors.black,
//          width: 2.0,
//        ),
//      )
                        ),
                    child: Text('Request OTP',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(Registration.routeName);
                    },
                    child: Text('Create one',
                        style: TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
