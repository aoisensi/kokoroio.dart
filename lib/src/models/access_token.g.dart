// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessToken _$AccessTokenFromJson(Map<String, dynamic> json) {
  return AccessToken(
    id: json['id'] as String,
    name: json['name'] as String,
    token: json['token'] as String,
    kind: json['kind'] as String,
  );
}

Map<String, dynamic> _$AccessTokenToJson(AccessToken instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'token': instance.token,
      'kind': instance.kind,
    };
