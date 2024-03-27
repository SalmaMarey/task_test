import 'package:flutter/material.dart';
import 'package:markaz_el_amal/constants/shared_preferences.dart';
import 'package:markaz_el_amal/my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}
