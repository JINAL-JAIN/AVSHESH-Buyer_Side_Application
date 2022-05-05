import 'package:buyer/constants.dart';
import 'package:buyer/profile.dart';
import 'package:flutter/material.dart';
import 'package:buyer/register.dart';
import 'package:buyer/home.dart';
import 'package:buyer/API.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:async';




class Login extends StatefulWidget {
  static String route = 'login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  APIservice apIservice = APIservice();

   sendLogin() async {
    await apIservice.BuyerLogin();
   }

  final usernameController = new TextEditingController();
  final passwordController = new TextEditingController();

  _onBasicAlertPressed(context, String title) {
    Alert(
      style: AlertStyle(
        isButtonVisible: false,
        isCloseButton: true,
        backgroundColor: Colors.white,
      ),
      context: context,
      title: title,
      desc: "Try Again",
    ).show();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.green[700],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 380,
                        padding: EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 10.0),
                        child: TextFormField(
                          controller: usernameController,
                          keyboardType: TextInputType.phone,
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'Please enter your Mobile Number';
                          //   }
                          //   return null;
                          // },
                          onChanged: (value) {
                            setState(() {
                              Phone_no = value;
                            });
                          },
                          decoration: InputDecoration(
                              hintText: "Enter Mobile Number",
                              icon: Icon(Icons.mobile_friendly)),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 10.0),
                        width: 380,
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'Please enter your password';
                          //   }
                          //   return null;
                          // },
                          onChanged: (value) {
                            setState(() {
                              Password = value;
                            });
                          },
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              icon: Icon(Icons.lock)),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        child: ButtonTheme(
                          minWidth: 100.0,
                          height: 50.0,
                          child: RaisedButton(
                            color:Colors.green[700],
                            child: Text(
                              'LOGIN',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: (){
                              if (usernameController.text == ""){
                                _onBasicAlertPressed(
                                    context, 'Please Enter Username');
                              }
                              else if (passwordController.text == ""){
                                _onBasicAlertPressed(
                                    context, 'Please Enter Password');
                              }
                              else {
                                sendLogin();

                                Timer(Duration(seconds: 3), () {
                                  if (ValidCredential == "False") {
                                    _onBasicAlertPressed(
                                        context,
                                        'Please Enter Correct Credentials');
                                  }
                                  else {

                                    Navigator.pushNamed(context, Home.route);
                                  };
                                });
                              }


                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(
                                  color: Colors.green[700],
                                  width: 5.0,
                                )),
                          ),
                        ),
                      ),
                    ),

                    Center(child: Text("Don't have an account?"),),

                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Please ",
                            style: TextStyle(fontSize: 15.0),
                          ),
                          Container(
                            child: ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: RaisedButton(
                                color: Colors.green[700],
                                child: Text(
                                  'REGISTER',
                                  style: TextStyle(color: Colors.white),
                                ),

                                onPressed: () {
                                  Navigator.pushNamed(context, Register.route);
                                  //Navigator.pushNamed(context, '/home');
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => Register()),
                                  // );
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(
                                      color: Colors.green[700],
                                      width: 5.0,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                height: MediaQuery.of(context).size.height * 0.68,
              ),
            ),
          ),
        ],
      ),
    );
  }


}