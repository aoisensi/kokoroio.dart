import 'package:json_annotation/json_annotation.dart';

part 'avatar.g.dart';

@JsonSerializable()
class Avatar {
  final int size;
  final String url;
  @JsonKey(name: 'is_default')
  final bool isDefault;

  Avatar({
    this.size,
    this.url,
    this.isDefault,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
  Map<String, dynamic> toJson() => _$AvatarToJson(this);
}
