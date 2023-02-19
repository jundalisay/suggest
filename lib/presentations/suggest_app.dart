import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suggestion_app/bindings/disease_binder.dart';
import 'package:suggestion_app/presentations/diseases.dart';
import 'package:suggestion_app/presentations/index.dart';

import 'intro_screen.dart';

class SuggestApp extends StatelessWidget {
  const SuggestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const IntroScreen(),
      debugShowCheckedModeBanner: false,
      title: 'Pantry',
      theme: ThemeData(
        primaryColor: Colors.lightBlue[600],
        accentColor: Colors.white,
        fontFamily: 'Cabin',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 24.0, color: Colors.lightBlue[600]),
          // h1
          headline2:
              const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          // h2
          headline3: const TextStyle(fontSize: 20.0),
          // h2 a
          headline4: TextStyle(fontSize: 18.0, color: Colors.lightBlue[600]),
          // button white text
          headline5: const TextStyle(fontSize: 18.0, color: Colors.white),
          // search gray
          headline6: const TextStyle(fontSize: 18.0, color: Colors.grey),
          bodyText1:
              TextStyle(fontSize: 14.0, color: Colors.black.withOpacity(0.8)),
          bodyText2:
              TextStyle(fontSize: 12.0, color: Colors.black.withOpacity(0.8)),
        ),
      ),
      // defaultTransition: Transition.upToDown,
      // translations: PantryTranslations(),
      // locale: Locale('en', 'US'),
      getPages: [
        // GetPage(name: '/about',     page: () => About()),
        GetPage(name: '/index', page: () => const Index()),
        GetPage(
            name: '/diseases',
            page: () => const Diseases(),
            binding: DiseaseBinding()),
      ],
    );
  }
}
