import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suggest/locale/locale.dart';


class Menu extends StatelessWidget {

  final List locale = [
    {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
    {'name': 'हिंदी', 'locale': const Locale('tl', 'TL')},
    {'name': 'Arabic', 'locale': const Locale('cb', 'CB')},
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),            
            accountName: Text('View diseases and the proper food'),
            accountEmail: Text('For support please email juan@scenac.org'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.indigo,
              child: Image(
                image: AssetImage('assets/scenac.png'), // or NetworkImage for network images
                width: 200,
                height: 200,
                fit: BoxFit.cover, // adjust the image's size and aspect ratio
              ),
            ),
          ),
          ExpansionTile(
            leading: Icon(Icons.home),        
            title: Text("Language"),
            children: [
              ListTile(
                leading: Icon(Icons.home),
                title: Text("English"),
                onTap: () {
                  Navigator.pop(context);
                  Get.updateLocale(Locale('en', 'EN'));
                },                  
              ),           
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Tagalog"),
                onTap: () {
                  Navigator.pop(context);                  
                  Get.updateLocale(Locale('tl', 'TL'));
                },                  
              ),
            ],
          ),                                                                 
          Text("Localization Menu will be here")
          // ListTile(
          //   leading: Icon(Icons.home),
          //   title: Text('Home'),
          //   onTap: () {
          //     // Navigate to home screen.
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text('Settings'),
          //   onTap: () {
          //     // Navigate to settings screen.
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.help),
          //   title: Text('Help & Feedback'),
          //   onTap: () {
          //     // Navigate to help screen.
          //   },
          // ),
          // Divider(),
          // ListTile(
          //   leading: Icon(Icons.exit_to_app),
          //   title: Text('Sign Out'),
          //   onTap: () {
          //     // Sign out user.
          //   },
          // ),
        ],
      ),
    );
  }
}