//import 'package:northwind/collector/collector.dart';
import 'package:northwind/console/console_server.dart';
import 'package:northwind/database/database.dart';

void main(List<String> args) async {
  /// Открывает базу данных
  final database = Database();
  await database.open();

  /// Запускает консоль
  ConsoleServer().start();

  /// Запускает сервис сбора
  // final collector = Collector();
  // await collector.start();
}