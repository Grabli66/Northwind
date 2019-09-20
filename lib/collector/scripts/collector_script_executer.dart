import 'dart:async';

import 'package:northwind/collector/events/collector_script_event.dart';
import 'package:northwind/collector/scripts/collector_script_info.dart';

/// Исполняет сценарий
class CollectorScriptExecuter {
  /// Сценарий сбора
  final CollectorScriptInfo scriptInfo;

  /// Генерирует события
  final StreamController<CollectorScriptEvent> _eventController = StreamController<CollectorScriptEvent>();

  /// Поток событий сценария сбора
  Stream<CollectorScriptEvent> get onEvent => _eventController.stream;

  /// Конструктор
  CollectorScriptExecuter(this.scriptInfo);

    /// Запускает сценарий
  void start() {
    for (final _ in scriptInfo.devices) {
      // Группирует по прикладным драйверам
      // Строит задания
      // Вызывает каждый прикладной драйвер со списком заданий
    }
  }
}