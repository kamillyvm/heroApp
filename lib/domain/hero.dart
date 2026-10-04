import 'package:freezed_annotation/freezed_annotation.dart';

part 'hero.freezed.dart';
part 'hero.g.dart';

@freezed
abstract class Hero with _$Hero {
  const factory Hero({
    required int id,
    required String name,
    required String slug,
    required Powerstats powerstats,
    required Appearance appearance,
    required Biography biography,
    required Work work,
    required Connections connections,
    required HeroImages images,
  }) = _Hero;

  factory Hero.fromJson(Map<String, dynamic> json) => _$HeroFromJson(json);
}

@freezed
abstract class Powerstats with _$Powerstats {
  const factory Powerstats({
    @Default(0) int intelligence,
    @Default(0) int strength,
    @Default(0) int speed,
    @Default(0) int durability,
    @Default(0) int power,
    @Default(0) int combat,
  }) = _Powerstats;

  factory Powerstats.fromJson(Map<String, dynamic> json) =>
      _$PowerstatsFromJson(json);
}

@freezed
abstract class Appearance with _$Appearance {
  const factory Appearance({
    @Default('Unknown') String gender,
    @Default('Unknown') String race,
    @Default([]) List<String> height,
    @Default([]) List<String> weight,
    @Default('Unknown') String eyeColor,
    @Default('Unknown') String hairColor,
  }) = _Appearance;

  factory Appearance.fromJson(Map<String, dynamic> json) =>
      _$AppearanceFromJson(json);
}

@freezed
abstract class Biography with _$Biography {
  const factory Biography({
    @Default('') String fullName,
    @Default('') String alterEgos,
    @Default([]) List<String> aliases,
    @Default('Unknown') String placeOfBirth,
    @Default('') String firstAppearance,
    @Default('Unknown') String publisher,
    @Default('neutral') String alignment,
  }) = _Biography;

  factory Biography.fromJson(Map<String, dynamic> json) =>
      _$BiographyFromJson(json);
}

@freezed
abstract class Work with _$Work {
  const factory Work({
    @Default('') String occupation,
    @Default('') String base,
  }) = _Work;

  factory Work.fromJson(Map<String, dynamic> json) =>
      _$WorkFromJson(json);
}

@freezed
abstract class Connections with _$Connections {
  const factory Connections({
    @Default('') String groupAffiliation,
    @Default('') String relatives,
  }) = _Connections;

  factory Connections.fromJson(Map<String, dynamic> json) =>
      _$ConnectionsFromJson(json);
}

@freezed
abstract class HeroImages with _$HeroImages {
  const factory HeroImages({
    @Default('') String xs,
    @Default('') String sm,
    @Default('') String md,
    @Default('') String lg,
  }) = _HeroImages;

  factory HeroImages.fromJson(Map<String, dynamic> json) =>
      _$HeroImagesFromJson(json);
}
