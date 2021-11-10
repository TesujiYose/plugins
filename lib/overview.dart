import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plugin/plugins/sun_rise_set_plugin.dart';

import 'plugins/date_plugin.dart';
import 'plugins/location_plugin.dart';
import 'calculator/sun_rise_set.dart';
import 'calculator/helper.dart';

class Overview extends StatelessWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//test
class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    DateTime current = Helper.getCurrentTime();
    List<dynamic> cont = Helper.getSunriseSunsetTime();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 300,
                width: 700,
                color: Colors.lightBlue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${DateFormat('HH:mm:ss').format(current)}',
                        style: TextStyle(fontSize: 95)),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.lightBlue[500],
                  child: Text('Sunrise:', style: TextStyle(fontSize: 60)),
                ),
                Text('${cont[0]}', style: TextStyle(fontSize: 40)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.blue,
                  child: Text('Sunset:', style: TextStyle(fontSize: 60)),
                ),
                Text(' ${cont[1]}', style: TextStyle(fontSize: 40)),
              ],
            ),
            Text('Total day time', style: TextStyle(fontSize: 40)),
            Text('${cont[2]}', style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.date_range),
        onPressed: () {
          _selectDate(context);
        },
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
          Duration(days: 30),
        )) as DateTime;
    setState(() {
      selectedDate = picked;
      print('selectedDate');
    });
  }
}
