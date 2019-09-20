import 'package:uuid/uuid.dart';

/// Сущность базы данных
abstract class DbEntity {
  /// Для генерации идентификаторов
  static final uuid = Uuid();

  /// Идентификатор
  final String id;

  /// Создаёт новую сущность
  DbEntity(): id = uuid.v1();

  /// Конструктор
  DbEntity.withId(this.id);

  /// Создаёт из документа
  DbEntity.fromDocument(Map<String, dynamic> document)
      : id = document["_id"].toString();

  /// Преобразует в документ
  Map<String, dynamic> toDocument() {
    final res = Map<String, dynamic>();
    res["_id"] = id;
    return res;
  }

  /// Возвращает описание в виде строки
  @override
  String toString() {
    return "id: $id";
  }
}
