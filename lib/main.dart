import 'package:flutter/material.dart';
import 'package:world_time/pages/HomePage.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => LoadingScreen(),
      '/home': (context) => Home(),
      '/chooseLocation': (context) => ChooceLocation()
    },
  ));
}
