import 'package:flutter/material.dart';
import 'package:plugin/plugins/sun_rise_set_plugin.dart';

import 'plugins/date_plugin.dart';
import 'plugins/location_plugin.dart';
import 'calculator/sun_rise_set.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            LocationPlugin(),
            SunRiseSetPlugin(),
            DatePlugin(selectedDate),
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
