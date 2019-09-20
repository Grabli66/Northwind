import 'package:mongo_dart/mongo_dart.dart';
import 'package:northwind/database/db_collection.dart';

/// Управляет считанными данными с устройства
class DbMeasureCollection extends DatabaseCollection {
  /// Конструктор
  DbMeasureCollection(Db connection) : super(connection);  
}