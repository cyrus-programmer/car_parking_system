import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _TableExample createState() => _TableExample();
}

class _TableExample extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Table Example'),
          ),
          body: Center(
              child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: Table(
                  defaultColumnWidth: FixedColumnWidth(200.0),
                  border: TableBorder.all(
                      color: Colors.black, style: BorderStyle.solid, width: 4),
                  children: [
                    TableRow(children: [
                      Column(children: [
                        Text('Website', style: TextStyle(fontSize: 20.0))
                      ]),
                      Column(children: [
                        Text('Tutorial', style: TextStyle(fontSize: 20.0))
                      ]),
                      Column(children: [
                        Text('Review', style: TextStyle(fontSize: 20.0))
                      ]),
                    ]),
                    for (int i = 0; i < 5; i++)
                      TableRow(children: [
                        Column(children: [
                          Text('${i}', style: TextStyle(fontSize: 20.0))
                        ]),
                        Column(children: [
                          Text('${i + 5}', style: TextStyle(fontSize: 20.0))
                        ]),
                        Column(children: [
                          Text('${i + 9}', style: TextStyle(fontSize: 20.0))
                        ]),
                      ]),
                  ]),
            ),
          ]))),
    );
  }
}
