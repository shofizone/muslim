import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim/values/colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
      textTheme: GoogleFonts.oxygenTextTheme(),
      primarySwatch: AppColors.primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorLight,
      backgroundColor: AppColors.backgroundColorLight,
      appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        elevation: 0,
        color: AppColors.scaffoldBackgroundColorLight,
      ));

  static ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
      textTheme:
          GoogleFonts.oxygenTextTheme().apply(bodyColor: Colors.grey[100]),
      primarySwatch: AppColors.primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorDark,
      backgroundColor: AppColors.backgroundColorDark,
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        elevation: 0,
        color: AppColors.scaffoldBackgroundColorDark,
      ));

  static _getTheme(bool _isLightTheme) {
    ThemeData(
        brightness: _isLightTheme ? Brightness.light : Brightness.dark,
        textTheme: GoogleFonts.oxygenTextTheme()
            .apply(bodyColor: _isLightTheme ? Colors.black : Colors.grey[100]),
        primarySwatch: AppColors.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: _isLightTheme
            ? AppColors.scaffoldBackgroundColorLight
            : AppColors.scaffoldBackgroundColorDark,
        backgroundColor: _isLightTheme
            ? AppColors.backgroundColorLight
            : AppColors.backgroundColorDark,
        appBarTheme: AppBarTheme(
          brightness: _isLightTheme ? Brightness.light : Brightness.dark,
          elevation: 0,
          color: _isLightTheme
              ? AppColors.scaffoldBackgroundColorLight
              : AppColors.scaffoldBackgroundColorDark,
        ));
  }
}
