import 'package:northwind/collector/collector.dart';

void main(List<String> args) async {
  final collector = Collector();
  await collector.start();
}