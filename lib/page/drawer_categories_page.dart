import 'package:flutter/material.dart';

class DrawerCategoriesPage extends StatelessWidget {
  DrawerCategoriesPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(child: Text('Categories', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
          ),
          ListTile(
            title: const Text('Business'),
            onTap: () {
            Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Entertainment'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.of(context).pop();

            },
          ),
          ListTile(
            title: const Text('General'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.of(context).pop();

            },
          ),
          ListTile(
            title: const Text('Health'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.of(context).pop();

            },
          ),
          ListTile(
            title: const Text('Science'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.of(context).pop();

            },
          ),
          ListTile(
            title: const Text('Technology'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.of(context).pop();

            },
          ),
        ],
      ),
    );
  }
}
