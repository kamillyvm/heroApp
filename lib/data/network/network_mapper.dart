import '../../domain/hero.dart' as domain;
import 'entity/hero_dto.dart';

class NetworkMapper {
  domain.Hero fromDto(HeroDto dto) {
    return domain.Hero(
      id: dto.id,
      name: dto.name,
      slug: dto.slug ?? '${dto.id}-${dto.name.toLowerCase().replaceAll(' ', '-')}',
      powerstats: _mapPowerstats(dto.powerstats),
      appearance: _mapAppearance(dto.appearance),
      biography: _mapBiography(dto.biography),
      work: _mapWork(dto.work),
      connections: _mapConnections(dto.connections),
      images: _mapImages(dto.images),
    );
  }

  List<domain.Hero> fromDtoList(List<HeroDto> dtos) {
    return dtos.map(fromDto).toList();
  }

  domain.Powerstats _mapPowerstats(PowerstatsDto? dto) {
    if (dto == null) return const domain.Powerstats();
    return domain.Powerstats(
      intelligence: dto.intelligence ?? 0,
      strength: dto.strength ?? 0,
      speed: dto.speed ?? 0,
      durability: dto.durability ?? 0,
      power: dto.power ?? 0,
      combat: dto.combat ?? 0,
    );
  }

  domain.Appearance _mapAppearance(AppearanceDto? dto) {
    if (dto == null) return const domain.Appearance();
    return domain.Appearance(
      gender: dto.gender ?? 'Unknown',
      race: dto.race ?? 'Unknown',
      height: dto.height ?? [],
      weight: dto.weight ?? [],
      eyeColor: dto.eyeColor ?? 'Unknown',
      hairColor: dto.hairColor ?? 'Unknown',
    );
  }

  domain.Biography _mapBiography(BiographyDto? dto) {
    if (dto == null) return const domain.Biography();
    return domain.Biography(
      fullName: dto.fullName ?? '',
      alterEgos: dto.alterEgos ?? '',
      aliases: dto.aliases ?? [],
      placeOfBirth: dto.placeOfBirth ?? 'Unknown',
      firstAppearance: dto.firstAppearance ?? '',
      publisher: dto.publisher ?? 'Unknown',
      alignment: dto.alignment ?? 'neutral',
    );
  }

  domain.Work _mapWork(WorkDto? dto) {
    if (dto == null) return const domain.Work();

    return domain.Work(
      occupation: dto.occupation ?? '',
      base: dto.base ?? '',
    );
  }

  domain.Connections _mapConnections(ConnectionsDto? dto) {
    if (dto == null) return const domain.Connections();

    return domain.Connections(
      groupAffiliation: dto.groupAffiliation ?? '',
      relatives: dto.relatives ?? '',
    );
  }

  domain.HeroImages _mapImages(HeroImagesDto? dto) {
    if (dto == null) return const domain.HeroImages();
    return domain.HeroImages(
      xs: dto.xs ?? '',
      sm: dto.sm ?? '',
      md: dto.md ?? '',
      lg: dto.lg ?? '',
    );
  }
}
