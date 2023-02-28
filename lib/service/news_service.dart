import 'package:new_app/model/article.dart';
import 'package:new_app/service/api_service.dart';

extension ArticleService on APIService {
  Future<List<Article>> getArticle({
    required String searchIn,
    required int pageSize,
    required int page,
  }) async {
    final result = await request(
      path: '/everything?q=$searchIn&pageSize=$pageSize&page=$page&',
      method: Method.get,
    );

    final articles = List<Article>.from(result.map((e) => Article.fromJson(e)));

    return articles;
  }

  Future<List<Article>> getArticleByCategory({
    required String category,
    required int pageSize,
    required int page,
  }) async {
    final result = await request(
      path: '/top-headlines?category=$category&pageSize=$pageSize&page=$page&',
      method: Method.get,
    );

    final articlesByCategory =
        List<Article>.from(result.map((e) => Article.fromJson(e)));

    return articlesByCategory;
  }
}
