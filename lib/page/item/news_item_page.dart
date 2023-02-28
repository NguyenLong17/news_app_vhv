import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_app/model/article.dart';
import 'package:new_app/page/webview_demo.dart';

class NewsItemPage extends StatefulWidget {
  final Rx<Article>? article;

  const NewsItemPage({super.key, this.article});

  @override
  State<NewsItemPage> createState() => _NewsItemPageState();
}

class _NewsItemPageState extends State<NewsItemPage> {
  @override
  Widget build(BuildContext context) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var dateInput = inputFormat.parse(widget.article?.value.publishedAt ?? '');

    var outputFormat = DateFormat('dd-MM-yyyy');
    var dateOutput = outputFormat.format(dateInput); //

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                WebViewNews(article: widget.article),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: widget.article?.value.urlToImage != null
                    ? CachedNetworkImage(
                        imageUrl: widget.article?.value.urlToImage ?? "",
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        // errorWidget: (context, url, error) =>
                        //     Image.asset("assets/images/google.png"),
                      )
                    : Image.asset("assets/images/google.png"),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                widget.article?.value.title ?? "",
                maxLines: 1,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                widget.article?.value.content ?? "",
                maxLines: 2,
                style: const TextStyle(color: Colors.black54, fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Text(
                        widget.article?.value.author ?? "",
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 12),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        dateOutput,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
