import 'package:console/console.dart';

/// Клиент для консоли Northwind
class ConsoleClient {
  /// Версия консоли
  static const ConsoleVersion = "1.0.1";

  /// Обрабатывает комманду
  // void _processCommand(String line) {

  // }

  /// Парсит комманду
  // void _parseCommand(String line) {

  // }

  /// Запускает
  void start() {
    print("Northwind console $ConsoleVersion");
    print('Type "help" to get command descriptions');
    print('Type "exit" to close console');

    var shell = ShellPrompt();
    shell.loop().listen((line) {
      if (["stop", "quit", "exit"].contains(line.toLowerCase().trim())) {
        shell.stop();
        return;
      }
      print(line);
    });
  }
}
