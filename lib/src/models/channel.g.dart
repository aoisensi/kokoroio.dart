// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return Channel(
    id: json['id'] as String,
    channelName: json['channel_name'] as String,
    kind: json['kind'] as String,
    archived: json['archived'] as bool,
    description: json['description'] as String,
    latestMessageId: json['latest_message_id'] as int,
    latestMessagePublishedAt: json['latest_message_published_at'] == null
        ? null
        : DateTime.parse(json['latest_message_published_at'] as String),
    messagesCount: json['messages_count'] as int,
  );
}

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      'id': instance.id,
      'channel_name': instance.channelName,
      'kind': instance.kind,
      'archived': instance.archived,
      'description': instance.description,
      'latest_message_id': instance.latestMessageId,
      'latest_message_published_at':
          instance.latestMessagePublishedAt?.toIso8601String(),
      'messages_count': instance.messagesCount,
    };
