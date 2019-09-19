import 'package:northwind/common/time/schedule.dart';

/// Расписание которое выполняется периодически
class PeriodicSchedule implements Schedule {
  /// Начальная дата
  DateTime _offsetDate;

  /// Сдвиг от начала дня 00:00
  Duration _offset;

  /// Период запуска
  final Duration _period;

  /// Конструктор
  PeriodicSchedule(this._period, [this._offset]);

  /// Возвращает период следующего старта
  @override
  Duration nextStart() {
    final now = DateTime.now();
    if (_offsetDate == null) {
      _offsetDate = DateTime(now.year, now.month, now.day);
      if (_offset != null) {
        _offsetDate = _offsetDate.add(_offset);
      }
    }

    final periodSeconds = _period.inSeconds;
    final between = now.difference(_offsetDate);
    final parts = (between.inSeconds / periodSeconds).floor();
    _offsetDate = _offsetDate.add(Duration(seconds: (periodSeconds * parts)));

    final startDate = _offsetDate.add(_period);
    final res = startDate.difference(now);
    return res;
  }
}
