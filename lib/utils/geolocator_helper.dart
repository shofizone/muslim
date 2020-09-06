import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim/models/city.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class GeoLocatorHelper {

  Future<bool> getLocationPermission() async {
    bool shouldAskForLocation = !await Permission.location.status.isGranted;
    if (shouldAskForLocation) {
      var status = await Permission.location.request();
      if (status.isGranted) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  Future<Position> getCurrentLocation() async {
    debugPrint("Getting current location");

    try {
      Position position = await getCurrentPosition();
      print(position);
      return position;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String> getAddressFromLatLng(Position _currentPosition) async {
    debugPrint("getAddressFromLatLng");
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = p[0];
      var _currentAddress =
          "${place.subLocality}, ${place.locality}, ${place.country}";
      print(_currentAddress);
      return _currentAddress;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<City>> getLocationJson(String assetsPath) async {
    print('--- Parse json from: $assetsPath');
    return rootBundle.loadString(assetsPath).then((jsonStr) {
      return compute(_parseCityListFromJsonString, jsonStr);
    });
  }
}

Future<List<City>> _parseCityListFromJsonString(String jsonStr) async{
  var data = jsonDecode(jsonStr);
  var list = <City>[];
  data.forEach((e) {
    list.add(City.fromJson(e));
  });

  return list;
}
