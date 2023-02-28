import 'package:get/get.dart';
import 'package:new_app/model/article.dart';
import 'package:new_app/service/api_service.dart';
import 'package:new_app/service/news_service.dart';

class CategoryController extends GetxController {
  static final _singleton = CategoryController._internal();

  factory CategoryController() => _singleton;

  CategoryController._internal();

  RxList<Article> listCategory = <Article>[].obs;
  var pageListCategory = 0;

  void increasePageCategory() {
    pageListCategory++;
  }

  Future getNewsByCategory({
    required String category,
    bool isClear = false,
  }) async {
    increasePageCategory();
    await apiService
        .getArticleByCategory(
            category: category,
            pageSize: 10,
            page: isClear ? 0 : pageListCategory)
        .then((value) {
      if (isClear) {
        listCategory.clear();
      }
      if (value.isNotEmpty) {
        listCategory.addAll(value.obs);
        CategoryController().update();
      } else if (isClear) {
        CategoryController().update();
      }
    }).catchError((e) {
      print('CategoryController.getNewsByCategory"  ${e.toString()}');
    });
  }
}
