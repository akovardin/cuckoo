import 'dart:async';

import 'package:cuckoo/database/database.dart';
import 'package:cuckoo/models/alarm.dart';
import 'package:sqflite/sqflite.dart' as sql;

const AlarmTable = 'alarms';

class AlarmService {

  Future<List<AlarmModel>> fetch() async {
    var db = await Database.get();
    final List<Map<String, dynamic>> recs =
    await db.query(AlarmTable, orderBy: 'id DESC');

    return List.generate(recs.length, (index) {
      return AlarmModel.fromMap(recs[index]);
    });
  }

  Future<AlarmModel> create(AlarmModel alarm) async {
    var db = await Database.get();
    var val = await db.rawQuery('select max(id) +1 as id from $AlarmTable');
    int? id = val.first['id'] as int?;
    id ??= 0;

    alarm.id = id;

    await db.insert(AlarmTable, alarm.toMap(), conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return alarm;
  }

  Future<void> update(AlarmModel alarm) async {
    var db = await Database.get();
    await db.update(
      AlarmTable,
      alarm.toMap(),
      where: 'id = ?',
      whereArgs: [alarm.id],
    );
  }

  Future<int> count() async {
    var db = await Database.get();

    var val = await db.rawQuery('select count(*) as cnt from $AlarmTable');
    int? cnt = val.first['cnt'] as int?;
    cnt ??= 0;

    return cnt;
  }

  Future<void> remove(int id) async {
    var db = await Database.get();

    db.delete(
      AlarmTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
