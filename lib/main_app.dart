import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim/home/screen/home_screen.dart';
import 'package:muslim/settings/settings_controller.dart';
import 'package:muslim/utils/app_theme.dart';

class MainApp extends StatelessWidget {
  // This widget is the root of your application.

  final _settingController = Get.put(SettingsController(),permanent: true);

  @override
  Widget build(BuildContext context) {


    return GetX<SettingsController>(
      builder: (controller)=>GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Muslim',
        themeMode: controller.appThemeMode.value,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: HomeScreen(),
      ),
    );
  }


}
