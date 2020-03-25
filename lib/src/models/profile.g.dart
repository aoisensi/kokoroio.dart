// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    id: json['id'] as String,
    type: json['type'] as String,
    screenName: json['screen_name'] as String,
    displayName: json['display_name'] as String,
    avatar: json['avatar'] as String,
    avatars: (json['avatars'] as List)
        ?.map((e) =>
            e == null ? null : Avatar.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    archived: json['archived'] as bool,
    invitedChannelsCount: json['invited_channels_count'] as int,
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'screen_name': instance.screenName,
      'display_name': instance.displayName,
      'avatar': instance.avatar,
      'avatars': instance.avatars,
      'archived': instance.archived,
      'invited_channels_count': instance.invitedChannelsCount,
    };

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
