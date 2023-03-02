import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_app/model/article.dart';
import 'package:new_app/page/webview_demo.dart';

class NewDetailPage extends StatefulWidget {
  final Article article;

  const NewDetailPage({super.key, required this.article});

  @override
  State<NewDetailPage> createState() => _NewDetailPageState();
}

class _NewDetailPageState extends State<NewDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title ?? ""),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildImageArticle(),
          SizedBox(
            height: 8,
          ),
          buildContentArticle(),
        ],
      ),
    );
  }

  Widget buildImageArticle() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(25)),
      child: widget.article.urlToImage != null
          ? CachedNetworkImage(
              imageUrl: widget.article.urlToImage ?? "",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) =>
                  Image.asset("assets/images/google.png"),
            )
          : Image.asset("assets/images/google.png"),
    );
  }

  Widget buildContentArticle() {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var dateInput = inputFormat.parse(widget.article.publishedAt ?? '');
    var outputFormat = DateFormat('dd-MM-yyyy');
    var dateOutput = outputFormat.format(dateInput); //

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tiltle: ${widget.article.title ?? ""}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "PublishedAt: $dateOutput",
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Source: ${widget.article.source?.name ?? ""}",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Author: ${widget.article.author ?? ""}",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Description: ${widget.article.description ?? ""}",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Content: ${widget.article.content ?? ""}",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      WebViewNews(url: widget.article.url ??  "https://www.google.com.vn/"),
                ),
              );
            },
            child: Text(
              "Url: ${widget.article.url ?? ""}",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
