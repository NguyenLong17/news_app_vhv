import 'package:new_app/model/News.dart';
import 'package:new_app/model/category.dart';
import 'package:new_app/service/api_service.dart';

extension NewsService on APIService {
  Future<CategoryNews> getNewsByCategory({
    required String category,
  }) async {
    final result = await request(
      path: '/top-headlines/sources?category=$category',
      method: Method.get,
    );


    final categoryData = CategoryNews.fromJson(result);

    return categoryData;
  }
}
