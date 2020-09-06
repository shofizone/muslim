import 'package:get_it/get_it.dart';
import 'package:muslim/prayer_time/prayer_time_view_model.dart';
import 'package:muslim/settings/settings_controller.dart';

var locator = GetIt.instance;
setupLocator(){
  locator.registerLazySingleton<PrayerTimeVIewModel>(() => PrayerTimeVIewModel()) ;

}