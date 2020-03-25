import 'package:json_annotation/json_annotation.dart';

import 'package:kokoroio/src/models/channel.dart';
import 'package:kokoroio/src/models/profile.dart';

part 'membership.g.dart';

@JsonSerializable()
class Membership {
  final String id;
  final Channel channel;
  final String authority;
  @JsonKey(name: 'disable_notification')
  final bool disableNotification;
  @JsonKey(name: 'notification_policy')
  final String notificationPolicy;
  @JsonKey(name: 'read_state_tracking_policy')
  final String readStateTrackingPolicy;
  @JsonKey(name: 'latest_read_message_id')
  final int latestReadMessageId;
  @JsonKey(name: 'unread_count')
  final int unreadCount;
  final bool visible;
  final bool muted;
  final Profile profile;

  Membership({
    this.id,
    this.channel,
    this.authority,
    this.disableNotification,
    this.notificationPolicy,
    this.readStateTrackingPolicy,
    this.latestReadMessageId,
    this.unreadCount,
    this.visible,
    this.muted,
    this.profile,
  });

  factory Membership.fromJson(Map<String, dynamic> json) =>
      _$MembershipFromJson(json);
  Map<String, dynamic> toJson() => _$MembershipToJson(this);
}
