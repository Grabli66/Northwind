import 'dart:async';
import 'dart:collection';

import 'package:northwind/collector/collector_device.dart';
import 'package:northwind/collector/events/collector_script_event.dart';
import 'package:northwind/collector/scripts/collector_script_executer.dart';
import 'package:northwind/collector/scripts/collector_script_info.dart';
import 'package:northwind/common/measure/measure_parameter.dart';
import 'package:northwind/common/time/periodic_schedule.dart';

/// Основной класс который запускает всё остальное
class Collector {
  /// Сценарии сбора
  final HashSet<CollectorScriptInfo> _scripts = HashSet<CollectorScriptInfo>();

  /// Загружает сценарии сбора
  void _loadScripts() {
    final schedule = PeriodicSchedule(Duration(seconds: 10));
    final devices = <CollectorDevice>[];
    final measures = <MeasureParameter>[];

    _scripts.add(
        CollectorScriptInfo("Collect from EK270", schedule, devices, measures));
  }

  /// Обрабатывает события сценария сбора
  void _processScriptEvent(
      CollectorScriptExecuter executer, CollectorScriptEvent event) {}

  /// Запускает сбор по сценарию
  void _startCollectFromScript(CollectorScriptInfo script) {
    // Запускает отложенное выполнение с указанием запуска следующего расписания сценария
    Future.delayed(script.schedule.nextStart(), () {
      // 1. Создаёт исполнителя который будет собирать
      // 2. Запускает
      // 3. Начинает слушать события
      // 4. Засекает таймаут выполнения. В случае срабатывания останавливает сценарий. Дожидается остановки
      // 5. В случае события завершения или остановки заного создаёт отложенное выполнение этих пунктов

      final scriptExecuter = CollectorScriptExecuter(script);
      scriptExecuter.onEvent
          .listen((e) => _processScriptEvent(scriptExecuter, e));
      scriptExecuter.start();

      // Timer(Duration(seconds: 10), () => {
      //   scriptExecuter.stop();
      // });
    });
  }

  /// Запускает сбор
  void _startCollect() {
    for (var script in _scripts) {
      _startCollectFromScript(script);
    }
  }

  /// Запускает
  void start() async {
    // 1. Загружает сценарии сбора
    // 2. Запускает выполнение сценариев
    // 3. Ждёт событий от сценариев

    await _loadScripts();
    _startCollect();
  }
}
