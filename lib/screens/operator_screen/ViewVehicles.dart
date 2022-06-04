// ignore_for_file: unnecessary_new, prefer_const_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'dart:html';

import 'package:car_parking_system/classes/VehicleModel.dart';
import 'package:car_parking_system/controller.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../classes/Vehicle.dart';
import 'menu_drawer.dart';

class View extends StatefulWidget {
  final String floorName;
  final int no_of_slots;
  View({Key? key, required this.floorName, required this.no_of_slots})
      : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  // VehicleDataSource? vehicleDataSource;
  List<VehicleModel> _vehicles = [];
  List<int> slots = [];
  Widget _buildPopupDialog(BuildContext context, String vehicle_number) {
    return new AlertDialog(
      title: const Text('Vehicle'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(vehicle_number),
        ],
      ),
      actions: <Widget>[
        new ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 133, 21, 153)),
        ),
      ],
    );
  }

  FutureBuilder _getVehiclesData(BuildContext context) {
    return FutureBuilder<List<VehicleModel>>(
      future: Controller().generateVehicleList(),
      builder:
          (BuildContext context, AsyncSnapshot<List<VehicleModel>> snapshot) {
        if (snapshot.hasData) {
          List<VehicleModel>? data = snapshot.data;
          return _floors1(data, context);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  check(List<int> slots, int slot) {
    for (int i in slots) {
      if (i == slot) {
        print(slot);
        return true;
      }
    }
    return false;
  }

  Expanded _floors1(data, BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.no_of_slots,
          itemBuilder: (context, index) {
            if (check(slots, index + 1)) {
              return Card(
                  child: _tile(
                      "${data[index].slot_no}",
                      data[index].vehicle_number,
                      data[index].owner_name,
                      data[index].phone_number,
                      context));
            } else {
              return _defaultTile(index + 1, context);
            }
          }),
    );
  }

  InkWell _tile(String slot_no, String vehicle_number, String name,
      String phone, BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) =>
              _buildPopupDialog(context, vehicle_number),
        );
      },
      child: ListTile(
          title: RichText(
            text: TextSpan(
                text: name,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
                children: [
                  TextSpan(text: "\nPhone No : ${phone}"),
                  TextSpan(text: "  Vehicle No : ${vehicle_number}"),
                ]),
          ),
          leading: Text(slot_no)),
    );
  }

  InkWell _defaultTile(int slot_no, BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(leading: Text("${slot_no}")),
    );
  }

  @override
  void initState() {
    super.initState();
    _load();
    // _columns = getColumns();
  }

  _load() async {
    _vehicles = await Controller().generateVehicleList();
    for (VehicleModel v in _vehicles) {
      slots.add(v.slot_no!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.floorName,
            style: TextStyle(fontSize: 24),
          ),
          backgroundColor: Color.fromARGB(255, 133, 21, 153),
          shadowColor: Color.fromARGB(255, 62, 16, 70),
        ),
        drawer: const MenuDrawer(),
        body: Center(child: _getVehiclesData(context)),
      ),
    );
  }
}
