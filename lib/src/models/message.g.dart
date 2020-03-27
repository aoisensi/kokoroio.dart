// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    id: json['id'] as int,
    idempotentKey: json['idempotent_key'] as String,
    displayName: json['display_name'] as String,
    avatar: json['avatar'] as String,
    expandEmbedContents: json['expand_embed_contents'] as bool,
    avatars: (json['avatars'] as List)
        ?.map((e) =>
            e == null ? null : Avatar.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['status'] as String,
    content: json['content'] as String,
    htmlContent: json['html_content'] as String,
    plaintextContent: json['plaintext_content'] as String,
    rawContent: json['raw_content'] as String,
    publishedAt: json['published_at'] == null
        ? null
        : DateTime.parse(json['published_at'] as String),
    nsfw: json['nsfw'] as bool,
    channel: json['channel'] == null
        ? null
        : Channel.fromJson(json['channel'] as Map<String, dynamic>),
    profile: json['profile'] == null
        ? null
        : Profile.fromJson(json['profile'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'idempotent_key': instance.idempotentKey,
      'display_name': instance.displayName,
      'avatar': instance.avatar,
      'expand_embed_contents': instance.expandEmbedContents,
      'avatars': instance.avatars,
      'status': instance.status,
      'content': instance.content,
      'html_content': instance.htmlContent,
      'plaintext_content': instance.plaintextContent,
      'raw_content': instance.rawContent,
      'published_at': instance.publishedAt?.toIso8601String(),
      'nsfw': instance.nsfw,
      'channel': instance.channel,
      'profile': instance.profile,
    };
