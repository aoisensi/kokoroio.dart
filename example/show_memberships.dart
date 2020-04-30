import 'dart:io';

import 'package:kokoroio/kokoroio.dart';

void main() {
  var token = Platform.environment['KOKORO_IO_ACCESS_TOKEN'];
  if (token == null) {
    throw Exception('KOKORO_IO_ACCESS_TOKEN is empty!!');
  }
  var client = KokoroIO(accessToken: token);

  client.getMemberships().then((ms) {
    for (var m in ms) {
      print(m.channel.channelName);
    }
  });
}
