import 'package:muslim/models/prayer.dart';

class PrayerOfDay {
  PrayerModel fajr;
  PrayerModel dhuhr;
  PrayerModel asr;
  PrayerModel maghrib;
  PrayerModel isha;

  PrayerOfDay({
    this.fajr,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
  });

  List<PrayerModel> toList() {
    return [fajr,dhuhr,asr,maghrib,isha];
  }
}
