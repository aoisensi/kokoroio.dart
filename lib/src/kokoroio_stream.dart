import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:kokoroio/kokoroio.dart';

class KokoroIOStream {
  static final _identifer = '{"channel": "ChatChannel"}';
  final WebSocket _ws;
  final Stream _stream;

  final onMessageCreated = StreamController<Message>();

  KokoroIOStream._(this._ws, void Function(KokoroIOStream) onWelcome)
      : _stream = _ws.asBroadcastStream() {
    _stream.listen((body) {
      var event = json.decode(body as String) as Map<String, dynamic>;
      var eventType = event['type'] as String;
      if (eventType != null) {
        switch (eventType) {
          case 'welcome':
            onWelcome(this);
            return;
          case 'ping':
            return;
        }
        return;
      }
      var message = event['message'] as Map<String, dynamic>;
      switch (message['event'] as String) {
        case 'message_created':
          onMessageCreated.sink
              .add(Message.fromJson(message['data'] as Map<String, dynamic>));
          return;
      }
    });
  }

  static Future<KokoroIOStream> connect(
      String accessToken, void Function(KokoroIOStream) onWelcome,
      {String url = 'wss://kokoro.io/cable'}) async {
    return KokoroIOStream._(
        await WebSocket.connect(url, headers: {'X-Access-Token': accessToken}),
        onWelcome);
  }

  Future<void> subscribe() async {
    var data = json.encode({
      'command': 'subscribe',
      'identifier': _identifer,
    });
    _ws.add(data);
    await for (var body in _stream) {
      var reply = json.decode(body as String) as Map<String, dynamic>;
      if (reply['type'] == 'confirm_subscription') {
        return;
      }
    }
  }

  Future<Channel> message(String channel) async {
    var data = json.encode({
      'command': 'message',
      'identifier': _identifer,
      'data': json.encode({
        'channels': [channel],
        'action': 'subscribe',
      }),
    });
    _ws.add(data);
    await for (var body in _stream) {
      try {
        var message = (json.decode(body as String)
            as Map<String, dynamic>)['message'] as Map<String, dynamic>;
        if (message['event'] == 'subscribed') {
          return Channel.fromJson(message['data'] as Map<String, dynamic>);
        }
      } catch (e) {
        //do nothing
      }
    }
    return Future.error(Error());
  }

  void close() {
    _ws?.close();
  }
}
