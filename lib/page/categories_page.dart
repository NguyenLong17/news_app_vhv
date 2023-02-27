import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category selected"),
      ),
      body: Container(),
    );
  }

  // Widget buildBody() {
  //   return GetBuilder<NewsController>(
  //       builder: (context) {
  //         return ListView.builder(
  //           itemBuilder: (context, index) {
  //             final article = newsController.news.value.articles?[index].obs;
  //             return NewsItemPage(articles: article);
  //           },
  //           itemCount: newsController.news.value.articles?.length,
  //         );
  //       }
  //   );
  // }

}
