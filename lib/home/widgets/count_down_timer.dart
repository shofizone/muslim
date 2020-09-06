import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim/method_extensions.dart';
import 'package:muslim/prayer_time/prayer_time_controller.dart';
import 'package:muslim/settings/settings_controller.dart';
import 'package:muslim/values/colors.dart';

class CountDownTimer extends StatefulWidget {
  final DateTime time;

  CountDownTimer({Key key, @required this.time}) : super(key: key);

  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  PrayerTimeController controller = Get.find();
  Timer _timer;
  Duration _remaining = Duration.zero;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _remaining = widget.time.difference(DateTime.now());
      if (_remaining <= Duration.zero) {
        _timer.cancel();
        controller.updateUI();
      }
      if (this.mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
        "in ${_remaining.formatDuration1() ?? ""}", style: TextStyle(color:
        AppColors.primaryColor,fontSize: 20,fontWeight: FontWeight.w600),);
  }
}
