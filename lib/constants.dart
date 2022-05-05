import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:buyer/product.dart';
List<FFNavigationBarItem> items = [
  FFNavigationBarItem(
    iconData: Icons.shopping_bag,
    label: 'Shop',
    selectedBackgroundColor: Colors.green[700],
  ),
  FFNavigationBarItem(
    iconData: Icons.person,
    label: 'Profile',
    selectedBackgroundColor: Colors.green[700],
  ),
];


List <Product> prodList=[];
List Productlist;
List Filterlist;
String Phone_no;
String Name;
String Email;
String Password;
String ValidCredential;
String Buyer_id;
String ngrok='https://9f7d-2409-4040-e8b-d997-c544-42ca-9bbd-9441.ngrok.io';