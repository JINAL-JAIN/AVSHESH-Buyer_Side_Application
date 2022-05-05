//@dart=2.9;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'product.dart';

class APIservice {
  Future<String> getProductList() async {
    var response = await http.post(
      ngrok + '/buyer_display',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var mapResponse = json.decode(response.body);
      print(mapResponse);
      Productlist = mapResponse["data"];
      print(Productlist);
      prodList=[];
      print('hello1');
      print(prodList);
      for( var i = 0 ; i < Productlist.length; i++ ) {
        prodList.add(Product(Productlist[i][0], Productlist[i][1], Productlist[i][2], Productlist[i][3], Productlist[i][4], Productlist[i][5] ));
      }
      print('hello');
      print(prodList);
    }
  }

  Future<String> BuyerLogin() async {
    Map homeMap = {
      "Phone_no": Phone_no,
      "Password": Password,
    };
    var response = await http.post(
      ngrok + '/buyerlogin',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(homeMap),
    );
    if (response.statusCode == 200) {
      var mapResponse = json.decode(response.body);
      print(mapResponse);
      ValidCredential = mapResponse["success"];
      if(ValidCredential == "True") {
        Buyer_id = mapResponse["data"][0];
        Email = mapResponse["data"][2];
        Phone_no = mapResponse["data"][3];
        Password = mapResponse["data"][4];
        Name=mapResponse['data'][1];
        print(mapResponse);

      }
      print(ValidCredential);
    }
  }

  Future<String> registerBuyer() async {
    Map registerMap = {
      "Email": Email,
      "Phone_no": Phone_no,
      "Password": Password,
      "Name": Name

    };
    print(registerMap);
    var response = await http.post(
      ngrok + '/buyerregister',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(registerMap),
    );
    if (response.statusCode == 200) {
      var mapResponse = json.decode(response.body);
      print(mapResponse);
      Buyer_id = mapResponse["data"];
    }

  }

  Future<String> editProfile() async {
    Map registerMap = {
      "ID": Buyer_id,
      "Email_id": Email,
      "Phone_no": Phone_no,

    };
    print(registerMap);
    var response = await http.post(
      ngrok + '/editprofile',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(registerMap),

    );

  }


}