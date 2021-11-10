import 'package:flutter/material.dart';
import 'package:plugin/calculator/sun_rise_set.dart';

class SunRiseSetPlugin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List time = run();

    print('HEOOOOO ${time.toString()}');
    String text = 'Sunrise time is:${time[0]}, Sunset time is: ${time[1]} ';
    return Container(
      child: Text(text),
    );
  }
}
