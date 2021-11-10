import 'package:flutter/material.dart';

class DatePlugin extends StatelessWidget {
  final selectedDate;

  DatePlugin(this.selectedDate);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    var date = selectedDate;
    print(date);
    return SizedBox(
        height: 50,
        child: Container(
          color: Colors.green[50],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OneElement(date),
              OneElement(date.add(Duration(days: 1))),
              OneElement(date.add(Duration(days: 2))),
              OneElement(date.add(Duration(days: 3))),
              OneElement(date.add(Duration(days: 4))),
            ],
          ),
        ));
  }
}

class OneElement extends StatelessWidget {
  DateTime date;
  OneElement(
    DateTime this.date, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String str = _getWeekDayName(date.weekday);

    return Column(
      children: [
        Text('${date.day}'),
        Text(str),
      ],
    );
  }

  _getWeekDayName(int num) {
    switch (num) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        Exception();
        return '';
    }
  }
}
