import 'package:get/get.dart';
import 'package:new_app/model/News.dart';
import 'package:new_app/service/api_service.dart';
import 'package:new_app/service/news_service.dart';

class NewsController extends GetxController {
  static final _singleton = NewsController._internal();

  factory NewsController() => _singleton;


  NewsController._internal();

   Rx<News> news = News().obs;

  Future getNewsWithSearchIn() async {
    await apiService.getNews(searchIn: "flutter", pageSize: 10, page: 1).then((value) {
      news = value.obs;
      print('NewsController.getNewsWithSearchIn: ${news.value.articles?.length}');
      NewsController().update();
    }).catchError((e) {
      print('NewsController.getNewsWithSearchIn: ${e.toString()}');
    });
  }

}

