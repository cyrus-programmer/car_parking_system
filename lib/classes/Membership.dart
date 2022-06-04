import 'dart:js';

import 'package:car_parking_system/screens/operator_screen/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Membership {
  String? username, password;

  // ignore: non_constant_identifier_names
  Future<dynamic> sendData(
      String owner_name,
      String phone_number,
      String modal_number,
      String membership_number,
      String start_date,
      String expiry_date,
      String cnic) async {
    var body = {
      "owner_name": owner_name,
      "phone_number": phone_number,
      "modal_number": modal_number,
      "membership_number": membership_number,
      "start_date": start_date,
      "expiry_date": expiry_date,
      "CNIC": cnic,
      "service": "Add Membership"
    };
    print(body);
    var headers = {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    try {
      var response = await http.post(
          Uri.parse("http://localhost/carparkingsystem/logincheck.php"),
          body: body,
          headers: headers);
      print(response.statusCode);
      var data = json.decode(response.body);
      print(data);
      if (data["message"] == "Successfully Added") {
        Fluttertoast.showToast(
            msg: data["message"],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Error in adding vehicle details",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
