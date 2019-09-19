/// Сущность базы данных
abstract class DbEntity {
  /// Идентификатор
  final String id;

  /// Конструктор
  DbEntity(this.id);

  /// Преобразует в документ
  Map<String, dynamic> toDocument();
}
