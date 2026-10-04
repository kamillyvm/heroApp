import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'entity/hero_entity.dart';
import 'entity/squad_entity.dart';

class AppDatabase {
  static AppDatabase? _instance;
  static Database? _database;

  AppDatabase._internal();

  factory AppDatabase() {
    _instance ??= AppDatabase._internal();
    return _instance!;
  }

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'hero_squad.db');

    return openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute(HeroEntity.createTableSql);
        await db.execute(SquadEntity.createTableSql);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute(
            "ALTER TABLE heroes ADD COLUMN occupation TEXT DEFAULT ''",
          );
          await db.execute(
            "ALTER TABLE heroes ADD COLUMN base TEXT DEFAULT ''",
          );
          await db.execute(
            "ALTER TABLE heroes ADD COLUMN groupAffiliation TEXT DEFAULT ''",
          );
          await db.execute(
            "ALTER TABLE heroes ADD COLUMN relatives TEXT DEFAULT ''",
          );
        }
      },
    );
  }
}
