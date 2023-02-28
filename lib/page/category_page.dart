import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/controller/category_controller.dart';
import 'package:new_app/controller/news_controller.dart';
import 'package:new_app/page/item/news_item_page.dart';

class CategoryPage extends StatefulWidget {
  final String category;

  const CategoryPage({
    super.key,
    required this.category,
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  void initState() {
    categoryController.getNewsByCategory(category: widget.category);
    super.initState();
  }

  @override
  void dispose() {
    categoryController.pageListCategory = 0;
    categoryController.listCategory.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.category} Category"),
      ),
      body: listArticleBody(),
    );
  }

  Widget listArticleBody() {
    return GetBuilder<CategoryController>(builder: (context) {
      return ListView.builder(
        itemBuilder: (context, index) {
          if (index == categoryController.listCategory.length - 1) {
            categoryController.getNewsByCategory(category: widget.category);
          }
          final article = categoryController.listCategory[index].obs;
          return NewsItemPage(article: article);
        },
        itemCount: categoryController.listCategory.length,
      );
    });
  }
}
