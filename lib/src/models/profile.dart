import 'package:json_annotation/json_annotation.dart';
import 'package:kokoroio/src/models/avatar.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  final String id;
  final String type;
  @JsonKey(name: 'screen_name')
  final String screenName;
  @JsonKey(name: 'display_name')
  final String displayName;
  final String avatar;
  final List<Avatar> avatars;
  final bool archived;
  @JsonKey(name: 'invited_channels_count')
  final int invitedChannelsCount;

  Profile({
    this.id,
    this.type,
    this.screenName,
    this.displayName,
    this.avatar,
    this.avatars,
    this.archived,
    this.invitedChannelsCount,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
