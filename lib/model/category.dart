import 'package:new_app/model/articles.dart';

/// status : "ok"
/// totalResults : 1000
/// articles : [{"source":{"id":"google-news","name":"Google News"},"author":"iDNES.cz","title":"Řezníčka nezastavil ani brácha v bráně, gól ale neslavil. Bylo by to zlé, řekl - iDNES.cz - iDNES.cz","description":null,"url":"https://news.google.com/rss/articles/CBMidmh0dHBzOi8vd3d3LmlkbmVzLmN6L2ZvdGJhbC9wcnZuaS1saWdhL2ZvcnR1bmEtbGlnYS1ib2hlbWlhbnMtemJyb2pvdmthLWJybm8tamFrdWItcmV6bmljZWsuQTIzMDIyNV8xODIwNDJfZm90YmFsX2R1ZmbSAQA?oc=5","urlToImage":null,"publishedAt":"2023-02-26T07:59:00Z","content":null},{"source":{"id":"google-news","name":"Google News"},"author":"SPORT1","title":"FC Bayern - Union Berlin: Lothar Matthäus mit harten Unioner-Zeugnis - SPORT1","description":null,"url":"https://news.google.com/rss/articles/CBMiZmh0dHBzOi8vd3d3LnNwb3J0MS5kZS9uZXdzL2Z1c3NiYWxsL2J1bmRlc2xpZ2EvMjAyMy8wMi9tYXR0aGF1cy1rZWluLXVuaW9uZXItaGF0dGUtZGFzLXpldWctZnVyLWJheWVybtIBJWh0dHBzOi8vYW1wLnNwb3J0MS5kZS9hcnRpY2xlLzY0Mzg2MTE?oc=5","urlToImage":null,"publishedAt":"2023-02-26T07:53:14Z","content":null}]

class CategoryNews {
  CategoryNews({
      this.status, 
      this.totalResults, 
      this.articles,});

  CategoryNews.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
  }
  String? status;
  num? totalResults;
  List<Articles>? articles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// source : {"id":"google-news","name":"Google News"}
/// author : "iDNES.cz"
/// title : "Řezníčka nezastavil ani brácha v bráně, gól ale neslavil. Bylo by to zlé, řekl - iDNES.cz - iDNES.cz"
/// description : null
/// url : "https://news.google.com/rss/articles/CBMidmh0dHBzOi8vd3d3LmlkbmVzLmN6L2ZvdGJhbC9wcnZuaS1saWdhL2ZvcnR1bmEtbGlnYS1ib2hlbWlhbnMtemJyb2pvdmthLWJybm8tamFrdWItcmV6bmljZWsuQTIzMDIyNV8xODIwNDJfZm90YmFsX2R1ZmbSAQA?oc=5"
/// urlToImage : null
/// publishedAt : "2023-02-26T07:59:00Z"
/// content : null
