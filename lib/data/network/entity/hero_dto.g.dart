// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PowerstatsDto _$PowerstatsDtoFromJson(Map<String, dynamic> json) =>
    PowerstatsDto(
      intelligence: (json['intelligence'] as num?)?.toInt(),
      strength: (json['strength'] as num?)?.toInt(),
      speed: (json['speed'] as num?)?.toInt(),
      durability: (json['durability'] as num?)?.toInt(),
      power: (json['power'] as num?)?.toInt(),
      combat: (json['combat'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PowerstatsDtoToJson(PowerstatsDto instance) =>
    <String, dynamic>{
      'intelligence': instance.intelligence,
      'strength': instance.strength,
      'speed': instance.speed,
      'durability': instance.durability,
      'power': instance.power,
      'combat': instance.combat,
    };

AppearanceDto _$AppearanceDtoFromJson(
  Map<String, dynamic> json,
) => AppearanceDto(
  gender: json['gender'] as String?,
  race: json['race'] as String?,
  height: (json['height'] as List<dynamic>?)?.map((e) => e as String).toList(),
  weight: (json['weight'] as List<dynamic>?)?.map((e) => e as String).toList(),
  eyeColor: json['eyeColor'] as String?,
  hairColor: json['hairColor'] as String?,
);

Map<String, dynamic> _$AppearanceDtoToJson(AppearanceDto instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'race': instance.race,
      'height': instance.height,
      'weight': instance.weight,
      'eyeColor': instance.eyeColor,
      'hairColor': instance.hairColor,
    };

BiographyDto _$BiographyDtoFromJson(Map<String, dynamic> json) => BiographyDto(
  fullName: json['fullName'] as String?,
  alterEgos: json['alterEgos'] as String?,
  aliases: (json['aliases'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  placeOfBirth: json['placeOfBirth'] as String?,
  firstAppearance: json['firstAppearance'] as String?,
  publisher: json['publisher'] as String?,
  alignment: json['alignment'] as String?,
);

Map<String, dynamic> _$BiographyDtoToJson(BiographyDto instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'alterEgos': instance.alterEgos,
      'aliases': instance.aliases,
      'placeOfBirth': instance.placeOfBirth,
      'firstAppearance': instance.firstAppearance,
      'publisher': instance.publisher,
      'alignment': instance.alignment,
    };

WorkDto _$WorkDtoFromJson(Map<String, dynamic> json) => WorkDto(
  occupation: json['occupation'] as String?,
  base: json['base'] as String?,
);

Map<String, dynamic> _$WorkDtoToJson(WorkDto instance) => <String, dynamic>{
  'occupation': instance.occupation,
  'base': instance.base,
};

ConnectionsDto _$ConnectionsDtoFromJson(Map<String, dynamic> json) =>
    ConnectionsDto(
      groupAffiliation: json['groupAffiliation'] as String?,
      relatives: json['relatives'] as String?,
    );

Map<String, dynamic> _$ConnectionsDtoToJson(ConnectionsDto instance) =>
    <String, dynamic>{
      'groupAffiliation': instance.groupAffiliation,
      'relatives': instance.relatives,
    };

HeroImagesDto _$HeroImagesDtoFromJson(Map<String, dynamic> json) =>
    HeroImagesDto(
      xs: json['xs'] as String?,
      sm: json['sm'] as String?,
      md: json['md'] as String?,
      lg: json['lg'] as String?,
    );

Map<String, dynamic> _$HeroImagesDtoToJson(HeroImagesDto instance) =>
    <String, dynamic>{
      'xs': instance.xs,
      'sm': instance.sm,
      'md': instance.md,
      'lg': instance.lg,
    };

HeroDto _$HeroDtoFromJson(Map<String, dynamic> json) => HeroDto(
  id: _idFromJson(json['id']),
  name: json['name'] as String,
  slug: json['slug'] as String?,
  powerstats: json['powerstats'] == null
      ? null
      : PowerstatsDto.fromJson(json['powerstats'] as Map<String, dynamic>),
  appearance: json['appearance'] == null
      ? null
      : AppearanceDto.fromJson(json['appearance'] as Map<String, dynamic>),
  biography: json['biography'] == null
      ? null
      : BiographyDto.fromJson(json['biography'] as Map<String, dynamic>),
  work: json['work'] == null
      ? null
      : WorkDto.fromJson(json['work'] as Map<String, dynamic>),
  connections: json['connections'] == null
      ? null
      : ConnectionsDto.fromJson(json['connections'] as Map<String, dynamic>),
  images: json['images'] == null
      ? null
      : HeroImagesDto.fromJson(json['images'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HeroDtoToJson(HeroDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'powerstats': instance.powerstats,
  'appearance': instance.appearance,
  'biography': instance.biography,
  'work': instance.work,
  'connections': instance.connections,
  'images': instance.images,
};
