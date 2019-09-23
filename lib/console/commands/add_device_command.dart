import 'package:northwind/console/commands/console_command.dart';

/// Команда добавления устройства
class AddDeviceCommand extends ConsoleCommand {
  /// Серийный номер
  final String serial;

  /// Конструктор
  AddDeviceCommand(this.serial);

  /// Возвращает строку помощи для команды
  @override
  String getHelpString() {
    return "";
  }
}
