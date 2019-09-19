import 'package:northwind/common/time/discret_type.dart';

/// Дискретность
class Discret {
  /// Тип дискретности
  final DiscretType type;

  /// Значение дискретности
  final int value;

  /// Конструктор
  const Discret(this.type, this.value);
}