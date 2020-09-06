import 'package:muslim/models/prayer.dart';

class PrayerOfDay {
  PrayerModel fajr;
  PrayerModel dhuhr;
  PrayerModel asr;
  PrayerModel maghrib;
  PrayerModel isha;
  PrayerModel sunrise;

  PrayerOfDay({
    this.fajr,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
    this.sunrise,
  });

  List<PrayerModel> toList() {
    return [fajr,dhuhr,asr,maghrib,isha,sunrise];
  }
}
