import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/controller/news_controller.dart';
import 'package:new_app/model/articles.dart';
import 'package:new_app/page/drawer_categories_page.dart';
import 'package:new_app/page/item/news_item_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final NewsController newsController = Get.put(NewsController());

  @override
  void initState() {
    NewsController().getNewsWithSearchIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            setState(() {

            });
          }, icon: Icon(Icons.redo_sharp))
        ],
        title: Text("News"),
      ),
      drawer: DrawerCategoriesPage(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return GetBuilder<NewsController>(
      builder: (context) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final article = newsController.news.value.articles?[index].obs;
            return NewsItemPage(articles: article);
          },
          itemCount: newsController.news.value.articles?.length,
        );
      }
    );
  }
}
