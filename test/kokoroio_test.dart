import 'dart:io';
import 'dart:math';

import 'package:test/test.dart';

import 'package:kokoroio/kokoroio.dart';

void main() {
  KokoroIO client;
  setUp(() {
    var token = Platform.environment['KOKORO_IO_ACCESS_TOKEN'];
    token = '9e3c1ffee1046c128f4834caaa0b5e0330611fd3ddec5d9d78f026c3d17ab314';
    if(token == null) {
      throw 'KOKORO_IO_ACCESS_TOKEN is empty!!';
    }
    client = KokoroIO(accessToken: token);
  });
  test('access_tokens', () async {
    var name = 'dart_test_${random()}';
    await client.getAccessTokens();
    var post = await client.postAccessTokens(name);
    expect(post.name, name);
    await client.deleteAccessTokens(post.id);
  });

  test('profiles', () async {
    await client.getProfilesMe();
    await client.getProfiles();
  });
}

int random() {
  return Random(DateTime.now().microsecondsSinceEpoch).nextInt(4294967295);
}