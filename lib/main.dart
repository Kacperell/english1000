import 'package:english1000/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'ap_localisations.dart';

void main() {
  runApp(MaterialApp(
    // home: Home(),
    supportedLocales: [
      Locale('en', 'EN'),
      Locale('pl', 'PL'),
    ],
    localizationsDelegates: [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    localeResolutionCallback: (locale, supportedLocales) {
      // Check if the current device locale is supported
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode &&
            supportedLocale.countryCode == locale.countryCode) {
          return supportedLocale;
        }
      }
    },
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      // '/home': (context) => Home(),
      // '/location': (context) => ChooseLocation()
    },
  ));
}
