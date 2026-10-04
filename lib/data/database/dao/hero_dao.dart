import 'package:sqflite/sqflite.dart';
import '../app_database.dart';
import '../entity/hero_entity.dart';

class HeroDao {
  final AppDatabase _appDatabase;

  HeroDao(this._appDatabase);

  Future<Database> get _db async => _appDatabase.database;

  Future<void> insertHero(HeroEntity hero) async {
    final db = await _db;
    await db.insert(
      HeroEntity.tableName,
      hero.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertHeroes(List<HeroEntity> heroes) async {
    final db = await _db;
    final batch = db.batch();
    for (final hero in heroes) {
      batch.insert(
        HeroEntity.tableName,
        hero.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<List<HeroEntity>> getHeroes({
    required int page,
    required int limit,
  }) async {
    final db = await _db;
    final offset = (page - 1) * limit;
    final maps = await db.query(
      HeroEntity.tableName,
      orderBy: 'id ASC',
      limit: limit,
      offset: offset,
    );
    return maps.map(HeroEntity.fromMap).toList();
  }

  Future<HeroEntity?> getHeroById(int id) async {
    final db = await _db;
    final maps = await db.query(
      HeroEntity.tableName,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isEmpty) return null;
    return HeroEntity.fromMap(maps.first);
  }

  Future<List<HeroEntity>> getAllHeroes() async {
    final db = await _db;
    final maps = await db.query(
      HeroEntity.tableName,
      orderBy: 'id ASC',
    );
    return maps.map(HeroEntity.fromMap).toList();
  }

  Future<int> getTotalCount() async {
    final db = await _db;
    final result = await db.rawQuery(
        'SELECT COUNT(*) as count FROM ${HeroEntity.tableName}');
    return result.first['count'] as int;
  }

  Future<void> updateHero(HeroEntity hero) async {
    final db = await _db;
    await db.update(
      HeroEntity.tableName,
      hero.toMap(),
      where: 'id = ?',
      whereArgs: [hero.id],
    );
  }
}
