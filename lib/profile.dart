import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:buyer/constants.dart';
import 'package:buyer/API.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:buyer/splash screen.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:buyer/home.dart';
import 'dart:io';
import 'package:buyer/login.dart';
import 'package:buyer/info_card.dart';
import 'package:buyer/register.dart';
import 'package:buyer/update_profile.dart';

class Profile extends StatefulWidget {
  static String route = 'profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text("AVSHESH"),
      ),

        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 22,
              ),
              InfoCard(
                text: Name,
                icon: Icons.person,
              ),
              InfoCard(
                text: Phone_no,
                icon: Icons.phone,
              ),
              InfoCard(
                text: Email,
                icon: Icons.email,
              ),
              Center(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 50.0),
                      child: ButtonTheme(
                        minWidth: 120.0,
                        height: 40.0,
                        child: RaisedButton(
                          color: Colors.green[700],
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            final result = await showDialog<bool>(
                              context: context,
                              builder: (_) {
                                return UpdateProfile();
                              },
                            );
                            if (result) {
                              setState(() {});
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
                    Container(
                      margin: EdgeInsets.only(left: 50.0),
                      child: ButtonTheme(
                        minWidth: 120.0,
                        height: 40.0,
                        child: RaisedButton(
                          color: Colors.green[700],
                          child: Text(
                            'Logout',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            Email = "" ;
                            Phone_no = "" ;
                            Password = "" ;
                            Navigator.pushNamed(context, Login.route);

                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                color:Colors.green[700],
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
        ),

        bottomNavigationBar: FFNavigationBar(
          theme: FFNavigationBarTheme(
            barBackgroundColor: Colors.white,
            selectedItemBorderColor: Colors.transparent,
            selectedItemBackgroundColor: Colors.green,
            selectedItemIconColor: Colors.white,
            selectedItemLabelColor: Colors.black,
            showSelectedItemShadow: false,
            barHeight: 70,
          ),

          selectedIndex: selectedIndex,

          onSelectTab: (index){
            setState(() {
              selectedIndex = index;
              if (selectedIndex == 0) {
                Navigator.pushNamed(context, Home.route);
              }  else if (selectedIndex == 1) {
                Navigator.pushNamed(context, Profile.route);
              }
            });
          },

          items: items,
        )

    );
  }
}

