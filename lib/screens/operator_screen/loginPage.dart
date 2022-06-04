import 'package:car_parking_system/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Car Parking System",
      color: Color.fromARGB(255, 62, 16, 70),
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "XYZ Parking System",
              style: TextStyle(fontSize: 18),
            ),
            backgroundColor: Color.fromARGB(255, 133, 21, 153),
            shadowColor: Color.fromARGB(255, 62, 16, 70),
          ),
          body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Login",
                style: TextStyle(
                    color: Color.fromARGB(255, 133, 21, 153), fontSize: 30),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 30,
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10, right: 360, left: 360),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Username",
                        prefix: Padding(
                          padding: const EdgeInsets.all(4),
                        )),
                    maxLength: 12,
                    keyboardType: TextInputType.text,
                    controller: _controller,
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 10, right: 360, left: 360),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefix: Padding(
                          padding: const EdgeInsets.all(4),
                        )),
                    keyboardType: TextInputType.text,
                    controller: _controller1,
                    obscureText: true,
                  )),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 133, 21, 153),
                    ),
                    onPressed: () {
                      Controller().verifyUser(context, _controller.text.trim(),
                          _controller1.text.trim());
                    },
                    child: const Text("Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ))),
              )
            ]),
          ),
        );
      }),
    );
  }
}
