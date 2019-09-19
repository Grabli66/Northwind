import 'package:northwind/collector/collector_device.dart';
import 'package:northwind/common/measure/measure_parameter.dart';
import 'package:northwind/common/time/schedule.dart';

/// Сценарий собирающий данные с устройства
class CollectorScriptInfo {
  /// Максимальное время работы сценария по молчанию
  static const DefaultWorkTime = Duration(seconds: 10);

  /// Устройства по которым сценарий будет собирать данные
  final List<CollectorDevice> devices;

  /// Параметры измерения
  final List<MeasureParameter> measures;

  /// Название сценария
  final String name;

  /// Расписание запуска
  final Schedule schedule;

  /// Максимальное время
  final Duration workTime;

  /// Конструктор
  CollectorScriptInfo(this.name, this.schedule, this.devices, this.measures,
      {this.workTime = DefaultWorkTime});
}
