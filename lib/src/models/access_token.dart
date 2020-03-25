import 'package:json_annotation/json_annotation.dart';

part 'access_token.g.dart';

@JsonSerializable()
class AccessToken {
  final String id;
  final String name;
  final String token;
  final String kind;

  AccessToken({
    this.id,
    this.name,
    this.token,
    this.kind,
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenFromJson(json);
  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);
}
