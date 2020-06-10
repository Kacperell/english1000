import 'package:english1000/pages/hom.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    // home: Home(),
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      // '/home': (context) => Home(),
      // '/location': (context) => ChooseLocation()
    },
  ));
}
