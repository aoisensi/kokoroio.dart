// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Membership _$MembershipFromJson(Map<String, dynamic> json) {
  return Membership(
    id: json['id'] as String,
    channel: json['channel'] == null
        ? null
        : Channel.fromJson(json['channel'] as Map<String, dynamic>),
    authority: json['authority'] as String,
    disableNotification: json['disable_notification'] as bool,
    notificationPolicy: json['notification_policy'] as String,
    readStateTrackingPolicy: json['read_state_tracking_policy'] as String,
    latestReadMessageId: json['latest_read_message_id'] as int,
    unreadCount: json['unread_count'] as int,
    visible: json['visible'] as bool,
    muted: json['muted'] as bool,
    profile: json['profile'] == null
        ? null
        : Profile.fromJson(json['profile'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MembershipToJson(Membership instance) =>
    <String, dynamic>{
      'id': instance.id,
      'channel': instance.channel,
      'authority': instance.authority,
      'disable_notification': instance.disableNotification,
      'notification_policy': instance.notificationPolicy,
      'read_state_tracking_policy': instance.readStateTrackingPolicy,
      'latest_read_message_id': instance.latestReadMessageId,
      'unread_count': instance.unreadCount,
      'visible': instance.visible,
      'muted': instance.muted,
      'profile': instance.profile,
    };
