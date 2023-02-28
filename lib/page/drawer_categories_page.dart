import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/controller/news_controller.dart';
import 'package:new_app/page/category_page.dart';

class DrawerCategoriesPage extends StatelessWidget {
  DrawerCategoriesPage({Key? key}) : super(key: key);

  final NewsController newsController = Get.put(NewsController());

  final categories = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Technology",
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
                child: Text(
              'Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(categories[index]),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CategoryPage(category: categories[index])));

                    // Navigator.of(context).pop();
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: categories.length,
            ),
          ),
        ],
      ),
      // child: ListView(
      //   // Important: Remove any padding from the ListView.
      //   padding: EdgeInsets.zero,
      //   children: [
      //     const DrawerHeader(
      //       decoration: BoxDecoration(
      //         color: Colors.blue,
      //       ),
      //       child: Center(
      //           child: Text(
      //         'Categories',
      //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //       )),
      //     ),
      //     ListTile(
      //       title: const Text('Business'),
      //       onTap: () {
      //         print('DrawerCategoriesPage.build');
      //         // newsController.getNewsByCategory(category: "business");
      //         // Get.to(WebViewDemo());
      //         Get.to(CategoryPage(category: "business"));
      //         // Navigator.push(context,  MaterialPageRoute(builder: (context) => CategoryPage(category: "business")));
      //         // Navigator.of(context).pop();
      //       },
      //     ),
      //     ListTile(
      //       title: const Text('Entertainment'),
      //       onTap: () {
      //         Navigator.of(context).pop();
      //
      //         // newsController.getNewsByCategory(category: "entertainment");
      //
      //         // Update the state of the app.
      //         // ...
      //       },
      //     ),
      //     ListTile(
      //       title: const Text('General'),
      //       onTap: () {
      //         // newsController.getNewsByCategory(category: "general");
      //
      //         // Update the state of the app.
      //         // ...
      //         Navigator.of(context).pop();
      //       },
      //     ),
      //     ListTile(
      //       title: const Text('Health'),
      //       onTap: () {
      //         // Update the state of the app.
      //         // ...
      //         Navigator.of(context).pop();
      //       },
      //     ),
      //     ListTile(
      //       title: const Text('Science'),
      //       onTap: () {
      //         // Update the state of the app.
      //         // ...
      //         Navigator.of(context).pop();
      //       },
      //     ),
      //     ListTile(
      //       title: const Text('Technology'),
      //       onTap: () {
      //         // Update the state of the app.
      //         // ...
      //         Navigator.of(context).pop();
      //       },
      //     ),
      //   ],
      // ),
    );
  }
}
