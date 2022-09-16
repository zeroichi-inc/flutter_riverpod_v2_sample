// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tag _$$_TagFromJson(Map<String, dynamic> json) => _$_Tag(
      name: json['name'] as String,
      version:
          (json['version'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_TagToJson(_$_Tag instance) => <String, dynamic>{
      'name': instance.name,
      'version': instance.version,
    };
