import 'package:mongo_dart/mongo_dart.dart';
import 'package:northwind/database/devices/db_device_collection.dart';
import 'package:northwind/database/routes/db_route_collection.dart';

/// Для доступа к базе данных
class Database {
  /// Экземпляр
  static final Database _instance = Database._();

  /// Подключение к базе
  Db _connection;

  /// Коллекция с устройствами
  DbDeviceCollection deviceCollection;

  /// Коллекция с маршрутами
  DbRouteCollection routeCollection;

  /// Приватный конструктор
  Database._();

  factory Database() {
    return _instance;
  }

  /// Открывает базу
  void open() async {
    _connection = Db("mongodb://localhost:27017/northwind");
    await _connection.open();
    deviceCollection = DbDeviceCollection(_connection);
    routeCollection = DbRouteCollection(_connection);
  }

  /// Закрывает соединение
  void close() async {
    await _connection.close();
  }
}
