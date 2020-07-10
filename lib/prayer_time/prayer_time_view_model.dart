import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim/models/prayers_of_day.dart';
import 'package:muslim/models/prayer.dart';
import 'package:muslim/utils/geolocator_helper.dart';

class PrayerTimeVIewModel with ChangeNotifier {
  Coordinates _coordinates;
  PrayerTimes prayerTimes;
  CalculationParameters params;

  PrayerTimeVIewModel() {
    initData();
  }

  initData() async{
    params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;
    var locator =  GeoLocatorHelper();
    _coordinates = Coordinates(23.9088, 90.40744);

    bool granted = await locator.getLocationPermission();
    if(granted){
      print(granted);
      Position position = await locator.getCurrentLocation();
      locator
          .getAddressFromLatLng(position);
      _coordinates = Coordinates(position.latitude, position.longitude);
      notifyListeners();
    }



  }

  PrayerOfDay getPrayerOfDay(DateTime date) {
    var dc = DateComponents.from(date);
    var pt = PrayerTimes(_coordinates, dc, params);
    return PrayerOfDay(
      fajr: PrayerModel(name: "Fajr", time: pt.fajr),
      dhuhr: PrayerModel(name: "Dhuhr", time: pt.dhuhr),
      asr: PrayerModel(name: "Asr", time: pt.asr),
      maghrib: PrayerModel(name: "Maghrib", time: pt.maghrib),
      isha: PrayerModel(name: "Isha", time: pt.isha),
    );
  }

  PrayerOfDay getPrayerOfToday() {
    var pt = PrayerTimes.today(_coordinates, params);
    return PrayerOfDay(
      fajr: PrayerModel(name: "Fajr", time: pt.fajr),
      dhuhr: PrayerModel(name: "Dhuhr", time: pt.dhuhr),
      asr: PrayerModel(name: "Asr", time: pt.asr),
      maghrib: PrayerModel(name: "Maghrib", time: pt.maghrib),
      isha: PrayerModel(name: "Isha", time: pt.isha),
    );
  }

  PrayerModel get upComingPrayer {
    var prayers = getPrayerOfToday();
    var now = DateTime.now();
    if (prayers.fajr.time.isAfter(now)) {
      return prayers.fajr;
    } else if (prayers.dhuhr.time.isAfter(now)) {
      return prayers.dhuhr;
    } else if (prayers.asr.time.isAfter(now)) {
      return prayers.asr;
    } else if (prayers.maghrib.time.isAfter(now)) {
      return prayers.maghrib;
    } else if (prayers.isha.time.isAfter(now)) {
      return prayers.isha;
    } else {
      return getPrayerOfDay(DateTime.now().add(Duration(hours: 12))).fajr;
    }
  }

  void updateUI() {
    notifyListeners();
  }

  String getLocationInfo() {}
}
