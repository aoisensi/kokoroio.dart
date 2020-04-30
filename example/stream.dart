import 'dart:io';

import 'package:kokoroio/src/kokoroio_stream.dart';

void main() async {
  var token = Platform.environment['KOKORO_IO_ACCESS_TOKEN'];
  if (token == null) {
    throw Exception('KOKORO_IO_ACCESS_TOKEN is empty!!');
  }
  var stream = await KokoroIOStream.connect(token, (stream) async {
    await stream.subscribe();
    await stream.message('YM7R6CK7M');
  });
  stream.onMessageCreated.stream.listen((message) {
    print(message.rawContent);
  });
}
