import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

@immutable
class PrayerModel extends Equatable{
  final String name;
  final DateTime time;
  const PrayerModel({this.name, this.time});
  String get timeString => DateFormat("hh:mm a").format(time);

  @override
  // TODO: implement props
  List<Object> get props => [name,time];
}
