import 'package:get/get.dart';
import 'package:new_app/model/article.dart';
import 'package:new_app/service/api_service.dart';
import 'package:new_app/service/news_service.dart';

class NewsController extends GetxController {
  static final _singleton = NewsController._internal();

  factory NewsController() => _singleton;

  NewsController._internal();

  RxList<Article> listArticle = <Article>[].obs;

  var pageListArticle = 0;

  // var page = 0;

  void increasePageArticle() {
    pageListArticle++;
  }

  Future getNewsWithSearchIn({
    String? keyWord,
    bool isClear = false,
  }) async {
    increasePageArticle();

    await apiService
        .getArticle(
      searchIn: keyWord ?? "flutter",
      pageSize: 10,
      page: isClear ? 0 : pageListArticle,
    )
        .then((value) {
      if (isClear) {
        listArticle.clear();
      }
      if (value.isNotEmpty) {
        listArticle.addAll(value.obs);
        NewsController().update();
      } else if (isClear) {
        NewsController().update();
      }
    }).catchError((e) {
      print('NewsController.getNewsWithSearchIn: ${e.toString()}');
    });
  }

// Future searchNews({
//   required String keyWord,
//   bool isClear = false,
// }) async {
//
//   increasePageArticle();
//   await apiService
//       .getArticle(
//     searchIn: keyWord,
//     pageSize: 10,
//     page: isClear ? 0 : pageListArticle,
//   )
//       .then((value) {
//
//
//     if (isClear) {
//       listArticle.clear();
//     }
//     if (value.isNotEmpty) {
//       listArticle.addAll(value.obs);
//       NewsController().update();
//     } else if (isClear) {
//       NewsController().update();
//     }
//   }).catchError((e) {
//     print('NewsController.getNewsWithSearchIn: ${e.toString()}');
//   });
// }

}
