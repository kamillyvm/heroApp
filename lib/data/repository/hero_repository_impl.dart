import 'dart:math';
import '../../domain/hero.dart';
import '../database/dao/hero_dao.dart';
import '../database/dao/squad_dao.dart';
import '../database/database_mapper.dart';
import '../network/client/api_client.dart';
import '../network/network_mapper.dart';
import 'hero_repository.dart';

class HeroRepositoryImpl implements HeroRepository {
  final ApiClient apiClient;
  final NetworkMapper networkMapper;
  final HeroDao heroDao;
  final SquadDao squadDao;
  final DatabaseMapper databaseMapper;

  HeroRepositoryImpl({
    required this.apiClient,
    required this.networkMapper,
    required this.heroDao,
    required this.squadDao,
    required this.databaseMapper,
  });

  @override
  Future<List<Hero>> getHeroes({
    required int page,
    required int limit,
  }) async {
    try {
      // Try network first
      final dtos = await apiClient.getHeroes(page: page, limit: limit);
      final heroes = networkMapper.fromDtoList(dtos);

      // Save to cache
      final entities = heroes.map(databaseMapper.toHeroEntity).toList();
      await heroDao.insertHeroes(entities);

      return heroes;
    } catch (_) {
      // Fallback to local cache
      final entities = await heroDao.getHeroes(page: page, limit: limit);
      if (entities.isEmpty && page == 1) {
        rethrow;
      }
      return databaseMapper.fromHeroEntities(entities);
    }
  }

  @override
  Future<Hero> getHeroById(int id) async {
    try {
      final dto = await apiClient.getHeroById(id);
      final hero = networkMapper.fromDto(dto);
      await heroDao.insertHero(databaseMapper.toHeroEntity(hero));
      return hero;
    } catch (_) {
      final entity = await heroDao.getHeroById(id);
      if (entity == null) rethrow;
      return databaseMapper.fromHeroEntity(entity);
    }
  }

  @override
  Future<List<Hero>> getSquad() async {
    final entities = await squadDao.getSquad();
    return entities.map(databaseMapper.fromSquadEntity).toList();
  }

  @override
  Future<void> addToSquad(Hero hero) async {
    await squadDao.addToSquad(databaseMapper.toSquadEntity(hero));
  }

  @override
  Future<void> removeFromSquad(int heroId) async {
    await squadDao.removeFromSquad(heroId);
  }

  @override
  Future<bool> isInSquad(int heroId) async {
    return squadDao.isInSquad(heroId);
  }

  @override
  Future<int> getSquadCount() async {
    return squadDao.getSquadCount();
  }

  @override
  Future<bool> isSquadFull() async {
    return squadDao.isSquadFull();
  }

  @override
  Future<void> updateHeroPowerstat({
    required int heroId,
    required String powerstat,
    required int newValue,
  }) async {
    await squadDao.updateHeroPowerstat(
      heroId: heroId,
      powerstat: powerstat,
      newValue: newValue,
    );
  }

  @override
  Future<Hero?> getRandomHeroForDaily() async {
    try {
      final allHeroes = await getAllCachedHeroes();
      if (allHeroes.isEmpty) return null;
      final random = Random();
      return allHeroes[random.nextInt(allHeroes.length)];
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<Hero>> getAllCachedHeroes() async {
    try {
      // Try from network and cache everything first
      final dtos = await apiClient.getAllHeroes();
      final heroes = networkMapper.fromDtoList(dtos);
      final entities = heroes.map(databaseMapper.toHeroEntity).toList();
      await heroDao.insertHeroes(entities);
      return heroes;
    } catch (_) {
      // Fallback to local
      final entities = await heroDao.getAllHeroes();
      return databaseMapper.fromHeroEntities(entities);
    }
  }
}
