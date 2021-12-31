import 'package:cuckoo/models/clock.dart';

class ClocksService {
   Future<List<ClockModel>> fetch() async {
      return [
         ClockModel('Moscow'),
         ClockModel('London'),
      ];
   }
}
