import 'package:json_annotation/json_annotation.dart';
import 'package:kokoroio/kokoroio.dart';
import 'package:kokoroio/src/models/avatar.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  final int id;
  @JsonKey(name: 'idempotent_key')
  final String idempotentKey;
  @JsonKey(name: 'display_name')
  final String displayName;
  final String avatar;
  @JsonKey(name: 'expand_embed_contents')
  final bool expandEmbedContents;
  final List<Avatar> avatars;
  final String status;
  final String content;
  @JsonKey(name: 'html_content')
  final String htmlContent;
  @JsonKey(name: 'plaintext_content')
  final String plaintextContent;
  @JsonKey(name: 'raw_content')
  final String rawContent;
  // TODO embedded_urls
  // TODO embed_contents
  @JsonKey(name: 'published_at')
  final DateTime publishedAt;
  final bool nsfw;
  final Channel channel;
  final Profile profile;

  Message({
    this.id,
    this.idempotentKey,
    this.displayName,
    this.avatar,
    this.expandEmbedContents,
    this.avatars,
    this.status,
    this.content,
    this.htmlContent,
    this.plaintextContent,
    this.rawContent,
    this.publishedAt,
    this.nsfw,
    this.channel,
    this.profile,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
