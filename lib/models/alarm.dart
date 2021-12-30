import 'package:path/path.dart';

class AlarmModel {
  int id;
  String time;
  String audio;
  String title;
  bool status;
  bool monday;
  bool tuesday;
  bool wednesday;
  bool thursday;
  bool friday;
  bool saturday;
  bool sunday;

  AlarmModel(
    this.id,
    this.time,
    this.audio,
    this.title,
    this.status,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'time': time,
      'audio': audio,
      'title': title,
      'status': status ? 1 : 0,
      'monday': monday ? 1 : 0,
      'tuesday': tuesday ? 1 : 0,
      'wednesday': wednesday ? 1 : 0,
      'thursday': thursday ? 1 : 0,
      'friday': friday ? 1 : 0,
      'saturday': saturday ? 1 : 0,
      'sunday': sunday ? 1 : 0,
    };
  }

  static AlarmModel fromMap(Map<String, dynamic> rec) {
    return AlarmModel(
      rec['id'],
      rec['time'],
      rec['audio'],
      rec['title'],
      rec['status'] > 0,
      rec['monday'] > 0,
      rec['tuesday'] > 0,
      rec['wednesday'] > 0,
      rec['thursday'] > 0,
      rec['friday'] > 0,
      rec['saturday'] > 0,
      rec['sunday'] > 0,
    );
  }

  String name() {
    return basename(audio);
  }

  String hours() {
    if (!time.contains(':')) {
      return '';
    }

    return time.split(':')[0];
  }

  String minutes() {
    if (!time.contains(':')) {
      return '';
    }

    return time.split(':')[1];
  }

  bool active() {
    if (!status) {
      return false;
    }

    // check time
    // check day

    // return true;
    return false;
  }
}
