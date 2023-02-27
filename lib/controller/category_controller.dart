import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_app/model/News.dart';
import 'package:new_app/model/category.dart';
import 'package:new_app/service/api_service.dart';
import 'package:new_app/service/category_service.dart';
import 'package:new_app/service/news_service.dart';

class CategoryController extends GetxController {
  static final _singleton = CategoryController._internal();

  factory CategoryController() => _singleton;

  CategoryController._internal();

  Rx<CategoryNews> category = CategoryNews().obs;

  Future getNewsByCategory() async {
    await apiService.getNewsByCategory(category: "sport").then((value) {
      category = value.obs;
    }).catchError((e) {
      print('CategoryController.getNewsByCategory"  ${e.toString()}');
    });
  }
}
