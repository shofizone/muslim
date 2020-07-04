import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muslim/settings/settings_view_model.dart';
import 'package:muslim/values/colors.dart';
import 'package:provider/provider.dart';

class ToggleThemeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsViewModel>(builder: (BuildContext context, value, Widget child) {
      bool isLightTheme = Theme.of(context).brightness == Brightness.light;
      var icon  = !isLightTheme? FontAwesomeIcons.solidLightbulb: FontAwesomeIcons.lightbulb;
      return IconButton(onPressed: () {
        value.toggleLightDark();
      }, icon: Icon(icon,size: 18,),color: AppColors.primaryColor,);
    },);
  }
}
