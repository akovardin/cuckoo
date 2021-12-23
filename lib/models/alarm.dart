class AlarmModel {
  int id;
  String time;
  String audio;
  String title;
  bool status;

  AlarmModel(this.id, this.time, this.audio, this.title, this.status);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'time': time,
      'audio': audio,
      'title': title,
      'status': status ? 1 : 0,
    };
  }

  static AlarmModel fromMap(Map<String, dynamic> rec) {
    return AlarmModel(
      rec['id'],
      rec['time'],
      rec['audio'],
      rec['title'],
      rec['status'] > 0,
    );
  }
}
