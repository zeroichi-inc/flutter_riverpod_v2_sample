import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'article_api_client.g.dart';

@RestApi(baseUrl: 'https://qiita.com/api/v2')
abstract class ArticleApiClient {
  factory ArticleApiClient(Dio dio, {String baseUrl}) = _ArticleApiClient;

  @GET('/items')
  Future<dynamic> fetch(
    @Header('Authorization') String authorization,
    @Query('page') int? page,
    @Query('per_page') int? perPage,
  );
}
