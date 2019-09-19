import 'package:mongo_dart/mongo_dart.dart';
import 'package:northwind/database/db_device.dart';

/// Для доступа к базе данных
class Database {
  /// Экземпляр
  static final Database _instance = Database._();

  /// Подключение к базе
  Db _connection;

  /// Приватный конструктор
  Database._();

  factory Database() {
    return _instance;
  }

  /// Открывает базу
  void open() {
      _connection = Db("mongodb://localhost:27017/northwind");
  }

  /// Сохраняет устройство
  void saveDevice(DbDevice device) {
    final collection = _connection.collection("devices");
    collection.save(device.toDocument());
  }

  /// Возвращает все устройства
  List<DbDevice> getAllDevices() {
    return null;
  }
}