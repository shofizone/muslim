import 'dart:async';

import 'package:flutter/material.dart';
import 'package:muslim/method_extensions.dart';
import 'package:muslim/prayer_time/prayer_time_view_model.dart';
import 'package:muslim/values/colors.dart';
import 'package:provider/provider.dart';

class CountDownTimer extends StatefulWidget {
  final DateTime time;

  CountDownTimer({Key key, @required this.time}) : super(key: key);

  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  Timer _timer;
  Duration _remaining = Duration.zero;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _remaining = widget.time.difference(DateTime.now());
      if (_remaining <= Duration.zero) {
        _timer.cancel();
        Provider.of<PrayerTimeVIewModel>(context, listen: false).updateUI();
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
