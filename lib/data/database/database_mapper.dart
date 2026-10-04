import '../../domain/hero.dart' as domain;
import 'entity/hero_entity.dart';
import 'entity/squad_entity.dart';

class DatabaseMapper {
  domain.Hero fromHeroEntity(HeroEntity e) {
    return domain.Hero(
      id: e.id,
      name: e.name,
      slug: e.slug,
      powerstats: domain.Powerstats(
        intelligence: e.intelligence,
        strength: e.strength,
        speed: e.speed,
        durability: e.durability,
        power: e.power,
        combat: e.combat,
      ),
      appearance: domain.Appearance(
        gender: e.gender,
        race: e.race,
        height: e.height.isNotEmpty ? e.height.split('|') : [],
        weight: e.weight.isNotEmpty ? e.weight.split('|') : [],
        eyeColor: e.eyeColor,
        hairColor: e.hairColor,
      ),
      biography: domain.Biography(
        fullName: e.fullName,
        alterEgos: e.alterEgos,
        aliases: e.aliases.isNotEmpty ? e.aliases.split('|') : [],
        placeOfBirth: e.placeOfBirth,
        firstAppearance: e.firstAppearance,
        publisher: e.publisher,
        alignment: e.alignment,
      ),
      work: domain.Work(
        occupation: e.occupation,
        base: e.base,
      ),
      connections: domain.Connections(
        groupAffiliation: e.groupAffiliation,
        relatives: e.relatives,
      ),
      images: domain.HeroImages(
        xs: e.imageXs,
        sm: e.imageSm,
        md: e.imageMd,
        lg: e.imageLg,
      ),
    );
  }

  HeroEntity toHeroEntity(domain.Hero hero) {
    return HeroEntity(
      id: hero.id,
      name: hero.name,
      slug: hero.slug,
      intelligence: hero.powerstats.intelligence,
      strength: hero.powerstats.strength,
      speed: hero.powerstats.speed,
      durability: hero.powerstats.durability,
      power: hero.powerstats.power,
      combat: hero.powerstats.combat,
      gender: hero.appearance.gender,
      race: hero.appearance.race,
      height: hero.appearance.height.join('|'),
      weight: hero.appearance.weight.join('|'),
      eyeColor: hero.appearance.eyeColor,
      hairColor: hero.appearance.hairColor,
      fullName: hero.biography.fullName,
      alterEgos: hero.biography.alterEgos,
      aliases: hero.biography.aliases.join('|'),
      placeOfBirth: hero.biography.placeOfBirth,
      firstAppearance: hero.biography.firstAppearance,
      publisher: hero.biography.publisher,
      alignment: hero.biography.alignment,
      occupation: hero.work.occupation,
      base: hero.work.base,
      groupAffiliation: hero.connections.groupAffiliation,
      relatives: hero.connections.relatives,
      imageXs: hero.images.xs,
      imageSm: hero.images.sm,
      imageMd: hero.images.md,
      imageLg: hero.images.lg,
    );
  }

  List<domain.Hero> fromHeroEntities(List<HeroEntity> entities) {
    return entities.map(fromHeroEntity).toList();
  }

  domain.Hero fromSquadEntity(SquadEntity e) {
    return domain.Hero(
      id: e.heroId,
      name: e.heroName,
      slug: '',
      powerstats: domain.Powerstats(
        intelligence: e.intelligence,
        strength: e.strength,
        speed: e.speed,
        durability: e.durability,
        power: e.power,
        combat: e.combat,
      ),
      appearance: const domain.Appearance(),
      biography: const domain.Biography(),
      work: const domain.Work(),
      connections: const domain.Connections(),
      images: domain.HeroImages(md: e.imageMd),
    );
  }

  SquadEntity toSquadEntity(domain.Hero hero) {
    return SquadEntity(
      heroId: hero.id,
      heroName: hero.name,
      imageMd: hero.images.md,
      intelligence: hero.powerstats.intelligence,
      strength: hero.powerstats.strength,
      speed: hero.powerstats.speed,
      durability: hero.powerstats.durability,
      power: hero.powerstats.power,
      combat: hero.powerstats.combat,
      recruitedAt: DateTime.now().millisecondsSinceEpoch,
    );
  }
}
