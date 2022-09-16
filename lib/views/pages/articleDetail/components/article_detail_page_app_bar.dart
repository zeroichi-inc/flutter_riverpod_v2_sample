import 'package:flutter/material.dart';
import 'package:flutter_sample_app/models/qiita_article.dart';

class ArticleDetailPageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ArticleDetailPageAppBar({
    super.key,
    required this.article,
  });

  final QiitaArticle article;

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        article.title,
      ),
    );
  }
}
