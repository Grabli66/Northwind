//import 'package:northwind/collector/collector.dart';
import 'package:northwind/database/database.dart';

void main(List<String> args) async {
  final database = Database();
  await database.open();
  //await database.saveDevice(DbDevice("EK270", null, "2321455", networkNumber: "1", password: "1234"));
  //await database.deleteDeviceById("0c220bd0-dba7-11e9-cf21-bf914638bb31");

//  await database.saveRoute(DbTcpClientRoute("localhost", 9111));

  await for (final route in database.routeCollection.getAllRoutes()) {
    print(route);
  }

  await database.close();

  // final collector = Collector();
  // await collector.start();
}