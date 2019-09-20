import 'package:northwind/database/routes/db_route.dart';

/// Описание TPC/IP клиентского маршрута
class DbTcpClientRoute extends DbRoute {
  /// Идентификатор типа сущности
  static const TypeID = "TcpClient";

  /// Хост подключения
  final String host;

  /// Порт подключения
  final int port;

  /// Новый экземпляр
  DbTcpClientRoute(this.host, this.port) : super(TypeID);

  /// Экземпляр с известным идентификатором
  DbTcpClientRoute.withId(String id, this.host, this.port)
      : super.withId(id, TypeID);

  /// Создаёт из документа
  DbTcpClientRoute.fromDocument(Map<String, dynamic> document)
      : host = document["host"].toString(),
        port = document["port"] as int,
        super.fromDocument(document);

  /// Преобразует в документ
  @override
  Map<String, dynamic> toDocument() {
    final res = super.toDocument();
    res["host"] = host;
    res["port"] = port;
    return res;
  }

  /// Возвращает описание в виде строки
  @override
  String toString() {    
    return "${super.toString()}, host: $host, port: $port";
  }
}
