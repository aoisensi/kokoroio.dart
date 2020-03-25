import 'package:json_annotation/json_annotation.dart';

part 'channel.g.dart';

@JsonSerializable()
class Channel {
  final String id;
  @JsonKey(name: 'channelName')
  final String channelName;
  final String kind;
  final bool archived;
  final String description;
  @JsonKey(name: 'latest_message_id', nullable: true)
  final int latestMessageId;
  @JsonKey(name: 'latest_message_published_at', nullable: true)
  final DateTime latestMessagePublishedAt;
  @JsonKey(name: 'messages_count')
  final int messagesCount;

  Channel({
    this.id,
    this.channelName,
    this.kind,
    this.archived,
    this.description,
    this.latestMessageId,
    this.latestMessagePublishedAt,
    this.messagesCount,
  });

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);
  Map<String, dynamic> toJson() => _$ChannelToJson(this);
}
