import 'package:flutter/material.dart';
import 'package:flutter_sample_app/models/qiita_article.dart';
import 'package:flutter_sample_app/views/pages/article/components/article_item.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({
    super.key,
    required this.data,
  });

  final List<QiitaArticle> data;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return ArticleItem(article: data[index]);
        },
        childCount: data.length,
      ),
    );
  }
}
