import 'package:car_parking_system/screens/operator_screen/menu_drawer.dart';
import 'package:flutter/material.dart';

class HomePage1 extends StatefulWidget {
  HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dashboard",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Dashboard",
            style: TextStyle(fontSize: 24),
          ),
          backgroundColor: Color.fromARGB(255, 133, 21, 153),
          shadowColor: Color.fromARGB(255, 62, 16, 70),
        ),
        drawer: const MenuDrawer(),
        body: Center(
          child: Column(
            children: [
              Text(
                "XYZ Parking System",
                style: TextStyle(
                    color: Color.fromARGB(255, 133, 21, 153), fontSize: 30),
              ),
              Text("Welcome to admin Dashboard"),
              // ElevatedButton(onPressed: _connect, child: Text("Click"))
            ],
          ),
        ),
      ),
    );
  }
}
