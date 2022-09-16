import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.freezed.dart';
part 'tag.g.dart';

@freezed
abstract class Tag with _$Tag {
  factory Tag({
    required String name,
    List<String>? version,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}
