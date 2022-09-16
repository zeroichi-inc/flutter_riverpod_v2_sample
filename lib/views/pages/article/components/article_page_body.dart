import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/models/qiita_article.dart';
import 'package:flutter_sample_app/viewModels/article_list_view_model.dart';
import 'package:flutter_sample_app/views/components/on_going_bottom.dart';
import 'package:flutter_sample_app/views/pages/article/components/article_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticlePageBody extends HookConsumerWidget {
  const ArticlePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // AsyncValueの変更を監視
    final AsyncValue<List<QiitaArticle>> asyncValue =
        ref.watch(articleListViewModelProvider);


    return NotificationListener<ScrollEndNotification>(
      child: Scrollbar(
        child: CustomScrollView(
          restorationId: 'articles',
          slivers: <Widget>[
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                ref.read(articleListViewModelProvider.notifier).refresh();
              },
            ),
            asyncValue.when(
              // データ取得完了
              data: (data) {
                return ArticleList(data: data);
              },
              // エラー発生
              error: ((error, stackTrace) {
                // 取得済みのデータがあるならデータ表示
                if (asyncValue.hasValue) {
                  return ArticleList(data: asyncValue.value ?? []);
                }

                return const SliverPadding(
                  padding: EdgeInsets.all(24.0),
                  sliver: SliverToBoxAdapter(
                    child: Center(
                      child: Text('エラーが発生しました'),
                    ),
                  ),
                );
              }),
              // 初回ローディング
              loading: () {
                return const SliverPadding(
                  padding: EdgeInsets.all(24.0),
                  sliver: SliverToBoxAdapter(
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  ),
                );
              },
            ),
            OnGoingBottom(
              asyncValue: asyncValue,
            ),
          ],
        ),
      ),
      onNotification: (notification) {
        // 一番下までスクロールしたとき
        if (notification.metrics.extentAfter == 0) {
          // 追加でローディング
          ref.read(articleListViewModelProvider.notifier).loadMore();

          return true;
        }

        return false;
      },
    );
  }
}
