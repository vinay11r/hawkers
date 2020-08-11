import 'package:flutter/material.dart';
import 'package:hawkers/Screens/LoginScreen.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:convert';
import 'package:hawkers/Provider/userProvider.dart';

class Registration extends StatefulWidget {
  static const routeName = '/Registration';
  @override
  _RegistrationState createState() => _RegistrationState();

}

class _RegistrationState extends State<Registration> {
  TextEditingController _mobileController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _firstnameController = new TextEditingController();
  TextEditingController _lastnameController = new TextEditingController();
  TextEditingController _cityController = new TextEditingController();
  TextEditingController _streetaddressController = new TextEditingController();
  TextEditingController _stateController = new TextEditingController();
  TextEditingController _pincodeController = new TextEditingController();
  String _mobile;
  String _email;
  String _firstname;
  String _lastname;
  String _city;
  String _streetaddress;
  String _state;
  String _pincode;
  bool loading = false;

   _registerUser() async {
     _mobile = _mobileController.text;
     _firstname = _firstnameController.text;
     _lastname = _lastnameController.text;
     _email = _emailController.text;
     _state = _stateController.text;
     _city = _cityController.text;
     _pincode = _pincodeController.text;
     _streetaddress = _streetaddressController.text;

     if (_mobile != '' && _email != '' && _firstname != '' && _lastname != '' &&
         _city != '' && _state != '' && _streetaddress != '' &&
         _pincode != '') {
       String body = json.encode({
         'email': _email,
         'mobile': _mobile,
         'firstname': _firstname,
         'lastname': _lastname,
         'city': _city,
         'state': _state,
         'stateaddress': _streetaddress,
         'pincode': _pincode
       });
       setState(() {
         loading = true;
       });
       final response =
       await Provider.of<User>(context, listen: false).register(body);
       if (response.success == true) {
         _mobileController.clear();
         _firstnameController.clear();
         _lastnameController.clear();
         _emailController.clear();
         _cityController.clear();
         _stateController.clear();
         _streetaddressController.clear();
         _pincodeController.clear();

         Navigator.of(context).pushNamed(Login.routeName);
       } else {

       }
     }
   }

  @override

  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Text(
            'My Account',
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 7, 50, 0),
          child: Container(
              child: Column(
            children: [
              Field("First Name*",_firstnameController),
              SizedBox(
                height: 20,
              ),
              Field('Last Name*',_lastnameController),
              SizedBox(
                height:  20
              ),
              Field('Mobile Number*',_mobileController),
              SizedBox(
                height: 20,
              ),
              Field('Email Address',_emailController),
              SizedBox(
                height: 20,
              ),
              Field('Street Address',_streetaddressController),
              SizedBox(
                height:  20,
              ),
              Place('City*',_cityController),
              SizedBox(
                height:  20,
              ),
              Place('State*',_stateController),
              SizedBox(
                height: 20,
              ),
              Field('Pincode*',_pincodeController),
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.check_box_outline_blank),
                  SizedBox(
                    width: 6,
                  ),
                  Text('Recieve news and product updates',style:TextStyle(
                    fontSize: 18,
                    color:Colors.black,
                    fontWeight: FontWeight.w400
                  ))
                ],
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: (){
                  _registerUser();
                },
                child: Container(
                  height: 38,
                //  width: 400,
                  alignment: Alignment.center,

                  decoration: BoxDecoration(
                      color: Colors.green,
borderRadius: BorderRadius.circular(5)

//                      border: Border(
//                        right: BorderSide(
//                          color: Colors.black,
//                          width: 8.0,
//                        ),
//                        bottom: BorderSide(
//                          color: Colors.black,
//                          width: 7.0,
//                        ),
//                        left: BorderSide(
//                          color: Colors.black,
//                          width: 2.0,
//                        ),
//                        top: BorderSide(
//                          color: Colors.black,
//                          width: 2.0,
//                        ),
//                      )
                  ),
                  child: Text('Create Account',style:TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color:Colors.black
                  )),

                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Log In',style:TextStyle(
                fontSize: 19,
                color: Colors.blueAccent,
                decoration: TextDecoration.underline,
              )),
              SizedBox(
                height: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('If there is already Hawkers account,',
                  style:TextStyle(
                fontSize: 19,
                    color:Colors.green


              )
                  ),

                  Text('please login using that account,',
                      style:TextStyle(
                        fontSize: 19,
                          color:Colors.green


                      )
                  )
                ],
              )


            ],
          )),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Field(String name,  TextEditingController controller,) {
    return Container(
        child: Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(name,
              style: TextStyle(

                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w700)),
        ),
        SizedBox(
          height: 3,
        ),
        Container(
            height: 38,
            decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(color: Colors.black, width: 0),
            borderRadius: BorderRadius.circular(5)),
            child: TextField(
              controller: controller,
              textAlign: TextAlign.start,
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black, fontSize: 18),
              //     color:Colors.grey,

              decoration: InputDecoration(
                border: InputBorder.none,
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            )),
      ],
    ));
  }

  Widget Place(String name,TextEditingController controller) {
    return Container(
//height: 35,
        child: Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(name,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w700)),
        ),
        SizedBox(
          height: 3,
        ),
        Stack(
          children: [
            Container(
                height: 38,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(color: Colors.black, width: 0),
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.start,
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  //     color:Colors.grey,

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(276, 7, 0, 0),
              child: Container(
                height: 27,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(4)),
                child:
                    Icon(Icons.arrow_drop_down, color: Colors.black, size: 23),
              ),
            )
          ],
        ),
      ],
    ));

  }
}
