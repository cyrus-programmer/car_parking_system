import 'dart:js';
import 'package:car_parking_system/classes/VehicleModel.dart';
import 'package:car_parking_system/screens/operator_screen/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Vehicle {
  Future<List<VehicleModel>> generateVehicleList() async {
    // Give your sever URL of get_employees_details.php file
    var url = "http://localhost/carparkingsystem/logincheck.php";
    var body = {"service": "View Vehicles"};
    final response = await http.post(Uri.parse(url), body: body);
    print(response.statusCode);
    var list = json.decode(response.body);
    List<VehicleModel> vehicles = await list
        .map<VehicleModel>((json) => VehicleModel.fromJson(json))
        .toList();
    return vehicles;
  }

  // ignore: non_constant_identifier_names
  Future<dynamic> sendData(
      String owner_name,
      String phone_number,
      String modal_number,
      String vehicle_id,
      String charges,
      String cnic,
      String vehicle_type,
      String slot_no,
      String floor_no) async {
    var body = {
      "owner_name": owner_name,
      "phone_number": phone_number,
      "modal_number": modal_number,
      "vehicle_id": vehicle_id,
      "vehicle_type": vehicle_type,
      "charges": charges,
      "CNIC": cnic,
      "slot_no": slot_no,
      "floor_no": floor_no,
      "service": "Add Vehicle"
    };
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
