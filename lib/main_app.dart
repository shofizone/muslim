import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim/home/screen/home_screen.dart';
import 'package:muslim/locator.dart';
import 'package:muslim/prayer_time/prayer_time_view_model.dart';
import 'package:muslim/settings/settings_controller.dart';
import 'package:muslim/utils/app_theme.dart';
import 'package:muslim/values/colors.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class MainApp extends StatelessWidget {
  // This widget is the root of your application.

  final _settingController = Get.put(SettingsController(),permanent: true);

  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => locator<PrayerTimeVIewModel>(),
        ),
      ],
      child: GetX<SettingsController>(
        builder: (controller)=>GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Muslim',
          themeMode: controller.appThemeMode.value,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: HomeScreen(),
        ),
      ),
    );
  }


}
