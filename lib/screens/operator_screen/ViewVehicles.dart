// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:html';

import 'package:car_parking_system/classes/VehicleModel.dart';
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
  Vehicle obj = new Vehicle();
  List<VehicleModel> _vehicles = [];

  FutureBuilder _getVehiclesData(BuildContext context, int slots) {
    return FutureBuilder<List<VehicleModel>>(
      future: Vehicle().generateVehicleList(),
      builder:
          (BuildContext context, AsyncSnapshot<List<VehicleModel>> snapshot) {
        if (snapshot.hasData) {
          List<VehicleModel>? data = snapshot.data;
          return _floors1(data, context, slots);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  ListView _floors1(data, BuildContext context, int slots) {
    return ListView.builder(
        itemCount: slots,
        itemBuilder: (context, index) {
          int slot_no = 0;
          try {
            slot_no = data[index].slot_no;
          } catch (e) {
            slot_no = 0;
          }
          if (slot_no != 0) {
            return Card(
                child: _tile(
                    "${data[index].slot_no}",
                    data[index].vehicle_number,
                    data[index].owner_name,
                    data[index].phone_number,
                    context));
          } else {
            return _defaultTile(index, context);
          }
        });
  }

  InkWell _tile(String slot_no, String vehicle_number, String name,
      String phone, BuildContext context) {
    return InkWell(
      onTap: () {},
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
    _vehicles = await obj.generateVehicleList();
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
          body: SingleChildScrollView(
            child: Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(
                    child: _getVehiclesData(context, widget.no_of_slots)),
              ),
            ),
          ),
        ));
  }
}
