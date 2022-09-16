import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_sample_app/apis/article_api_client.dart';
import 'package:flutter_sample_app/models/qiita_article.dart';

class ArticleRepository {
  final _articleApiClient = ArticleApiClient(Dio());

  // アクセストークンを.envファイルから読み込み
  final String authorization = ' Bearer ${dotenv.env['QIITA_ACCESS_TOKEN']}';

  Future<dynamic> fetch(int? page, int? perPage) async {
    return _articleApiClient.fetch(authorization, page, perPage).then((value) {

      // APIで返ってきたJSONをQiitaArticleモデルに変換
      return value
          .map((e) => QiitaArticle.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }
}
