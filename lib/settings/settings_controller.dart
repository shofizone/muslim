import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:muslim/models/city.dart';
import 'package:muslim/utils/geolocator_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  var appThemeMode = ThemeMode.system.obs;
  var _themeModePrfKey = "appThemeMode";
  var _geoLocatorHelper = GeoLocatorHelper();
  Position _position;
  String _locationString;


  @override
  void onInit() {
    _setUpTheme();
  }


  _setUpTheme() async {
    var prf = await SharedPreferences.getInstance();
    var res = prf.getString(_themeModePrfKey);
    debugPrint(res);
    if (res != null) {
      switch (res) {
        case "dark":
          {
            appThemeMode.update((value) {
              value = ThemeMode.dark;
            });
            break;
          }
        case "light":
          {
            appThemeMode.update((value) {
              value = ThemeMode.light;
            });
            break;
          }
        default:
          {
            appThemeMode.update((value) {
              value = ThemeMode.system;
            });
            break;
          }
      }
    }
  }

  toggleLightDark() {

      if (appThemeMode.value == ThemeMode.dark) {
        appThemeMode.value = ThemeMode.light;
      } else {
        appThemeMode.value = ThemeMode.dark;
      }

      print(appThemeMode.value);

    _saveToLocal();
  }

  _saveToLocal() async {
    var prf = await SharedPreferences.getInstance();
    switch (appThemeMode.value) {
      case ThemeMode.system:
        prf.setString(_themeModePrfKey, "system");
        break;
      case ThemeMode.light:
        prf.setString(_themeModePrfKey, "light");
        break;
      case ThemeMode.dark:
        prf.setString(_themeModePrfKey, "dark");
        break;
    }
  }

  pickLocationByGPS() async {
    bool granted = await _geoLocatorHelper.getLocationPermission();
    print(granted);
    if (granted) {
      var position = _geoLocatorHelper.getCurrentLocation();
      position.then((value) {
        print(value);
        _position = value;
        update();
        var address = _geoLocatorHelper.getAddressFromLatLng(value);
        address.then((value) {
          _locationString = value;
          update();
        });
      });
    } else {
      debugPrint("Permission is not granted");
    }
  }

  Future<List<City>> pickLocationFormJson() async {
    var cityList =
        await _geoLocatorHelper.getLocationJson('assets/json/cities.json');
    return cityList;
  }

  String get locationString => _locationString;

  Position get position => _position;
}
