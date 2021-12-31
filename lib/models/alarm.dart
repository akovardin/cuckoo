import 'package:path/path.dart';
import 'package:intl/intl.dart';

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

    var date = DateTime.now();

    if (!_checkDay(date)) {
      return false;
    }

    if (!_checkTime(date)) {
      return false;
    }

    return true;
  }

  bool _checkDay(DateTime date) {
    var day = DateFormat('EEEE').format(date).toLowerCase();

    List<String> days = [];

    if (monday) {
      days.add('monday');
    }
    if (tuesday) {
      days.add('tuesday');
    }
    if (wednesday) {
      days.add('wednesday');
    }
    if (thursday) {
      days.add('thursday');
    }
    if (friday) {
      days.add('friday');
    }
    if (saturday) {
      days.add('saturday');
    }
    if (sunday) {
      days.add('sunday');
    }

    if (days.contains(day)) {
      return true;
    }

    return false;
  }

  bool _checkTime(DateTime date) {
    var current = DateFormat('HH:mm').format(date);
    return current == time;
  }
}
