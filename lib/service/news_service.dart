import 'package:new_app/model/News.dart';
import 'package:new_app/service/api_service.dart';

extension NewsService on APIService {
  Future<News> getNews({
    required String searchIn,
    required int pageSize,
    required  int page,
  }) async {
    final result = await request(
      path: '/everything?q=$searchIn&pageSize=$pageSize&page=$page&',
      method: Method.get,
    );

    final news = News.fromJson(result);

    return news;
  }
}
