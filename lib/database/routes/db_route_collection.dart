import 'package:mongo_dart/mongo_dart.dart';
import 'package:northwind/database/db_collection.dart';
import 'package:northwind/database/routes/db_route.dart';

/// Управляет маршрутами
class DbRouteCollection extends DatabaseCollection {
  /// Конструктор
  DbRouteCollection(Db connection) : super(connection);

  /// Сохраняет маршрут
  void saveRoute(DbRoute route) async {
    final collection = connection.collection("routes");
    await collection.save(route.toDocument());
  }

  /// Возвращает все маршруты
  Stream<DbRoute> getAllRoutes() {
    final collection = connection.collection("routes");
    return collection.find().map((x) => DbRoute.fromDocumentByType(x));
  }
}
