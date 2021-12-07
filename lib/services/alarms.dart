import 'package:cuckoo/models/alarm.dart';

class AlarmService {
  List<AlarmModel> alarms = [
    AlarmModel(1, 0, 'Король и Шут - Кукла колдуна.', false),
    AlarmModel(2, 0, 'Король и Шут - Лесник.', false)
  ];

  Future<List<AlarmModel>> fetch() async {
    return alarms;
  }

  void update(AlarmModel alarm) {
    alarms = alarms.map((e) {
      if (e.id == alarm.id) {
        return alarm;
      }

      return e;
    }).toList();
  }

  void add(AlarmModel alarm) {
    alarms.add(alarm);
  }
}
