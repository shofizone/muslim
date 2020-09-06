import 'package:flutter/material.dart';
import 'package:muslim/locator.dart';
import 'package:muslim/main_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MainApp());
}


