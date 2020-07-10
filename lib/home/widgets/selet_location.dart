import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muslim/settings/settings_view_model.dart';
import 'package:provider/provider.dart';

class SelectLocationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsViewModel>(builder: (context, vm, child) {
      return Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: 45,
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(7)),
        child: InkWell(
          onTap: () {
            vm.pickLocationByGPS();
          },
          child: Row(
            children: [
              SizedBox(width: 10),
              Icon(FontAwesomeIcons.mapMarkerAlt, size: 18),
              SizedBox(width: 10),
              Text(vm.locationString ?? "Location"),
              SizedBox(width: 10),
            ],
          ),
        ),
      );
    });
  }
}
