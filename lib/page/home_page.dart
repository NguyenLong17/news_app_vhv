import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/controller/news_controller.dart';
import 'package:new_app/model/article.dart';
import 'package:new_app/page/drawer_categories_page.dart';
import 'package:new_app/page/item/news_item_page.dart';
import 'package:new_app/page/webview_demo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();

  final NewsController newsController = Get.put(NewsController());

  @override
  void initState() {
    NewsController().getNewsWithSearchIn();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    newsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
      ),
      drawer: DrawerCategoriesPage(),
      body: Column(
        children: [
          searchBody(),
          Expanded(child: listArticleBody()),
        ],
      ),
    );
  }

  Widget searchBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                labelText: "Tìm kiếm",
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Container(
            width: 72,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(15)),
            child: IconButton(
              onPressed: () {
                NewsController().listArticle.clear();
                NewsController().pageListArticle = 0;
                if (searchController.text.isNotEmpty) {
                  NewsController()
                      .getNewsWithSearchIn(keyWord: searchController.text);
                } else {
                  NewsController().getNewsWithSearchIn();
                }
                FocusScope.of(context).unfocus();
              },
              color: Colors.white,
              icon: const Icon(Icons.search),
            ),
          )
        ],
      ),
    );
  }

  Widget listArticleBody() {
    return GetBuilder<NewsController>(builder: (context) {
      return ListView.builder(
        itemBuilder: (context, index) {
          if (index == newsController.listArticle.length - 1) {
            if (searchController.text.isEmpty) {
              newsController.getNewsWithSearchIn(keyWord: "flutter");
            } else {
              newsController.getNewsWithSearchIn(
                  keyWord: searchController.text);
            }
          }
          final article = newsController.listArticle[index].obs;
          return NewsItemPage(article: article);
        },
        itemCount: newsController.listArticle.length,
      );
    });
  }
}
