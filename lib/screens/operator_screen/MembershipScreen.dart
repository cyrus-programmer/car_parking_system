// ignore_for_file: unused_field
import 'package:car_parking_system/classes/Membership.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'menu_drawer.dart';

class AddMembership extends StatefulWidget {
  AddMembership({Key? key}) : super(key: key);

  @override
  State<AddMembership> createState() => _AddMembershipState();
}

class _AddMembershipState extends State<AddMembership> {
  TextEditingController _ownerName = TextEditingController();

  TextEditingController _phoneNumber = TextEditingController();

  TextEditingController _modalNumber = TextEditingController();

  TextEditingController _membershipNumber = TextEditingController();

  TextEditingController _identityNumber = TextEditingController();

  TextEditingController _startDate = TextEditingController();

  TextEditingController _expiryDate = TextEditingController();

  String? _setDate, _setTime;

  String? _hour, _minute, _time;

  String? dateTime;

  static DateTime selectedDate = DateTime.now();

  DateTime expiryDate = DateTime.now().add(Duration(days: 365));

  // TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  // TextEditingController _dateController = TextEditingController();
  // TextEditingController _timeController = TextEditingController();

  @override
  void initState() {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    _startDate.text = formatter.format(DateTime.now());

    _expiryDate.text =
        formatter.format(DateTime.now().add(Duration(days: 365)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dateTime = DateFormat.yMd().format(DateTime.now());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Add Membership Details",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Membership",
            style: TextStyle(fontSize: 24),
          ),
          backgroundColor: Color.fromARGB(255, 133, 21, 153),
          shadowColor: Color.fromARGB(255, 62, 16, 70),
        ),
        drawer: const MenuDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Add Person Details",
                style: TextStyle(
                    color: Color.fromARGB(255, 133, 21, 153), fontSize: 30),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
                          icon: Icon(Icons.card_membership_rounded),
                          hintText: "Membership Number",
                          prefix: Padding(
                            padding: const EdgeInsets.all(4),
                          )),
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      controller: _membershipNumber,
                    )),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 500,
                    child: TextField(
                      controller: _startDate,
                      decoration: InputDecoration(
                          icon: Icon(Icons.calendar_month_rounded),
                          labelText: "Select Date"),
                      onTap: () async {
                        DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            initialDatePickerMode: DatePickerMode.day,
                            firstDate: DateTime(2015),
                            lastDate: DateTime(2101));
                        if (picked != null) {
                          setState(() {
                            DateFormat formatter = DateFormat('yyyy-MM-dd');
                            _startDate.text = formatter.format(picked);
                          });
                        }
                      },
                    ),
                  ),
                  Container(
                    width: 500,
                    child: TextField(
                      controller: _expiryDate,
                      decoration: InputDecoration(
                          icon: Icon(Icons.calendar_month_rounded),
                          labelText: "Expiry Date"),
                      onTap: () async {
                        DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: expiryDate,
                            initialDatePickerMode: DatePickerMode.day,
                            firstDate: DateTime(2015),
                            lastDate: DateTime(2101));
                        if (picked != null) {
                          setState(() {
                            DateFormat formatter = DateFormat('yyyy-MM-dd');
                            _expiryDate.text = formatter.format(picked);
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
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
                width: 100,
                height: 25,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 133, 21, 153), // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    Membership().sendData(
                      _ownerName.text,
                      _phoneNumber.text,
                      _modalNumber.text,
                      _membershipNumber.text,
                      _startDate.text,
                      _expiryDate.text,
                      _identityNumber.text,
                    );
                  },
                  child: Text('Add'),
                ),
              ),
            ],
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
