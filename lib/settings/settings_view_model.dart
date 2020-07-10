import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim/utils/geolocator_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsViewModel with ChangeNotifier {
  ThemeMode _appThemeMode = ThemeMode.light;
  var _themeModePrfKey = "appThemeMode";
  var _geoLocatorHelper = GeoLocatorHelper();
  Position _position;
  String _locationString;

  SettingsViewModel() {
    _setUpTheme();
  }

  ThemeMode get appThemeMode => _appThemeMode;

  set appThemeMode(ThemeMode value) {
    _appThemeMode = value;
    notifyListeners();
  }

  _setUpTheme() async {
    var prf = await SharedPreferences.getInstance();
    var res = prf.getString(_themeModePrfKey);
    debugPrint(res);
    if (res != null) {
      switch (res) {
        case "dark":
          {
            appThemeMode = ThemeMode.dark;
            break;
          }
        case "light":
          {
            appThemeMode = ThemeMode.light;
            break;
          }
        default:
          {
            appThemeMode = ThemeMode.system;
            break;
          }
      }
      notifyListeners();
    }
  }

  toggleLightDark() {
    if (_appThemeMode == ThemeMode.dark) {
      appThemeMode = ThemeMode.light;
    } else {
      appThemeMode = ThemeMode.dark;
    }
    _saveToLocal();
//    print(_appThemeMode);
  }

  _saveToLocal() async {
    var prf = await SharedPreferences.getInstance();
    switch (_appThemeMode) {
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
      var position =  _geoLocatorHelper.getCurrentLocation();
      position.then((value){
        print(value);
        _position = value;
        notifyListeners();
        var address = _geoLocatorHelper.getAddressFromLatLng(value);
        address.then((value) {
          _locationString = value;
          notifyListeners();
        });
      });
    }else{
      debugPrint("Permission is not granted");
    }
  }

  String get locationString => _locationString;

  Position get position => _position;
}
