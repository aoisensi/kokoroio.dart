// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Avatar _$AvatarFromJson(Map<String, dynamic> json) {
  return Avatar(
    size: json['size'] as int,
    url: json['url'] as String,
    isDefault: json['is_default'] as bool,
  );
}

Map<String, dynamic> _$AvatarToJson(Avatar instance) => <String, dynamic>{
      'size': instance.size,
      'url': instance.url,
      'is_default': instance.isDefault,
    };
