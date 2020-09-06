import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:muslim/settings/settings_controller.dart';
import 'package:muslim/values/colors.dart';
import 'package:provider/provider.dart';

class ToggleThemeWidget extends StatelessWidget {
  final SettingsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    var icon = !isLightTheme
        ? FontAwesomeIcons.solidLightbulb
        : FontAwesomeIcons.lightbulb;
    return IconButton(
      onPressed: () {
       _controller.toggleLightDark();
      },
      icon: Icon(
        icon,
        size: 18,
      ),
      color: AppColors.primaryColor,
    );
    // return Consumer<SettingsController>(
    //   builder: (BuildContext context, value, Widget child) {
    //     bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    //     var icon = !isLightTheme
    //         ? FontAwesomeIcons.solidLightbulb
    //         : FontAwesomeIcons.lightbulb;
    //
    //   },
    // );
  }
}
