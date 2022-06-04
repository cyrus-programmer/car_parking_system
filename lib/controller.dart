import 'package:car_parking_system/adminscreen/HomePage.dart';
import 'package:car_parking_system/classes/VehicleModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'classes/FloorModel.dart';
import 'screens/operator_screen/home.dart';

class Controller {
  Future<List<VehicleModel>> generateVehicleList() async {
    // Give your sever URL of get_employees_details.php file
    var url = "http://localhost/car_parking_system/lib/db/dbcontroller.php";
    var body = {"service": "View Vehicles"};
    final response = await http.post(Uri.parse(url), body: body);
    print(response.body);
    var list = json.decode(response.body);
    List<VehicleModel> vehicles = await list
        .map<VehicleModel>((json) => VehicleModel.fromJson(json))
        .toList();
    return vehicles;
  }

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
          Uri.parse(
              "http://localhost/car_parking_system/lib/db/dbcontroller.php"),
          body: body,
          headers: headers);
      var data = json.decode(response.body);
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

  Future verifyUser(
      BuildContext context, String username, String password) async {
    var check = null;
    var body = {
      "username": username,
      "password": password,
      "service": "Verify User"
    };
    var headers = {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
    try {
      var response = await http.post(
          Uri.parse(
              "http://localhost/car_parking_system/lib/db/dbcontroller.php"),
          body: body,
          headers: headers);
      var data = json.decode(response.body);
      if (data["success"] == true) {
        check = data["type"];
      } else {
        check = null;
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
    if (check != null) {
      if (check == "operator") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else if (check == "manager") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage1()));
      }
    } else {
      Fluttertoast.showToast(
          msg: "Enter Correct Username and passowrd",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<List<FloorModel>> checkFloor() async {
    var url = "http://localhost/car_parking_system/lib/db/dbcontroller.php";
    var body = {"service": "Floor Data"};
    final response = await http.post(Uri.parse(url), body: body);
    var list = json.decode(response.body);
    List<FloorModel> _floors = await list
        .map<FloorModel>((json) => FloorModel.fromJson(json))
        .toList();
    return _floors;
  }
}
