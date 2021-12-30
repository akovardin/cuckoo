import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;

class Database {
  static sql.Database? _db;

  static Future<sql.Database> get() async {
    _db ??= await _init();

    return _db!;
  }

  static Future<sql.Database> _init() async {
    // await sql.deleteDatabase(join(await sql.getDatabasesPath(), 'cuckoo.db'));
    print(join(await sql.getDatabasesPath(), 'cuckoo.db'));
    return sql.openDatabase(
      join(await sql.getDatabasesPath(), 'cuckoo.db'),
      version: 1,
      onOpen: (db) async {
        db.execute("""
          create table if not exists alarms (
            id integer primary key,
            time string,
            audio text,
            title text,
            status boolean,
            monday boolean,
            tuesday boolean,
            wednesday boolean,
            thursday boolean,
            friday boolean,
            saturday boolean,
            sunday boolean
          );
          """);
      },
      onUpgrade: (db, int oldVersion, int newVersion) async {},
    );
  }
}
