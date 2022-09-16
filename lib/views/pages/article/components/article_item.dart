import 'package:flutter/material.dart';
import 'package:flutter_sample_app/models/qiita_article.dart';
import 'package:flutter_sample_app/views/pages/articleDetail/article_detail_page.dart';
import 'package:get/get.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({
    super.key,
    required this.article,
  });

  final QiitaArticle article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          ArticleDetailPage(article: article),
          fullscreenDialog: true,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: Colors.grey.shade200,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(article.title),
          ],
        ),
      ),
    );
  }
}
