import 'package:flutter/material.dart';

class ArticlePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ArticlePageAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        '記事一覧',
      ),
    );
  }
}
