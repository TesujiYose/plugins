import 'package:flutter/material.dart';
import 'package:plugin/calculator/sun_rise_set.dart';

class LocationPlugin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('LocationNAME'),
        IconButton(onPressed: _selectLocation, icon: Icon(Icons.location_pin))
      ],
    ));
  }

  void _selectLocation() {}
}
