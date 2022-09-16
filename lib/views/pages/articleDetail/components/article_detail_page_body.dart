import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/models/qiita_article.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailPageBody extends StatelessWidget {
  const ArticleDetailPageBody({
    super.key,
    required this.article,
  });

  final QiitaArticle article;

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: article.url,
    );
  }
}
