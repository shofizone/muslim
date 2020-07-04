import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim/method_extensions.dart';

class CurrentTime extends StatefulWidget {
  @override
  _CurrentTimeState createState() => _CurrentTimeState();
}

class _CurrentTimeState extends State<CurrentTime> {
  DateTime time = DateTime.now();
  Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      time = DateTime.now();
      setState(() {});
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(time.formatTime11 ?? "",
                style: GoogleFonts.lato(fontSize: 40, fontWeight: FontWeight.w300)),
            Text(time.getAmpm ?? "",),
          ],
        ),
        Text(DateTime.now().formatDate1),
      ],
    );
  }
}
