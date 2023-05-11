import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:suggest/locale/locale.dart';
// import 'locale/locale.dart';

import 'package:suggest/bindings/disease_binder.dart';
import 'package:suggest/bindings/disease_list_binder.dart';
import 'package:suggest/presentations/disease_screen.dart';

import 'package:suggest/bindings/junk_binder.dart';
import 'package:suggest/bindings/junk_list_binder.dart';
import 'package:suggest/presentations/junk_screen.dart';

import 'package:suggest/bindings/veg_binder.dart';
import 'package:suggest/bindings/veg_list_binder.dart';
import 'package:suggest/presentations/veg_screen.dart';

import 'package:suggest/presentations/nutri_screen.dart';
import 'package:suggest/bindings/nutri_binder.dart';
import 'package:suggest/bindings/nutri_list_binder.dart';

import 'package:suggest/presentations/seller_screen.dart';
import 'package:suggest/bindings/seller_binder.dart';
import 'package:suggest/bindings/seller_list_binder.dart';

// import 'package:suggest/presentations/practice_screen.dart';
// import 'package:suggest/bindings/practice_binder.dart';
// import 'package:suggest/bindings/practice_list_binder.dart';

import 'package:suggest/bindings/carbon_binder.dart';
import 'package:suggest/bindings/carbon_list_binder.dart';
import 'package:suggest/presentations/carbon_screen.dart';

import 'package:suggest/presentations/quiz.dart';

import 'package:suggest/presentations/index.dart';
import 'package:suggest/presentations/widgets/list_item_page.dart';



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
          page: () => ListItemPage(
            title: "Diseases",
            backIcon: const Icon(Icons.arrow_back),
            itemRoute: "/diseases/disease"
          ),
          binding: DiseaseListBinding(),
          children: [
            GetPage(
              name: '/disease',
              page: () => DiseaseScreen(),
              binding: DiseaseBinding()
            ),
          ]
        ),
        GetPage(
          name: '/junks',
          page: () => ListItemPage(
            title: "Unhealthy Foods",
            backIcon: const Icon(Icons.arrow_back),
            itemRoute: "/junks/junk"
          ),
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
          page: () => ListItemPage(
            title: "Vegetables",
            backIcon: Icon(Icons.arrow_back),
            itemRoute: "/vegs/veg"
          ),
          binding: VegListBinding(),
          children: [
            GetPage(
              name: '/veg',
              page: () => VegScreen(),
              binding: VegBinding(),
            ),
          ]
        ),
        GetPage(
          name: '/nutris',
          page: () => ListItemPage(
            title: "Nutritions",
            backIcon: Icon(Icons.arrow_back),
            itemRoute: "nutris/nutri"
          ),
          binding: NutriListBinding(),
          children: [
          GetPage(
            name: '/nutri',
            page: () => NutriScreen(),
            binding: NutriBinding()),
          ]
        ),
        GetPage(
          name: '/sellers',
          page: () => ListItemPage(
            title: "Sellers".tr,
            backIcon: const Icon(Icons.arrow_back),
            itemRoute: "/sellers/seller"
          ),
          binding: SellerListBinding(),
          children: [
            GetPage(
              name: '/seller',
              page: () => SellerScreen(),
              binding: SellerBinding()
            ),
          ]
        ),        
        GetPage(
          name: '/carbons',
          page: () => ListItemPage(
              title: "Carbons",
              backIcon: Icon(Icons.arrow_back),
              itemRoute: "/carbons/carbon"),
          binding: CarbonListBinding(),
          children: [
            GetPage(
                name: '/carbon',
                page: () => CarbonScreen(),
                binding: CarbonBinding()),
          ],
        ),
        GetPage(
          name: '/quiz',
          page: () => Quiz()
        )
      ],
    );
  }

        //   page: () => Vegs(),
        //   binding: VegListBinding(),
        //   children: [
        //     GetPage(
        //       name: '/disease',
        //       page: () => DiseaseScreen(),
        //       binding: DiseaseBinding(),
        //     ),
        //     GetPage(
        //       name: '/veg',
        //       page: () => VegScreen(),
        //       binding: VegBinding(),
        //     ),
        //     GetPage(
        //       name: '/nutri',
        //       page: () => NutriScreen(),
        //       binding: NutriListBinding()
        //     ),
        //   ]
        // ),

  ThemeData _themeData() {
    return ThemeData(
      primaryColor: Colors.lightBlue[600],
      // accentColor: Colors.white,
      fontFamily: 'Quicksand',
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.indigo[900]),
        headline2: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.teal[800]),
        headline3: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.pink),
        headline4: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.blue),
        headline5: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.green),
        headline6: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.red),        
        bodyText1: TextStyle(fontSize: 15.0, color: Colors.black.withOpacity(0.9)),
        bodyText2: TextStyle(fontSize: 15.0, color: Colors.black.withOpacity(0.9)),
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
