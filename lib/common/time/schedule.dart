import 'package:northwind/common/time/periodic_schedule.dart';

/// Абстрактное расписание
abstract class Schedule {
  /// Создаёт периодическое расписание
  factory Schedule.periodic(Duration period, [Duration offset]) {
    return PeriodicSchedule(period, offset);
  }

  /// Возвращает период через который нужно будет запустить
  Duration nextStart();
}
