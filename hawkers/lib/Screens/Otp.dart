import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  static const routeName = '/Otp';
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,

        ),
      ),
      body:Padding(
        padding: const EdgeInsets.fromLTRB(49, 7, 49, 0),
        child: Container(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Verify Mobile Number',style:TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color:Colors.black
              )),
              SizedBox(
                height: 15,
              ),
              Text('Enter 6 digit verification code sent to',
                  style:TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color:Colors.grey
                  )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,175,0),
                child: Text('91234556778',
                    style:TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color:Colors.grey
                    )
                ),
              ),
              SizedBox(height: 17,),
              Container(
                height: 38,
                decoration: BoxDecoration(
                   // color: Colors.green,
                    border: Border.all(color: Colors.black,),

                      borderRadius: BorderRadius.circular(5)
                  ),


              ),
              SizedBox(height: 17,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Change Number',
                      style:TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color:Colors.green
                      )
                  ),
                  Text('Resend OTP',
                      style:TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color:Colors.green
                      )
                  ),
                ],
              ),
              SizedBox(height: 150,),
              Container(
                height: 38,
                //  width: 400,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                    color: Colors.green,

                      borderRadius: BorderRadius.circular(5)

//                    border: Border(
//                      right: BorderSide(
//                        color: Colors.black,
//                        width: 8.0,
//                      ),
//                      bottom: BorderSide(
//                        color: Colors.black,
//                        width: 7.0,
//                      ),
//                      left: BorderSide(
//                        color: Colors.black,
//                        width: 2.0,
//                      ),
//                      top: BorderSide(
//                        color: Colors.black,
//                        width: 2.0,
//                      ),
//                    )
                ),
                child: Text('Verify OTP',style:TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color:Colors.black
                )),

              ),
            ],


          )
        ),
      )
    );
  }
}
