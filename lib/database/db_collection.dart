import 'package:meta/meta.dart';
import 'package:mongo_dart/mongo_dart.dart';

/// Базовая коллекция управляющая сущностями
abstract class DatabaseCollection {
  /// Подключение к базе
  @protected
  Db connection;

  /// Конструктор
  DatabaseCollection(this.connection);
}