// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Hero _$HeroFromJson(Map<String, dynamic> json) => _Hero(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  slug: json['slug'] as String,
  powerstats: Powerstats.fromJson(json['powerstats'] as Map<String, dynamic>),
  appearance: Appearance.fromJson(json['appearance'] as Map<String, dynamic>),
  biography: Biography.fromJson(json['biography'] as Map<String, dynamic>),
  work: Work.fromJson(json['work'] as Map<String, dynamic>),
  connections: Connections.fromJson(
    json['connections'] as Map<String, dynamic>,
  ),
  images: HeroImages.fromJson(json['images'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HeroToJson(_Hero instance) => <String, dynamic>{
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

_Powerstats _$PowerstatsFromJson(Map<String, dynamic> json) => _Powerstats(
  intelligence: (json['intelligence'] as num?)?.toInt() ?? 0,
  strength: (json['strength'] as num?)?.toInt() ?? 0,
  speed: (json['speed'] as num?)?.toInt() ?? 0,
  durability: (json['durability'] as num?)?.toInt() ?? 0,
  power: (json['power'] as num?)?.toInt() ?? 0,
  combat: (json['combat'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$PowerstatsToJson(_Powerstats instance) =>
    <String, dynamic>{
      'intelligence': instance.intelligence,
      'strength': instance.strength,
      'speed': instance.speed,
      'durability': instance.durability,
      'power': instance.power,
      'combat': instance.combat,
    };

_Appearance _$AppearanceFromJson(Map<String, dynamic> json) => _Appearance(
  gender: json['gender'] as String? ?? 'Unknown',
  race: json['race'] as String? ?? 'Unknown',
  height:
      (json['height'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  weight:
      (json['weight'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  eyeColor: json['eyeColor'] as String? ?? 'Unknown',
  hairColor: json['hairColor'] as String? ?? 'Unknown',
);

Map<String, dynamic> _$AppearanceToJson(_Appearance instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'race': instance.race,
      'height': instance.height,
      'weight': instance.weight,
      'eyeColor': instance.eyeColor,
      'hairColor': instance.hairColor,
    };

_Biography _$BiographyFromJson(Map<String, dynamic> json) => _Biography(
  fullName: json['fullName'] as String? ?? '',
  alterEgos: json['alterEgos'] as String? ?? '',
  aliases:
      (json['aliases'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  placeOfBirth: json['placeOfBirth'] as String? ?? 'Unknown',
  firstAppearance: json['firstAppearance'] as String? ?? '',
  publisher: json['publisher'] as String? ?? 'Unknown',
  alignment: json['alignment'] as String? ?? 'neutral',
);

Map<String, dynamic> _$BiographyToJson(_Biography instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'alterEgos': instance.alterEgos,
      'aliases': instance.aliases,
      'placeOfBirth': instance.placeOfBirth,
      'firstAppearance': instance.firstAppearance,
      'publisher': instance.publisher,
      'alignment': instance.alignment,
    };

_Work _$WorkFromJson(Map<String, dynamic> json) => _Work(
  occupation: json['occupation'] as String? ?? '',
  base: json['base'] as String? ?? '',
);

Map<String, dynamic> _$WorkToJson(_Work instance) => <String, dynamic>{
  'occupation': instance.occupation,
  'base': instance.base,
};

_Connections _$ConnectionsFromJson(Map<String, dynamic> json) => _Connections(
  groupAffiliation: json['groupAffiliation'] as String? ?? '',
  relatives: json['relatives'] as String? ?? '',
);

Map<String, dynamic> _$ConnectionsToJson(_Connections instance) =>
    <String, dynamic>{
      'groupAffiliation': instance.groupAffiliation,
      'relatives': instance.relatives,
    };

_HeroImages _$HeroImagesFromJson(Map<String, dynamic> json) => _HeroImages(
  xs: json['xs'] as String? ?? '',
  sm: json['sm'] as String? ?? '',
  md: json['md'] as String? ?? '',
  lg: json['lg'] as String? ?? '',
);

Map<String, dynamic> _$HeroImagesToJson(_HeroImages instance) =>
    <String, dynamic>{
      'xs': instance.xs,
      'sm': instance.sm,
      'md': instance.md,
      'lg': instance.lg,
    };
