import 'dart:async';

import 'package:flutter/material.dart';

import '../size_config.dart';

class TimeHourAndMinites extends StatefulWidget {
  const TimeHourAndMinites({super.key});

  @override
  State<TimeHourAndMinites> createState() => _TimeHourAndMinitesState();
}

class _TimeHourAndMinitesState extends State<TimeHourAndMinites> {
  TimeOfDay _timeOfday = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeOfday.minute != TimeOfDay.now().minute) {
        setState(() {
          _timeOfday = TimeOfDay.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String period = _timeOfday.period == DayPeriod.am ? "َA.M" : "P.M";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            _timeOfday.minute >= 10
                ? "${_timeOfday.hourOfPeriod}:${_timeOfday.minute}"
                : "${_timeOfday.hourOfPeriod}:0${_timeOfday.minute}",
            style: Theme.of(context).textTheme.displayLarge),
        const SizedBox(width: 5),
        RotatedBox(
            quarterTurns: 3,
            child: Text(period,
                style: TextStyle(fontSize: getProportionateScreenWidth(18)))),
      ],
    );
  }
}
