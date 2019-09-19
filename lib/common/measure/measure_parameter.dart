import 'package:northwind/common/measure/measure_type.dart';
import 'package:northwind/common/time/discret.dart';

/// Параметр измерения
class MeasureParameter {
  /// Тип измерения
  final MeasureType measureType;

  /// Дискретность параметра
  final Discret discret;

  /// Конструктор
  const MeasureParameter(this.measureType, this.discret);
}