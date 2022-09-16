import 'package:flutter/material.dart';
import 'package:flutter_sample_app/models/qiita_article.dart';
import 'package:flutter_sample_app/views/pages/articleDetail/components/article_detail_page_app_bar.dart';
import 'package:flutter_sample_app/views/pages/articleDetail/components/article_detail_page_body.dart';

class ArticleDetailPage extends StatelessWidget {
  const ArticleDetailPage({
    super.key,
    required this.article,
  });

  final QiitaArticle article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArticleDetailPageAppBar(article: article),
      body: ArticleDetailPageBody(article: article),
      backgroundColor: Colors.white,
    );
  }
}
