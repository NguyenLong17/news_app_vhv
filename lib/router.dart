import 'package:flutter/material.dart';
import 'package:new_app/page/home_page.dart';
import 'package:new_app/page/webview_demo.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const HomePage());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                appBar: AppBar(
                  title: const Text('404'),
                ),
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
