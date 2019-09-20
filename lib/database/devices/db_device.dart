import 'package:northwind/database/db_entity.dart';

/// Описание устройства в базе данных
class DbDevice extends DbEntity {
  /// Тип устройства
  final String type;

  /// Серийный номер устройства
  final String serial;

  /// Пароль доступа к устройству
  final String password;

  /// Сетевой адрес устройства
  final String networkNumber;

  /// Идентификатор маршрута
  final List<String> routeIds;

  /// Создаёт новую сущность
  DbDevice(this.type, this.routeIds, this.serial,
      {this.password, this.networkNumber})
      : super();

  /// Конструктор
  DbDevice.withId(String id, this.type, this.routeIds, this.serial,
      {this.password, this.networkNumber})
      : super.withId(id);

  /// Создаёт из документа
  DbDevice.fromDocument(Map<String, dynamic> document)
      : type = document["type"].toString(),
        routeIds = [], //document["routeIds"],
        serial = document["serial"].toString(),
        password = document["password"].toString(),
        networkNumber = document["networkNumber"].toString(),
        super.fromDocument(document);

  /// Преобразует в документ
  @override
  Map<String, dynamic> toDocument() {
    final res = super.toDocument();
    res["type"] = type;
    res["routeIds"] = routeIds;
    res["serial"] = serial;
    res["password"] = password;
    res["networkNumber"] = networkNumber;
    return res;
  }

  /// Возвращает описание в виде строки
  @override
  String toString() {    
    return "${super.toString()}, type: $type, routeIds: $routeIds, serial: $serial, password: $password, networtNumber: $networkNumber";
  }
}
