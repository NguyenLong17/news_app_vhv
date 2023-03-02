import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/page/home_page.dart';
import 'package:new_app/page/item/news_item_page.dart';
import 'package:new_app/page/webview_demo.dart';
import 'package:new_app/router.dart';
import 'package:new_app/service/api_service.dart';
import 'package:new_app/service/news_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
