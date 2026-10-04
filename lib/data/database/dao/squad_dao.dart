import 'package:sqflite/sqflite.dart';

import '../app_database.dart';
import '../entity/squad_entity.dart';

class SquadDao {
  final AppDatabase _appDatabase;

  SquadDao(this._appDatabase);

  Future<Database> get _db async => _appDatabase.database;

  static const int maxSquadSize = 15;

  Future<void> addToSquad(SquadEntity member) async {
    final db = await _db;

    final alreadyInSquad = await isInSquad(member.heroId);

    if (alreadyInSquad) {
      return;
    }

    final count = await getSquadCount();

    if (count >= maxSquadSize) {
      throw Exception('O esquadrão já possui o limite de 15 agentes.');
    }

    await db.insert(
      SquadEntity.tableName,
      member.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> removeFromSquad(int heroId) async {
    final db = await _db;

    await db.delete(
      SquadEntity.tableName,
      where: 'heroId = ?',
      whereArgs: [heroId],
    );
  }

  Future<List<SquadEntity>> getSquad() async {
    final db = await _db;

    final maps = await db.query(
      SquadEntity.tableName,
      orderBy: 'recruitedAt ASC',
    );

    return maps.map(SquadEntity.fromMap).toList();
  }

  Future<bool> isInSquad(int heroId) async {
    final db = await _db;

    final maps = await db.query(
      SquadEntity.tableName,
      where: 'heroId = ?',
      whereArgs: [heroId],
      limit: 1,
    );

    return maps.isNotEmpty;
  }

  Future<int> getSquadCount() async {
    final db = await _db;

    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM ${SquadEntity.tableName}',
    );

    return result.first['count'] as int;
  }

  Future<bool> isSquadFull() async {
    final count = await getSquadCount();
    return count >= maxSquadSize;
  }

  Future<void> updateHeroPowerstat({
    required int heroId,
    required String powerstat,
    required int newValue,
  }) async {
    final db = await _db;

    await db.update(
      SquadEntity.tableName,
      {powerstat: newValue},
      where: 'heroId = ?',
      whereArgs: [heroId],
    );
  }
}