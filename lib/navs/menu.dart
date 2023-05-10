import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:suggest/locale/locale.dart';
import 'package:suggest/controllers/host_controller.dart';



class Menu extends StatelessWidget {

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  HostController controller = Get.put(HostController());

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
            accountName: Text(Get.find<HostController>().city),
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
          ListTile(
            leading: Image.asset(
              "assets/us.png",
              height: 30,
              width: 40,
              fit: BoxFit.fitWidth,              
            ),
            title: Text("English"),
            onTap: () {
              Navigator.pop(context);
              Get.updateLocale(Locale('en', 'EN'));
            },                  
          ),           
          ListTile(
            leading: Image.asset(
              "assets/ph.png",
              height: 30,
              width: 40,
              fit: BoxFit.fitWidth,              
            ),
            title: Text("Tagalog"),
            onTap: () {
              Navigator.pop(context);
              Get.updateLocale(Locale('tl', 'TL'));
            },                  
          ),
          ListTile(
            leading: Image.asset(
              "assets/ph.png",
              height: 30,
              width: 40,
              fit: BoxFit.fitWidth,              
            ),
            title: Text("Cebuano"),
            onTap: () {
              Navigator.pop(context);
              Get.updateLocale(Locale('cb', 'CB'));
            },                  
          ),
          Divider(),
          ExpansionTile(
            // leading: Image.asset('assets/flags/jp.png', height: 50, width: 50,),              
            title: Text("Metro Manila"),
            children: [
              ListTile(
                // leading: Icon(FontAwesomeIcons.mapMarkerAlt), 
                title: Text("Las Pinas"),
                onTap: () {
                  Navigator.pop(context);
                  Get.find<HostController>().laspinas();                  
                },                  
              ),           
              ListTile(
                // leading: Icon(FontAwesomeIcons.mapMarkerAlt), 
                title: Text("Makati"),
                onTap: () {
                  Navigator.pop(context);
                  Get.find<HostController>().makati();                                    
                },                  
              ),
            ],
          ),   
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