import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnGoingBottom extends StatelessWidget {
  const OnGoingBottom({
    super.key,
    required this.asyncValue,
  });

  final AsyncValue<dynamic> asyncValue;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(40.0),
      sliver: SliverToBoxAdapter(
        child: asyncValue.maybeWhen(
          orElse: () {
            // 無限スクロール ローディング中
            if (asyncValue.isRefreshing) {
              return const CupertinoActivityIndicator();
            }

            return const SizedBox.shrink();
          },
          error: (error, stackTrace) {
            // 取得済みのデータがあるなら最下部にエラー表示
            if (asyncValue.hasValue) {
              return const Center(
                child: Text(
                  'エラーが発生しました',
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
