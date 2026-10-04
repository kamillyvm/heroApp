import 'package:json_annotation/json_annotation.dart';

part 'hero_dto.g.dart';

int _idFromJson(dynamic value) {
  if (value is int) return value;
  if (value is num) return value.toInt();
  return int.parse(value.toString());
}

@JsonSerializable()
class PowerstatsDto {
  final int? intelligence;
  final int? strength;
  final int? speed;
  final int? durability;
  final int? power;
  final int? combat;

  const PowerstatsDto({
    this.intelligence,
    this.strength,
    this.speed,
    this.durability,
    this.power,
    this.combat,
  });

  factory PowerstatsDto.fromJson(Map<String, dynamic> json) =>
      _$PowerstatsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PowerstatsDtoToJson(this);
}

@JsonSerializable()
class AppearanceDto {
  final String? gender;
  final String? race;
  final List<String>? height;
  final List<String>? weight;
  final String? eyeColor;
  final String? hairColor;

  const AppearanceDto({
    this.gender,
    this.race,
    this.height,
    this.weight,
    this.eyeColor,
    this.hairColor,
  });

  factory AppearanceDto.fromJson(Map<String, dynamic> json) =>
      _$AppearanceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AppearanceDtoToJson(this);
}

@JsonSerializable()
class BiographyDto {
  final String? fullName;
  final String? alterEgos;
  final List<String>? aliases;
  final String? placeOfBirth;
  final String? firstAppearance;
  final String? publisher;
  final String? alignment;

  const BiographyDto({
    this.fullName,
    this.alterEgos,
    this.aliases,
    this.placeOfBirth,
    this.firstAppearance,
    this.publisher,
    this.alignment,
  });

  factory BiographyDto.fromJson(Map<String, dynamic> json) =>
      _$BiographyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BiographyDtoToJson(this);
}

@JsonSerializable()
class WorkDto {
  final String? occupation;
  final String? base;

  const WorkDto({
    this.occupation,
    this.base,
  });

  factory WorkDto.fromJson(Map<String, dynamic> json) =>
      _$WorkDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WorkDtoToJson(this);
}

@JsonSerializable()
class ConnectionsDto {
  final String? groupAffiliation;
  final String? relatives;

  const ConnectionsDto({
    this.groupAffiliation,
    this.relatives,
  });

  factory ConnectionsDto.fromJson(Map<String, dynamic> json) =>
      _$ConnectionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectionsDtoToJson(this);
}

@JsonSerializable()
class HeroImagesDto {
  final String? xs;
  final String? sm;
  final String? md;
  final String? lg;

  const HeroImagesDto({this.xs, this.sm, this.md, this.lg});

  factory HeroImagesDto.fromJson(Map<String, dynamic> json) =>
      _$HeroImagesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HeroImagesDtoToJson(this);
}

@JsonSerializable()
class HeroDto {
  @JsonKey(fromJson: _idFromJson)
  final int id;
  final String name;
  final String? slug;
  final PowerstatsDto? powerstats;
  final AppearanceDto? appearance;
  final BiographyDto? biography;
  final WorkDto? work;
  final ConnectionsDto? connections;
  final HeroImagesDto? images;

  const HeroDto({
    required this.id,
    required this.name,
    this.slug,
    this.powerstats,
    this.appearance,
    this.biography,
    this.work,
    this.connections,
    this.images,
  });

  factory HeroDto.fromJson(Map<String, dynamic> json) =>
      _$HeroDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HeroDtoToJson(this);
}
