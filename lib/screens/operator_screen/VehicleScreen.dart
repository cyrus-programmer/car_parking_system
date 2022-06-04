// ignore_for_file: unused_field
import 'package:car_parking_system/classes/VehicleModel.dart';
import 'package:car_parking_system/controller.dart';
import 'package:car_parking_system/classes/Vehicle.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'menu_drawer.dart';

class AddVehicle extends StatefulWidget {
  AddVehicle({Key? key}) : super(key: key);

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  List<VehicleModel> slots = [];

  TextEditingController _ownerName = TextEditingController();

  TextEditingController _phoneNumber = TextEditingController();

  TextEditingController _modalNumber = TextEditingController();

  TextEditingController _vehicleNumber = TextEditingController();

  TextEditingController _vehicleType = TextEditingController();

  TextEditingController _charges = TextEditingController();

  TextEditingController _identityNumber = TextEditingController();

  TextEditingController _slotNumber = TextEditingController();

  TextEditingController _floorNumber = TextEditingController();

  TextEditingController _membershipNumber = TextEditingController();

  String? _setDate, _setTime;

  String? _hour, _minute, _time;

  String? dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  sendData() async {
    var data = Controller().sendData(
        _ownerName.text,
        _phoneNumber.text,
        _modalNumber.text,
        _vehicleNumber.text,
        _charges.text,
        _identityNumber.text,
        _vehicleType.text,
        _slotNumber.text,
        _floorNumber.text);
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dateTime = DateFormat.yMd().format(DateTime.now());
    return MaterialApp(
      title: "Add Vehicle Details",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Vehicle",
            style: TextStyle(fontSize: 24),
          ),
          backgroundColor: Color.fromARGB(255, 133, 21, 153),
          shadowColor: Color.fromARGB(255, 62, 16, 70),
        ),
        drawer: const MenuDrawer(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Add Vehicle Details",
                  style: TextStyle(
                      color: Color.fromARGB(255, 133, 21, 153), fontSize: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 500,
                          child: TextField(
                            decoration: InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: "Owner Name",
                                prefix: Padding(
                                  padding: const EdgeInsets.all(4),
                                )),
                            maxLength: 20,
                            keyboardType: TextInputType.text,
                            controller: _ownerName,
                          )),
                      Container(
                          width: 500,
                          child: TextField(
                            decoration: InputDecoration(
                                icon: Icon(Icons.phone_android_rounded),
                                hintText: "Phone Number",
                                prefix: Padding(
                                  padding: const EdgeInsets.all(4),
                                )),
                            maxLength: 11,
                            keyboardType: TextInputType.number,
                            controller: _phoneNumber,
                          )),
                    ]),
                SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 500,
                          child: TextField(
                            decoration: InputDecoration(
                                icon: Icon(Icons.car_rental),
                                hintText: "Modal Number",
                                prefix: Padding(
                                  padding: const EdgeInsets.all(4),
                                )),
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            controller: _modalNumber,
                          )),
                      Container(
                          width: 500,
                          child: TextField(
                            decoration: InputDecoration(
                                icon: Icon(Icons.numbers),
                                hintText: "Vehicle Number",
                                prefix: Padding(
                                  padding: const EdgeInsets.all(4),
                                )),
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            controller: _vehicleNumber,
                          )),
                    ]),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 500,
                        child: TextField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.merge_type),
                              hintText: "Vehicle Type",
                              prefix: Padding(
                                padding: const EdgeInsets.all(4),
                              )),
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                          controller: _vehicleType,
                        )),
                    Container(
                        width: 500,
                        child: TextField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.money),
                              hintText: "Charges",
                              prefix: Padding(
                                padding: const EdgeInsets.all(4),
                              )),
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                          controller: _charges,
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 500,
                        child: TextField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.perm_identity),
                              hintText: "Identity Number",
                              prefix: Padding(
                                padding: const EdgeInsets.all(4),
                              )),
                          maxLength: 14,
                          keyboardType: TextInputType.number,
                          controller: _identityNumber,
                        )),
                    Container(
                        width: 500,
                        child: TextField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.space_bar),
                              hintText: "Membership No",
                              prefix: Padding(
                                padding: const EdgeInsets.all(4),
                              )),
                          maxLength: 14,
                          keyboardType: TextInputType.number,
                          controller: _membershipNumber,
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 500,
                        child: TextField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.space_bar),
                              hintText: "Slot No",
                              prefix: Padding(
                                padding: const EdgeInsets.all(4),
                              )),
                          maxLength: 14,
                          keyboardType: TextInputType.text,
                          controller: _slotNumber,
                        )),
                    Container(
                        width: 500,
                        child: TextField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.space_bar),
                              hintText: "Floor No",
                              prefix: Padding(
                                padding: const EdgeInsets.all(4),
                              )),
                          maxLength: 14,
                          keyboardType: TextInputType.number,
                          controller: _floorNumber,
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 100,
                  height: 25,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 133, 21, 153), // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {},
                    child: Text('Add'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class AddVehicle extends StatelessWidget {
//   AddVehicle({Key? key}) : super(key: key);
//   TextEditingController _ownerName = TextEditingController();
//   TextEditingController _phoneNumber = TextEditingController();
//   TextEditingController _modalNumber = TextEditingController();
//   TextEditingController _membershipNumber = TextEditingController();
//   TextEditingController _dateController = TextEditingController();

//   Future<Null> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: selectedDate,
//         initialDatePickerMode: DatePickerMode.day,
//         firstDate: DateTime(2015),
//         lastDate: DateTime(2101));
//     if (picked != null)
//       setState(() {
//         selectedDate = picked;
//         _dateController.text = DateFormat.yMd().format(selectedDate);
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "Add Vehicle",
//             style: TextStyle(fontSize: 24),
//           ),
//           backgroundColor: Color.fromARGB(255, 133, 21, 153),
//           shadowColor: Color.fromARGB(255, 62, 16, 70),
//         ),
//         drawer: const MenuDrawer(),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Text(
//                 "Add Vehicle Details",
//                 style: TextStyle(
//                     color: Color.fromARGB(255, 133, 21, 153), fontSize: 30),
//               ),
//               Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//                 Container(
//                     width: 500,
//                     child: TextField(
//                       decoration: InputDecoration(
//                           hintText: "Owner Name",
//                           prefix: Padding(
//                             padding: const EdgeInsets.all(4),
//                           )),
//                       maxLength: 20,
//                       keyboardType: TextInputType.text,
//                       controller: _ownerName,
//                     )),
//                 Container(
//                     width: 500,
//                     child: TextField(
//                       decoration: InputDecoration(
//                           hintText: "Phone Number",
//                           prefix: Padding(
//                             padding: const EdgeInsets.all(4),
//                           )),
//                       maxLength: 11,
//                       keyboardType: TextInputType.number,
//                       controller: _phoneNumber,
//                     )),
//               ]),
//               Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//                 Container(
//                     width: 500,
//                     child: TextField(
//                       decoration: InputDecoration(
//                           hintText: "Modal Number",
//                           prefix: Padding(
//                             padding: const EdgeInsets.all(4),
//                           )),
//                       maxLength: 10,
//                       keyboardType: TextInputType.number,
//                       controller: _modalNumber,
//                     )),
//                 Container(
//                     width: 500,
//                     child: TextField(
//                       decoration: InputDecoration(
//                           hintText: "Membership Number If applicable",
//                           prefix: Padding(
//                             padding: const EdgeInsets.all(4),
//                           )),
//                       maxLength: 10,
//                       keyboardType: TextInputType.number,
//                       controller: _membershipNumber,
//                     )),
//               ]),
//               Row(
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       _selectDate(context);
//                     },
//                     child: Container(
//                       width: 500 / 1.7,
//                       height: 30,
//                       margin: EdgeInsets.only(top: 30),
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(color: Colors.grey[200]),
//                       child: TextFormField(
//                         style: TextStyle(fontSize: 40),
//                         textAlign: TextAlign.center,
//                         enabled: false,
//                         keyboardType: TextInputType.text,
//                         controller: _dateController,
//                         decoration: InputDecoration(
//                             disabledBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide.none),
//                             contentPadding: EdgeInsets.only(top: 0.0)),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
