import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class GeoLocatorHelper {
  final Geolocator _geolocator = Geolocator()..forceAndroidLocationManager;

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
      Position position = await _geolocator.getCurrentPosition();
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
      List<Placemark> p = await _geolocator.placemarkFromCoordinates(
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
}
