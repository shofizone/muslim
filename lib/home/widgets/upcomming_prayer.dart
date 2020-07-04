import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim/home/widgets/count_down_timer.dart';
import 'package:muslim/prayer_time/prayer_time_view_model.dart';
import 'package:muslim/values/colors.dart';
import 'package:provider/provider.dart';
import 'package:muslim/method_extensions.dart';

class UpComingPrayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PrayerTimeVIewModel>(
      builder: (BuildContext context, value, Widget child) {
        var prayer = value.upComingPrayer;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Next prey"),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: prayer.name ?? "",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold)),
                      TextSpan(text: " at"),
                    ])),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  prayer.time.formatTime11 ?? "",
                  style: GoogleFonts.lato(
                      fontSize: 35,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w300),
                ),
                Column(
                  children: [
                    Text(""),
                    Text(
                      prayer.time.getAmpm ?? "",
                    ),
                  ],
                ),
              ],
            ),
            CountDownTimer(
              time: prayer.time,
            ),
          ],
        );
      },
    );
  }
}
