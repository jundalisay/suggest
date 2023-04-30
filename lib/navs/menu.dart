import 'package:flutter/material.dart';


class Menu extends StatelessWidget {

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
            accountName: Text('SCENAC Suggest is an app for viewing diseases and food'),
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
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Navigate to home screen.
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Navigate to settings screen.
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help & Feedback'),
            onTap: () {
              // Navigate to help screen.
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sign Out'),
            onTap: () {
              // Sign out user.
            },
          ),
        ],
      ),
    );
  }
}