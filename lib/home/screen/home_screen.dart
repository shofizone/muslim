import 'package:flutter/material.dart';
import 'package:muslim/home/widgets/current_time.dart';
import 'package:muslim/home/widgets/prayer_time_today.dart';
import 'package:muslim/home/widgets/selet_location.dart';
import 'package:muslim/home/widgets/toggle_theme.dart';
import 'package:muslim/home/widgets/upcomming_prayer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Muslim"),
        actions: [
          ToggleThemeWidget(),
        ],
      ),
      body: ListView(
        children: [
          Column(children: [
            SelectLocationWidget(),
            CurrentTime(),
            SizedBox(height: 40,),
            UpComingPrayer(),
          ],),

          PrayerTimeToday(),
        ],
      ),
    );
  }
}
