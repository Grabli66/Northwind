import 'dart:io';

import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Консоль для обработки комманд
class ConsoleServer {
  /// Порт поумолчанию
  static const DefaultPort = 26401;

  /// Порт на котором нужно открыть консоль
  final int port;

  /// Конструктор
  ConsoleServer({this.port = DefaultPort});

  /// Запускает консоль
  void start() {
    var handler = webSocketHandler((WebSocketChannel webSocket) {
      webSocket.stream.listen((Object message) {
        webSocket.sink.add("echo $message");
      });
    });

    shelf_io.serve(handler, InternetAddress.anyIPv4, port).then((server) {
      print('Serving at ws://${server.address.host}:${server.port}');
    });
  }
}
