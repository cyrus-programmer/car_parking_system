// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:car_parking_system/controller.dart';
import 'package:flutter/material.dart';

import '../../classes/FloorModel.dart';
import 'ViewVehicles.dart';
import 'menu_drawer.dart';

class View2 extends StatefulWidget {
  View2({Key? key}) : super(key: key);

  @override
  State<View2> createState() => _View2State();
}

class _View2State extends State<View2> {
  // VehicleDataSource? vehicleDataSource;

  FutureBuilder _getFloorData(BuildContext context) {
    return FutureBuilder<List<FloorModel>>(
      future: Controller().checkFloor(),
      builder:
          (BuildContext context, AsyncSnapshot<List<FloorModel>> snapshot) {
        if (snapshot.hasData) {
          List<FloorModel>? data = snapshot.data;
          return _floors1(data, context);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  ListView _floors1(data, BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
              child: _tile(data[index].floor_name, data[index].no_of_slots,
                  Icons.local_parking, context));
        });
  }

  InkWell _tile(
      String title, int subtitle, IconData icon, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => View(
                      floorName: title,
                      no_of_slots: subtitle,
                    )));
      },
      child: ListTile(
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        subtitle: Text("Slots : ${subtitle}"),
        leading: Icon(
          icon,
          color: Color.fromARGB(255, 133, 21, 153),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Vehicle Data",
              style: TextStyle(fontSize: 24),
            ),
            backgroundColor: Color.fromARGB(255, 133, 21, 153),
            shadowColor: Color.fromARGB(255, 62, 16, 70),
          ),
          drawer: const MenuDrawer(),
          body: Center(child: _getFloorData(context)),
        ));
  }
}
