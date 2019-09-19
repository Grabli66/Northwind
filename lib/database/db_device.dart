import 'package:northwind/database/db_entity.dart';

/// Описание устройства в базе данных
class DbDevice extends DbEntity {
  /// Тип устройства
  final String type;

  /// Конструктор
  DbDevice(this.type);

  /// Создаёт из документа
  factory DbDevice.fromDocument(Map<String, dynamic> document) {
    return DbDevice(document["type"].toString());
  }

  /// Преобразует в документ
  @override
  Map<String, dynamic> toDocument() {
    final res = Map<String, dynamic>();
    res["type"] = type;
    return null;
  }
}
