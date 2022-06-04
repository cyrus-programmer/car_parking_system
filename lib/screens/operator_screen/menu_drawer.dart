// ignore_for_file: avoid_unnecessary_containers

import 'package:car_parking_system/loginPage.dart';
import 'package:car_parking_system/screens/operator_screen/MembershipScreen.dart';
import 'package:car_parking_system/screens/operator_screen/VehicleScreen.dart';
import 'package:car_parking_system/screens/operator_screen/home.dart';
import 'package:flutter/material.dart';

import '../../loginPage.dart';
import '../../values/values.dart';
import 'ViewFloor.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Positioned(
            left: 0.0,
            right: 0.0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primaryColor,
                      AppColors.secondaryColor1
                    ]),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 18.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6.0),
                      Column(
                        children: [
                          Container(
                            child: ListTile(
                              leading: const Icon(
                                Icons.dashboard,
                                color: Colors.white,
                              ),
                              title: Text(
                                "DashBoard",
                                style:
                                    TextStyle(color: AppColors.foreGroundColor),
                              ),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage())),
                              selected: true,
                            ),
                          ),
                          Divider(
                            color: AppColors.shadowColor,
                          ),
                          Container(
                            child: ListTile(
                              leading: const Icon(
                                Icons.car_rental,
                                color: Colors.white,
                              ),
                              title: Text("Add Vehicle Details",
                                  style: TextStyle(
                                      color: AppColors.foreGroundColor)),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddVehicle())),
                              selected: true,
                            ),
                          ),
                          Divider(
                            color: AppColors.shadowColor,
                          ),
                          Container(
                            child: ListTile(
                              leading: const Icon(
                                Icons.view_carousel,
                                color: Colors.white,
                              ),
                              title: Text("View Vehicles Details",
                                  style: TextStyle(
                                      color: AppColors.foreGroundColor)),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => View2())),
                              selected: true,
                            ),
                          ),
                          Divider(
                            color: AppColors.shadowColor,
                          ),
                          Container(
                            child: ListTile(
                              leading: const Icon(
                                Icons.card_membership,
                                color: Colors.white,
                              ),
                              title: Text("Add Membership",
                                  style: TextStyle(
                                      color: AppColors.foreGroundColor)),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddMembership())),
                              selected: true,
                            ),
                          ),
                          Divider(
                            color: AppColors.shadowColor,
                          ),
                          Container(
                            child: ListTile(
                              leading: const Icon(
                                Icons.logout_rounded,
                                color: Colors.white,
                              ),
                              title: Text("Log Out",
                                  style: TextStyle(
                                      color: AppColors.foreGroundColor)),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage())),
                              selected: true,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
