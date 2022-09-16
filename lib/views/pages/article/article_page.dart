import 'package:flutter/material.dart';
import 'package:flutter_sample_app/views/pages/article/components/article_page_app_bar.dart';
import 'package:flutter_sample_app/views/pages/article/components/article_page_body.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ArticlePageAppBar(),
      body: ArticlePageBody(),
      backgroundColor: Colors.white,
    );
  }
}
