// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ArticleApiClient implements ArticleApiClient {
  _ArticleApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://qiita.com/api/v2';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<dynamic> fetch(authorization, page, perPage) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'per_page': perPage
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'Authorization': authorization};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/items',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
