import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;

import 'package:kokoroio/src/models/access_token.dart';
import 'package:kokoroio/src/models/membership.dart';
import 'package:kokoroio/src/models/message.dart';
import 'package:kokoroio/src/models/profile.dart';

class KokoroIO {
  final String _token;
  final String _rootUrl;

  KokoroIO({String accessToken, String rootUrl = 'https://kokoro.io/api'})
      : _token = accessToken,
        _rootUrl = rootUrl;

  /// Returns user's access tokens
  /// https://kokoro.io/apidoc#!/access_tokens/getV1AccessTokens
  Future<List<AccessToken>> getAccessTokens() async {
    var resp = await http.get(_rootUrl + '/v1/access_tokens',
        headers: {'X-Access-Token': _token});
    if (resp.statusCode != 200) {
      return Future.error(utf8.decode(resp.bodyBytes));
    }
    return (json.decode(utf8.decode(resp.bodyBytes)) as List)
        .map((e) => AccessToken.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Creates new access token
  /// https://kokoro.io/apidoc#!/access_tokens/postV1AccessTokens
  Future<AccessToken> postAccessTokens(String name) async {
    var resp = await http.post(_rootUrl + '/v1/access_tokens',
        headers: {'X-Access-Token': _token}, body: {'name': name});
    if (resp.statusCode != 201) {
      return Future.error(utf8.decode(resp.bodyBytes));
    }
    return AccessToken.fromJson(
        json.decode(utf8.decode(resp.bodyBytes)) as Map<String, dynamic>);
  }

  /// Delete a access_token
  /// https://kokoro.io/apidoc#!/access_tokens/deleteV1AccessTokensAccessTokenId
  Future<void> deleteAccessTokens(String accessTokenId) async {
    var id = Uri.encodeFull(accessTokenId);
    var resp = await http.delete(_rootUrl + '/v1/access_tokens/$id',
        headers: {'X-Access-Token': _token});
    if (resp.statusCode != 204) {
      return Future.error(utf8.decode(resp.bodyBytes));
    }
    return;
  }

  /// Returns recent messages in the channel.
  /// https://kokoro.io/apidoc#!/channels/getV1ChannelsChannelIdMessages
  Future<List<Message>> getChannelsMessages(String channelId) async {
    var resp = await http.get(_rootUrl + '/v1/channels/$channelId/messages',
        headers: {'X-Access-Token': _token});
    if (resp.statusCode != 200) {
      return Future.error(utf8.decode(resp.bodyBytes));
    }
    return (json.decode(utf8.decode(resp.bodyBytes)) as List)
        .map((e) => Message.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Returns user's memberships.
  /// https://kokoro.io/apidoc#!/memberships/getV1Memberships
  Future<List<Membership>> getMemberships() async {
    var resp = await http
        .get(_rootUrl + '/v1/memberships', headers: {'X-Access-Token': _token});
    if (resp.statusCode != 200) {
      return Future.error(utf8.decode(resp.bodyBytes));
    }
    return (json.decode(utf8.decode(resp.bodyBytes)) as List)
        .map((e) => Membership.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Returns current logged-in user's profile
  /// https://kokoro.io/apidoc#!/profiles/getV1ProfilesMe
  Future<Profile> getProfilesMe() async {
    var resp = await http
        .get(_rootUrl + '/v1/profiles/me', headers: {'X-Access-Token': _token});
    if (resp.statusCode != 200) {
      return Future.error(utf8.decode(resp.bodyBytes));
    }
    return Profile.fromJson(
        json.decode(utf8.decode(resp.bodyBytes)) as Map<String, dynamic>);
  }

  /// Returns current logged-in user's profile
  /// https://kokoro.io/apidoc#!/profiles/getV1ProfilesMe
  Future<List<Profile>> getProfiles() async {
    var resp = await http
        .get(_rootUrl + '/v1/profiles', headers: {'X-Access-Token': _token});
    if (resp.statusCode != 200) {
      return Future.error(utf8.decode(resp.bodyBytes));
    }
    return (json.decode(utf8.decode(resp.bodyBytes)) as List)
        .map((e) => Profile.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
