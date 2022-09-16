import 'package:flutter_sample_app/models/qiita_article.dart';
import 'package:flutter_sample_app/repositories/article_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final articleListViewModelProvider =
    StateNotifierProvider<ArticleListViewModel, AsyncValue<List<QiitaArticle>>>(
  (ref) => ArticleListViewModel(
    ArticleRepository(),
  ),
);

class ArticleListViewModel
    extends StateNotifier<AsyncValue<List<QiitaArticle>>> {
  ArticleListViewModel(this._articleRepository)
      // 初期状態をローディング状態にする
      : super(const AsyncLoading<List<QiitaArticle>>()) {
    // Providerが初めて呼び出されたときに実行
    fetch();
  }

  final ArticleRepository _articleRepository;

  int page = 1;

  Future<void> fetch({
    bool isLoadMore = false,
  }) async {
    // state = await AsyncValue.guard(() async {
    //   final data = await _articleRepository.fetch(page, 20);

    //   return [if (isLoadMore) ...state.value ?? [], ...data];
    // });
    try {
      final data = await _articleRepository.fetch(page, 200);

      state = AsyncData([if (isLoadMore) ...state.value ?? [], ...data]);
    } catch (error) {
      state = AsyncError(error);
    }
  }

  void loadMore() {
    // ローディング中にローディングしないようにする
    if (state ==
        const AsyncLoading<List<QiitaArticle>>().copyWithPrevious(state)) {
      return;
    }

    // 取得済みのデータを保持しながら状態をローディング中にする
    state = const AsyncLoading<List<QiitaArticle>>().copyWithPrevious(state);

    page++;

    fetch(isLoadMore: true);
  }

  void refresh() {
    // 取得済みのデータを保持しながら状態をローディング中にする
    state = const AsyncLoading<List<QiitaArticle>>().copyWithPrevious(state);
    page = 1;

    fetch();
  }
}
