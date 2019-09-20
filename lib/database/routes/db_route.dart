import 'package:northwind/database/db_entity.dart';
import 'package:northwind/database/routes/db_tcp_client_route.dart';

/// Маршрут устройства
abstract class DbRoute extends DbEntity {
  /// Тип маршрута
  final String type;

  /// Конструктор
  DbRoute(this.type) : super();

  /// Экземпляр с известным идентификатором
  DbRoute.withId(String id, this.type) : super.withId(id);

  /// Создаёт из документа
  DbRoute.fromDocument(Map<String, dynamic> document)
      : type = document["type"].toString(),
        super.fromDocument(document);

  /// Фабрика, создающая описания маршрутов по их типу
  factory DbRoute.fromDocumentByType(Map<String, dynamic> document) {
    final type = document["type"].toString();
    switch (type) {
      case DbTcpClientRoute.TypeID:
        return DbTcpClientRoute.fromDocument(document);
    }

    return null;
  }

  /// Преобразует в документ
  @override
  Map<String, dynamic> toDocument() {
    final res = super.toDocument();
    res["type"] = type;
    return res;
  }

  /// Возвращает описание в виде строки
  @override
  String toString() {    
    return "${super.toString()}, type: $type";
  }
}
