import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:muslim/prayer_time/prayer_time_controller.dart';
import 'package:muslim/values/colors.dart';
import 'package:weather_icons/weather_icons.dart';

class PrayerTimeToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    var vm = Provider.of<PrayerTimeVIewModel>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
     decoration: BoxDecoration(
       color: Theme.of(context).backgroundColor,
       borderRadius: BorderRadius.circular(5)
     ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
//                  Text("Prayer Time"),
//                  SizedBox(width: 10,),
                  Text("Today's Prayer Time"),

                  Text("(${DateFormat.yMMMd().format(DateTime.now())})"),
                ],
              ),
            ),
            GetBuilder<PrayerTimeController>(builder: ( vm) {
              var todayPrayer = vm.getPrayerOfToday();
              var upComingPrayer = vm.upComingPrayer;
              return Column(
                children: [
                  _tile(
                      context: context,
                      name: todayPrayer.fajr.name,
                      time: todayPrayer.fajr.timeString,
                      iconData: WeatherIcons.sunrise,
                    upComingPrayerName: upComingPrayer.name

                  ),
                  _tile(
                      context: context,
                      name: todayPrayer.dhuhr.name,
                      time: todayPrayer.dhuhr.timeString,
                      upComingPrayerName: upComingPrayer.name,
                      iconData: WeatherIcons.day_sunny),
                  _tile(
                      context: context,
                      name: todayPrayer.asr.name,
                      time: todayPrayer.asr.timeString,
                      upComingPrayerName: upComingPrayer.name,
                      iconData: WeatherIcons.horizon_alt),
                  _tile(
                      context: context,
                      name: todayPrayer.maghrib.name,
                      time: todayPrayer.maghrib.timeString,
                      upComingPrayerName: upComingPrayer.name,
                      iconData: WeatherIcons.sunset),
                  _tile(
                      context: context,
                      name: todayPrayer.isha.name,
                      time: todayPrayer.isha.timeString,
                      upComingPrayerName: upComingPrayer.name,
                      iconData: WeatherIcons.moonrise),
                ],
              );
            })
          ],
        ),
      ),
    );
  }

  _tile({
    @required BuildContext context,
    @required String name,
    @required String time,
    @required IconData iconData,
    @required String upComingPrayerName,
  }) {
bool current = name == upComingPrayerName;
    var textStyle = TextStyle(fontSize: 20,color: current? AppColors.primaryColor: null);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Material(
        color: current?AppColors.primaryColor.withOpacity(0.1):Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 9),
                      child: Icon(
                        iconData,
                        size: 18,
                        color: AppColors.primaryColor
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      name,
                      style: textStyle,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  time,
                  style: textStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
