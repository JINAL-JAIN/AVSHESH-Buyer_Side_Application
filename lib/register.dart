import 'package:flutter/material.dart';
import 'package:buyer/home.dart';
import 'constants.dart';
import 'API.dart';
import 'package:buyer/profile.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:buyer/login.dart';



class Register extends StatefulWidget {
  static String route = 'register';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  APIservice apIservice = APIservice();

  sendRegister() async {
    await apIservice.registerBuyer();
  }

  final phonenoController = new TextEditingController();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final nameController = new TextEditingController();


  bool validateMobile(String value) {
    // Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return false;
    else
      return true;
  }

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
                        "REGISTER",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),

                    Center(
                      child: Container(
                        width: 380,
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 3.0),
                        child: TextFormField(
                          controller: nameController,
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'Please enter your E-mail id';
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                              hintText: "Enter Your Name",
                              icon: Icon(Icons.person)),
                        ),
                      ),
                    ),

                    Center(
                      child: Container(
                        width: 380,
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 3.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: phonenoController,
                          // validator: (value) {
                          //   if (value.length!=10) {
                          //     return 'Please enter valid Mobile Number';
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                              hintText: "Enter Mobile Number",
                              icon: Icon(Icons.mobile_friendly)),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 380,
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 3.0),
                        child: TextFormField(
                          controller: emailController,
                          // validator: (value) {
                          //   if (value.length!=10) {
                          //     return 'Please enter valid Mobile Number';
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                              hintText: "Enter Email Id",
                              icon: Icon(Icons.email)),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 5.0, 3.0),
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
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              icon: Icon(Icons.lock_outlined)),
                        ),
                      ),
                    ),

                    Center(
                      child: Container(
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
                              bool mobileValid =
                              validateMobile(phonenoController.text);
                              if (mobileValid == false) {
                                print(mobileValid);
                                _onBasicAlertPressed(context,
                                    'Please Enter a valid Mobile Number');
                              }
                              bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(emailController.text);
                              if (emailValid == false) {
                                _onBasicAlertPressed(
                                    context, 'Please Enter a valid Email');
                              }
                              else if (passwordController.text == ""){
                                _onBasicAlertPressed(
                                    context, 'Please Enter Password');
                              }
                              else {
                                Phone_no = phonenoController.text;
                                Email = emailController.text;
                                Password = passwordController.text;
                                Name= nameController.text;
                                sendRegister();
                                Navigator.pushNamed(context, Home.route);
                              }},
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