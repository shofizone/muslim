import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim/home/screen/home_screen.dart';
import 'package:muslim/locator.dart';
import 'package:muslim/prayer_time/prayer_time_view_model.dart';
import 'package:muslim/settings/settings_view_model.dart';
import 'package:muslim/values/colors.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => locator<PrayerTimeVIewModel>(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => locator<SettingsViewModel>(),
        ),
      ],
      child: Consumer<SettingsViewModel>(builder: (context, vm, _) {
        bool isLightTheme = vm.appThemeMode == ThemeMode.light;

        var themData = ThemeData(
            brightness: isLightTheme ? Brightness.light : Brightness.dark,
            textTheme: GoogleFonts.oxygenTextTheme(Theme.of(context).textTheme)
                .apply(
                    bodyColor: isLightTheme ? Colors.black : Colors.grey[100]),
            primarySwatch: AppColors.primaryColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: isLightTheme
                ? AppColors.scaffoldBackgroundColorLight
                : AppColors.scaffoldBackgroundColorDark,
            backgroundColor: isLightTheme
                ? AppColors.backgroundColorLight
                : AppColors.backgroundColorDark,
            appBarTheme: AppBarTheme(
              brightness: isLightTheme ? Brightness.light : Brightness.dark,
              elevation: 0,
              color: isLightTheme
                  ? AppColors.scaffoldBackgroundColorLight
                  : AppColors.scaffoldBackgroundColorDark,
            ));
//          print(Theme.of(context).brightness);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Muslim',
          themeMode: vm.appThemeMode,
          theme: themData,
          home: HomeScreen(),
        );
      }),
    );
  }
}
