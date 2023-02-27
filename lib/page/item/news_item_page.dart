import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/model/articles.dart';

class NewsItemPage extends StatefulWidget {
  final Rx<Articles>? articles;

  const NewsItemPage({super.key, this.articles});

  @override
  State<NewsItemPage> createState() => _NewsItemPageState();
}

class _NewsItemPageState extends State<NewsItemPage> {
  @override
  Widget build(BuildContext context) {

    return Card(
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
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: CachedNetworkImage(
                imageUrl:
                widget.articles?.value.urlToImage ?? "",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 4,),

            Text(
              widget.articles?.value.title ?? "",
              maxLines: 1,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              widget.articles?.value.content ?? "",
              maxLines: 2,
              style: TextStyle(color: Colors.black54, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
