// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qiita_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QiitaArticle _$$_QiitaArticleFromJson(Map<String, dynamic> json) =>
    _$_QiitaArticle(
      title: json['title'] as String,
      url: json['url'] as String,
      user: QiitaUser.fromJson(json['user'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_QiitaArticleToJson(_$_QiitaArticle instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'user': instance.user,
      'tags': instance.tags,
    };
