import 'package:northwind/common/time/schedule.dart';
import 'package:test/test.dart';

void main() {
  group("Northwind tests", () {
    test("PeriodicSchedule", () {
      final schedule = Schedule.periodic(Duration(seconds: 10));
      print(schedule.nextStart());
    });
  });  
}
