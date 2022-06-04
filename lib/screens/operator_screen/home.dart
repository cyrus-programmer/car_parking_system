import 'package:car_parking_system/screens/operator_screen/menu_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void handleClick(int item) {
    switch (item) {
      case 0:
        break;
      case 1:
        break;
    }
  }

  // var db = Mysql();
  // int userId = 1;
  // void _connect() {
  //   db.getConnection().then((conn) {
  //     conn.query('select * from events where Event_Id = ?', [userId]).then(
  //         (results) {
  //       for (var row in results) {
  //         print(row);
  //       }
  //     });
  //   });
  // }

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
              Text(
                  "This is XYZ Car Parking System made by Data Pirates. This system will help in managing parking system from saving details\n of vehicles to generate reports."),
              // ElevatedButton(onPressed: _connect, child: Text("Click"))
            ],
          ),
        ),
      ),
    );
  }
}
