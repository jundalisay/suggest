import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:suggest/locale/locale.dart';
// import 'locale/locale.dart';

import 'package:suggest/bindings/carbon_binder.dart';
import 'package:suggest/bindings/carbon_list_binder.dart';
import 'package:suggest/presentations/carbon_screen.dart';
import 'package:suggest/presentations/carbons.dart';

import 'package:suggest/bindings/disease_binder.dart';
import 'package:suggest/bindings/disease_list_binder.dart';
import 'package:suggest/presentations/disease_screen.dart';
import 'package:suggest/presentations/diseases.dart';

import 'package:suggest/bindings/junk_binder.dart';
import 'package:suggest/bindings/junk_list_binder.dart';
import 'package:suggest/presentations/junk_screen.dart';
import 'package:suggest/presentations/junks.dart';

import 'package:suggest/bindings/veg_binder.dart';
import 'package:suggest/bindings/veg_list_binder.dart';
import 'package:suggest/presentations/veg_screen.dart';
import 'package:suggest/presentations/vegs.dart';

import 'package:suggest/presentations/nutri_screen.dart';
import 'package:suggest/presentations/nutris.dart';
import 'package:suggest/bindings/nutri_binder.dart';
import 'package:suggest/bindings/nutri_list_binder.dart';

import 'package:suggest/presentations/index.dart';



class SuggestApp extends StatelessWidget {
  const SuggestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const Index(),
      debugShowCheckedModeBanner: false,
      title: 'Suggest',
      theme: _themeData(),
      translations: LocaleString(),
      locale: const Locale('en', 'US'),
      // defaultTransition: Transition.upToDown,
      // translations: PantryTranslations(),
      // locale: Locale('en', 'US'),
      getPages: [
        // GetPage(name: '/about',     page: () => About()),
        GetPage(name: '/index', page: () => const Index()),
        GetPage(
          name: '/diseases',
          page: () => const Diseases(),
          binding: DiseaseListBinding(),
          children: [
            GetPage(
              name: '/disease',
              page: () => DiseaseScreen(),
              binding: DiseaseBinding()
            ),
            GetPage(
                name: '/vegs',
                page: () => VegScreen(),
                binding: VegListBinding()
            ),
            GetPage(
                name: '/nutris',
                page: () => NutriScreen(),
                binding: NutriListBinding()
            ),
          ]           
        ),
        GetPage(
          name: '/junks',
          page: () => Junks(),
          binding: JunkListBinding(),
          children: [
            GetPage(
              name: '/junk',
              page: () => JunkScreen(),
              binding: JunkBinding()
            ),
          ]
        ),
        GetPage(
          name: '/vegs',
          page: () => Vegs(),
          binding: VegListBinding(),
          children: [
            GetPage(
              name: '/disease',
              page: () => DiseaseScreen(),
              binding: DiseaseBinding(),
            ),
            GetPage(
              name: '/veg',
              page: () => VegScreen(),
              binding: VegBinding(),
            ),
            GetPage(
              name: '/nutri',
              page: () => NutriScreen(),
              binding: NutriListBinding()
            ),
          ]
        ),
        GetPage(
          name: '/nutris',
          page: () => Nutris(),
          binding: NutriListBinding(),
          children: [
            GetPage(
              name: '/nutri',
              page: () => NutriScreen(),
              binding: NutriBinding()
            ),          
            GetPage(
              name: '/disease',
              page: () => DiseaseScreen(),
              binding: DiseaseBinding(),
            ),
            GetPage(
              name: '/veg',
              page: () => VegScreen(),
              binding: VegBinding(),
            ),
          ]
        ),        
        GetPage(
          name: '/carbons',
          page: () => Carbons(),
          binding: CarbonListBinding(),
          children: [
            GetPage(
              name: '/carbon',
              page: () => CarbonScreen(),
              binding: CarbonBinding()
            ),
          ],
        ),                
      ],
    );
  }

  ThemeData _themeData() {
    return ThemeData(
      primaryColor: Colors.lightBlue[600],
      accentColor: Colors.white,
      fontFamily: 'Quicksand',
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.indigo[900]),
        headline2: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.teal[800]),
        headline3: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.pink),
        headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.blue),
        headline5: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.green),
        headline6: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.red),        
        bodyText1: TextStyle(fontSize: 16.0, color: Colors.black.withOpacity(0.8)),
        bodyText2: TextStyle(fontSize: 16.0, color: Colors.black.withOpacity(0.8)),
      ),
    );
  }
}


// headline1 96.0  light -1.5  
// headline2 60.0  light -0.5  
// headline3 48.0  regular 0.0 
// headline4 34.0  regular 0.25  
// headline5 24.0  regular 0.0 
// headline6 20.0  medium  0.15  
// subtitle1 16.0  regular 0.15  
// subtitle2 14.0  medium  0.1 
// body1 16.0  regular 0.5 (bodyText1)
// body2 14.0  regular 0.25  (bodyText2)
// button  14.0  medium  1.25  
// caption 12.0  regular 0.4 
// overline  10.0  regular 1.5