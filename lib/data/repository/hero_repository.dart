import '../../domain/hero.dart';

abstract class HeroRepository {
  Future<List<Hero>> getHeroes({required int page, required int limit});
  Future<Hero> getHeroById(int id);
  
  // Squad operations
  Future<List<Hero>> getSquad();
  Future<void> addToSquad(Hero hero);
  Future<void> removeFromSquad(int heroId);
  Future<bool> isInSquad(int heroId);
  Future<int> getSquadCount();
  Future<bool> isSquadFull();
  Future<void> updateHeroPowerstat({
    required int heroId,
    required String powerstat,
    required int newValue,
  });

  // Random hero for daily contract
  Future<Hero?> getRandomHeroForDaily();

  // For mission: all squad members
  Future<List<Hero>> getAllCachedHeroes();
}
