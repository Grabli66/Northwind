import 'package:mongo_dart/mongo_dart.dart';
import 'package:northwind/database/db_collection.dart';
import 'package:northwind/database/devices/db_device.dart';

/// Управляет коллекцией с устройствами
class DbDeviceCollection extends DatabaseCollection {
  /// Конструктор
  DbDeviceCollection(Db connection) : super(connection);
  
  /// Сохраняет устройство
  void saveDevice(DbDevice device) async {
    final collection = connection.collection("devices");
    await collection.save(device.toDocument());
  }

  /// Возвращает устройство по идентификатору
  Future<DbDevice> getDeviceById(String id) async {
    final collection = connection.collection("devices");
    final document = await collection.findOne({"_id": id});
    return DbDevice.fromDocument(document);
  }

  /// Удаляет устройство по идентификатору
  void deleteDeviceById(String id) async {
    final collection = connection.collection("devices");
    await collection.remove({"_id": id});
  }

  /// Возвращает все устройства
  Stream<DbDevice> getAllDevices() {
    final collection = connection.collection("devices");
    return collection.find().map((x) => DbDevice.fromDocument(x));
  }
}
