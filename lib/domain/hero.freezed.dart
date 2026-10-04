// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hero.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Hero {

 int get id; String get name; String get slug; Powerstats get powerstats; Appearance get appearance; Biography get biography; Work get work; Connections get connections; HeroImages get images;
/// Create a copy of Hero
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HeroCopyWith<Hero> get copyWith => _$HeroCopyWithImpl<Hero>(this as Hero, _$identity);

  /// Serializes this Hero to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Hero;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Hero&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.slug, _this.slug) || other.slug == _this.slug)&&(identical(other.powerstats, _this.powerstats) || other.powerstats == _this.powerstats)&&(identical(other.appearance, _this.appearance) || other.appearance == _this.appearance)&&(identical(other.biography, _this.biography) || other.biography == _this.biography)&&(identical(other.work, _this.work) || other.work == _this.work)&&(identical(other.connections, _this.connections) || other.connections == _this.connections)&&(identical(other.images, _this.images) || other.images == _this.images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Hero;
  return Object.hash(runtimeType,_this.id,_this.name,_this.slug,_this.powerstats,_this.appearance,_this.biography,_this.work,_this.connections,_this.images);
}

@override
String toString() {
  final _this = this as Hero;
  return 'Hero(id: ${_this.id}, name: ${_this.name}, slug: ${_this.slug}, powerstats: ${_this.powerstats}, appearance: ${_this.appearance}, biography: ${_this.biography}, work: ${_this.work}, connections: ${_this.connections}, images: ${_this.images})';
}


}

/// @nodoc
abstract mixin class $HeroCopyWith<$Res>  {
  factory $HeroCopyWith(Hero value, $Res Function(Hero) _then) = _$HeroCopyWithImpl;
@useResult
$Res call({
 int id, String name, String slug, Powerstats powerstats, Appearance appearance, Biography biography, Work work, Connections connections, HeroImages images
});


$PowerstatsCopyWith<$Res> get powerstats;$AppearanceCopyWith<$Res> get appearance;$BiographyCopyWith<$Res> get biography;$WorkCopyWith<$Res> get work;$ConnectionsCopyWith<$Res> get connections;$HeroImagesCopyWith<$Res> get images;

}
/// @nodoc
class _$HeroCopyWithImpl<$Res>
    implements $HeroCopyWith<$Res> {
  _$HeroCopyWithImpl(this._self, this._then);

  final Hero _self;
  final $Res Function(Hero) _then;

/// Create a copy of Hero
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? powerstats = null,Object? appearance = null,Object? biography = null,Object? work = null,Object? connections = null,Object? images = null,}) {
  return _then(Hero(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,powerstats: null == powerstats ? _self.powerstats : powerstats // ignore: cast_nullable_to_non_nullable
as Powerstats,appearance: null == appearance ? _self.appearance : appearance // ignore: cast_nullable_to_non_nullable
as Appearance,biography: null == biography ? _self.biography : biography // ignore: cast_nullable_to_non_nullable
as Biography,work: null == work ? _self.work : work // ignore: cast_nullable_to_non_nullable
as Work,connections: null == connections ? _self.connections : connections // ignore: cast_nullable_to_non_nullable
as Connections,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as HeroImages,
  ));
}
/// Create a copy of Hero
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PowerstatsCopyWith<$Res> get powerstats {
  
  return $PowerstatsCopyWith<$Res>(_self.powerstats, (value) {
    return _then(_self.copyWith(powerstats: value));
  });
}/// Create a copy of Hero
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppearanceCopyWith<$Res> get appearance {
  
  return $AppearanceCopyWith<$Res>(_self.appearance, (value) {
    return _then(_self.copyWith(appearance: value));
  });
}/// Create a copy of Hero
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BiographyCopyWith<$Res> get biography {
  
  return $BiographyCopyWith<$Res>(_self.biography, (value) {
    return _then(_self.copyWith(biography: value));
  });
}/// Create a copy of Hero
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkCopyWith<$Res> get work {
  
  return $WorkCopyWith<$Res>(_self.work, (value) {
    return _then(_self.copyWith(work: value));
  });
}/// Create a copy of Hero
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectionsCopyWith<$Res> get connections {
  
  return $ConnectionsCopyWith<$Res>(_self.connections, (value) {
    return _then(_self.copyWith(connections: value));
  });
}/// Create a copy of Hero
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HeroImagesCopyWith<$Res> get images {
  
  return $HeroImagesCopyWith<$Res>(_self.images, (value) {
    return _then(_self.copyWith(images: value));
  });
}
}


/// Adds pattern-matching-related methods to [Hero].
extension HeroPatterns on Hero {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Hero value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Hero() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Hero value)  $default,){
final _that = this;
switch (_that) {
case _Hero():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Hero value)?  $default,){
final _that = this;
switch (_that) {
case _Hero() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String slug,  Powerstats powerstats,  Appearance appearance,  Biography biography,  Work work,  Connections connections,  HeroImages images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Hero() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.powerstats,_that.appearance,_that.biography,_that.work,_that.connections,_that.images);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String slug,  Powerstats powerstats,  Appearance appearance,  Biography biography,  Work work,  Connections connections,  HeroImages images)  $default,) {final _that = this;
switch (_that) {
case _Hero():
return $default(_that.id,_that.name,_that.slug,_that.powerstats,_that.appearance,_that.biography,_that.work,_that.connections,_that.images);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String slug,  Powerstats powerstats,  Appearance appearance,  Biography biography,  Work work,  Connections connections,  HeroImages images)?  $default,) {final _that = this;
switch (_that) {
case _Hero() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.powerstats,_that.appearance,_that.biography,_that.work,_that.connections,_that.images);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Hero implements Hero {
  const _Hero({required this.id, required this.name, required this.slug, required this.powerstats, required this.appearance, required this.biography, required this.work, required this.connections, required this.images});
  factory _Hero.fromJson(Map<String, dynamic> json) => _$HeroFromJson(json);

@override final  int id;
@override final  String name;
@override final  String slug;
@override final  Powerstats powerstats;
@override final  Appearance appearance;
@override final  Biography biography;
@override final  Work work;
@override final  Connections connections;
@override final  HeroImages images;

/// Create a copy of Hero
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HeroCopyWith<_Hero> get copyWith => __$HeroCopyWithImpl<_Hero>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HeroToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Hero&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.powerstats, powerstats) || other.powerstats == powerstats)&&(identical(other.appearance, appearance) || other.appearance == appearance)&&(identical(other.biography, biography) || other.biography == biography)&&(identical(other.work, work) || other.work == work)&&(identical(other.connections, connections) || other.connections == connections)&&(identical(other.images, images) || other.images == images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,slug,powerstats,appearance,biography,work,connections,images);
}

@override
String toString() {
    return 'Hero(id: $id, name: $name, slug: $slug, powerstats: $powerstats, appearance: $appearance, biography: $biography, work: $work, connections: $connections, images: $images)';
}


}

/// @nodoc
abstract mixin class _$HeroCopyWith<$Res> implements $HeroCopyWith<$Res> {
  factory _$HeroCopyWith(_Hero value, $Res Function(_Hero) _then) = __$HeroCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String slug, Powerstats powerstats, Appearance appearance, Biography biography, Work work, Connections connections, HeroImages images
});


@override $PowerstatsCopyWith<$Res> get powerstats;@override $AppearanceCopyWith<$Res> get appearance;@override $BiographyCopyWith<$Res> get biography;@override $WorkCopyWith<$Res> get work;@override $ConnectionsCopyWith<$Res> get connections;@override $HeroImagesCopyWith<$Res> get images;

}
/// @nodoc
class __$HeroCopyWithImpl<$Res>
    implements _$HeroCopyWith<$Res> {
  __$HeroCopyWithImpl(this._self, this._then);

  final _Hero _self;
  final $Res Function(_Hero) _then;

/// Create a copy of Hero
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? powerstats = null,Object? appearance = null,Object? biography = null,Object? work = null,Object? connections = null,Object? images = null,}) {
  return _then(_Hero(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,powerstats: null == powerstats ? _self.powerstats : powerstats // ignore: cast_nullable_to_non_nullable
as Powerstats,appearance: null == appearance ? _self.appearance : appearance // ignore: cast_nullable_to_non_nullable
as Appearance,biography: null == biography ? _self.biography : biography // ignore: cast_nullable_to_non_nullable
as Biography,work: null == work ? _self.work : work // ignore: cast_nullable_to_non_nullable
as Work,connections: null == connections ? _self.connections : connections // ignore: cast_nullable_to_non_nullable
as Connections,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as HeroImages,
  ));
}

/// Create a copy of Hero
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PowerstatsCopyWith<$Res> get powerstats {
  
  return $PowerstatsCopyWith<$Res>(_self.powerstats, (value) {
    return _then(_self.copyWith(powerstats: value));
  });
}/// Create a copy of Hero
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppearanceCopyWith<$Res> get appearance {
  
  return $AppearanceCopyWith<$Res>(_self.appearance, (value) {
    return _then(_self.copyWith(appearance: value));
  });
}/// Create a copy of Hero
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BiographyCopyWith<$Res> get biography {
  
  return $BiographyCopyWith<$Res>(_self.biography, (value) {
    return _then(_self.copyWith(biography: value));
  });
}/// Create a copy of Hero
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkCopyWith<$Res> get work {
  
  return $WorkCopyWith<$Res>(_self.work, (value) {
    return _then(_self.copyWith(work: value));
  });
}/// Create a copy of Hero
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectionsCopyWith<$Res> get connections {
  
  return $ConnectionsCopyWith<$Res>(_self.connections, (value) {
    return _then(_self.copyWith(connections: value));
  });
}/// Create a copy of Hero
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HeroImagesCopyWith<$Res> get images {
  
  return $HeroImagesCopyWith<$Res>(_self.images, (value) {
    return _then(_self.copyWith(images: value));
  });
}
}


/// @nodoc
mixin _$Powerstats {

 int get intelligence; int get strength; int get speed; int get durability; int get power; int get combat;
/// Create a copy of Powerstats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PowerstatsCopyWith<Powerstats> get copyWith => _$PowerstatsCopyWithImpl<Powerstats>(this as Powerstats, _$identity);

  /// Serializes this Powerstats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Powerstats;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Powerstats&&(identical(other.intelligence, _this.intelligence) || other.intelligence == _this.intelligence)&&(identical(other.strength, _this.strength) || other.strength == _this.strength)&&(identical(other.speed, _this.speed) || other.speed == _this.speed)&&(identical(other.durability, _this.durability) || other.durability == _this.durability)&&(identical(other.power, _this.power) || other.power == _this.power)&&(identical(other.combat, _this.combat) || other.combat == _this.combat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Powerstats;
  return Object.hash(runtimeType,_this.intelligence,_this.strength,_this.speed,_this.durability,_this.power,_this.combat);
}

@override
String toString() {
  final _this = this as Powerstats;
  return 'Powerstats(intelligence: ${_this.intelligence}, strength: ${_this.strength}, speed: ${_this.speed}, durability: ${_this.durability}, power: ${_this.power}, combat: ${_this.combat})';
}


}

/// @nodoc
abstract mixin class $PowerstatsCopyWith<$Res>  {
  factory $PowerstatsCopyWith(Powerstats value, $Res Function(Powerstats) _then) = _$PowerstatsCopyWithImpl;
@useResult
$Res call({
 int intelligence, int strength, int speed, int durability, int power, int combat
});




}
/// @nodoc
class _$PowerstatsCopyWithImpl<$Res>
    implements $PowerstatsCopyWith<$Res> {
  _$PowerstatsCopyWithImpl(this._self, this._then);

  final Powerstats _self;
  final $Res Function(Powerstats) _then;

/// Create a copy of Powerstats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? intelligence = null,Object? strength = null,Object? speed = null,Object? durability = null,Object? power = null,Object? combat = null,}) {
  return _then(Powerstats(
intelligence: null == intelligence ? _self.intelligence : intelligence // ignore: cast_nullable_to_non_nullable
as int,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as int,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as int,durability: null == durability ? _self.durability : durability // ignore: cast_nullable_to_non_nullable
as int,power: null == power ? _self.power : power // ignore: cast_nullable_to_non_nullable
as int,combat: null == combat ? _self.combat : combat // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Powerstats].
extension PowerstatsPatterns on Powerstats {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Powerstats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Powerstats() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Powerstats value)  $default,){
final _that = this;
switch (_that) {
case _Powerstats():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Powerstats value)?  $default,){
final _that = this;
switch (_that) {
case _Powerstats() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int intelligence,  int strength,  int speed,  int durability,  int power,  int combat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Powerstats() when $default != null:
return $default(_that.intelligence,_that.strength,_that.speed,_that.durability,_that.power,_that.combat);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int intelligence,  int strength,  int speed,  int durability,  int power,  int combat)  $default,) {final _that = this;
switch (_that) {
case _Powerstats():
return $default(_that.intelligence,_that.strength,_that.speed,_that.durability,_that.power,_that.combat);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int intelligence,  int strength,  int speed,  int durability,  int power,  int combat)?  $default,) {final _that = this;
switch (_that) {
case _Powerstats() when $default != null:
return $default(_that.intelligence,_that.strength,_that.speed,_that.durability,_that.power,_that.combat);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Powerstats implements Powerstats {
  const _Powerstats({this.intelligence = 0, this.strength = 0, this.speed = 0, this.durability = 0, this.power = 0, this.combat = 0});
  factory _Powerstats.fromJson(Map<String, dynamic> json) => _$PowerstatsFromJson(json);

@override@JsonKey() final  int intelligence;
@override@JsonKey() final  int strength;
@override@JsonKey() final  int speed;
@override@JsonKey() final  int durability;
@override@JsonKey() final  int power;
@override@JsonKey() final  int combat;

/// Create a copy of Powerstats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PowerstatsCopyWith<_Powerstats> get copyWith => __$PowerstatsCopyWithImpl<_Powerstats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PowerstatsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Powerstats&&(identical(other.intelligence, intelligence) || other.intelligence == intelligence)&&(identical(other.strength, strength) || other.strength == strength)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.durability, durability) || other.durability == durability)&&(identical(other.power, power) || other.power == power)&&(identical(other.combat, combat) || other.combat == combat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,intelligence,strength,speed,durability,power,combat);
}

@override
String toString() {
    return 'Powerstats(intelligence: $intelligence, strength: $strength, speed: $speed, durability: $durability, power: $power, combat: $combat)';
}


}

/// @nodoc
abstract mixin class _$PowerstatsCopyWith<$Res> implements $PowerstatsCopyWith<$Res> {
  factory _$PowerstatsCopyWith(_Powerstats value, $Res Function(_Powerstats) _then) = __$PowerstatsCopyWithImpl;
@override @useResult
$Res call({
 int intelligence, int strength, int speed, int durability, int power, int combat
});




}
/// @nodoc
class __$PowerstatsCopyWithImpl<$Res>
    implements _$PowerstatsCopyWith<$Res> {
  __$PowerstatsCopyWithImpl(this._self, this._then);

  final _Powerstats _self;
  final $Res Function(_Powerstats) _then;

/// Create a copy of Powerstats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? intelligence = null,Object? strength = null,Object? speed = null,Object? durability = null,Object? power = null,Object? combat = null,}) {
  return _then(_Powerstats(
intelligence: null == intelligence ? _self.intelligence : intelligence // ignore: cast_nullable_to_non_nullable
as int,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as int,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as int,durability: null == durability ? _self.durability : durability // ignore: cast_nullable_to_non_nullable
as int,power: null == power ? _self.power : power // ignore: cast_nullable_to_non_nullable
as int,combat: null == combat ? _self.combat : combat // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Appearance {

 String get gender; String get race; List<String> get height; List<String> get weight; String get eyeColor; String get hairColor;
/// Create a copy of Appearance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppearanceCopyWith<Appearance> get copyWith => _$AppearanceCopyWithImpl<Appearance>(this as Appearance, _$identity);

  /// Serializes this Appearance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Appearance;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Appearance&&(identical(other.gender, _this.gender) || other.gender == _this.gender)&&(identical(other.race, _this.race) || other.race == _this.race)&&const DeepCollectionEquality().equals(other.height, _this.height)&&const DeepCollectionEquality().equals(other.weight, _this.weight)&&(identical(other.eyeColor, _this.eyeColor) || other.eyeColor == _this.eyeColor)&&(identical(other.hairColor, _this.hairColor) || other.hairColor == _this.hairColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Appearance;
  return Object.hash(runtimeType,_this.gender,_this.race,const DeepCollectionEquality().hash(_this.height),const DeepCollectionEquality().hash(_this.weight),_this.eyeColor,_this.hairColor);
}

@override
String toString() {
  final _this = this as Appearance;
  return 'Appearance(gender: ${_this.gender}, race: ${_this.race}, height: ${_this.height}, weight: ${_this.weight}, eyeColor: ${_this.eyeColor}, hairColor: ${_this.hairColor})';
}


}

/// @nodoc
abstract mixin class $AppearanceCopyWith<$Res>  {
  factory $AppearanceCopyWith(Appearance value, $Res Function(Appearance) _then) = _$AppearanceCopyWithImpl;
@useResult
$Res call({
 String gender, String race, List<String> height, List<String> weight, String eyeColor, String hairColor
});




}
/// @nodoc
class _$AppearanceCopyWithImpl<$Res>
    implements $AppearanceCopyWith<$Res> {
  _$AppearanceCopyWithImpl(this._self, this._then);

  final Appearance _self;
  final $Res Function(Appearance) _then;

/// Create a copy of Appearance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gender = null,Object? race = null,Object? height = null,Object? weight = null,Object? eyeColor = null,Object? hairColor = null,}) {
  return _then(Appearance(
gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,race: null == race ? _self.race : race // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as List<String>,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as List<String>,eyeColor: null == eyeColor ? _self.eyeColor : eyeColor // ignore: cast_nullable_to_non_nullable
as String,hairColor: null == hairColor ? _self.hairColor : hairColor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Appearance].
extension AppearancePatterns on Appearance {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Appearance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Appearance() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Appearance value)  $default,){
final _that = this;
switch (_that) {
case _Appearance():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Appearance value)?  $default,){
final _that = this;
switch (_that) {
case _Appearance() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String gender,  String race,  List<String> height,  List<String> weight,  String eyeColor,  String hairColor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Appearance() when $default != null:
return $default(_that.gender,_that.race,_that.height,_that.weight,_that.eyeColor,_that.hairColor);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String gender,  String race,  List<String> height,  List<String> weight,  String eyeColor,  String hairColor)  $default,) {final _that = this;
switch (_that) {
case _Appearance():
return $default(_that.gender,_that.race,_that.height,_that.weight,_that.eyeColor,_that.hairColor);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String gender,  String race,  List<String> height,  List<String> weight,  String eyeColor,  String hairColor)?  $default,) {final _that = this;
switch (_that) {
case _Appearance() when $default != null:
return $default(_that.gender,_that.race,_that.height,_that.weight,_that.eyeColor,_that.hairColor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Appearance implements Appearance {
  const _Appearance({this.gender = 'Unknown', this.race = 'Unknown',  List<String> height = const [],  List<String> weight = const [], this.eyeColor = 'Unknown', this.hairColor = 'Unknown'}): _height = height,_weight = weight;
  factory _Appearance.fromJson(Map<String, dynamic> json) => _$AppearanceFromJson(json);

@override@JsonKey() final  String gender;
@override@JsonKey() final  String race;
 final  List<String> _height;
@override@JsonKey() List<String> get height {
  if (_height is EqualUnmodifiableListView) return _height;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_height);
}

 final  List<String> _weight;
@override@JsonKey() List<String> get weight {
  if (_weight is EqualUnmodifiableListView) return _weight;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weight);
}

@override@JsonKey() final  String eyeColor;
@override@JsonKey() final  String hairColor;

/// Create a copy of Appearance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppearanceCopyWith<_Appearance> get copyWith => __$AppearanceCopyWithImpl<_Appearance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppearanceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Appearance&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.race, race) || other.race == race)&&const DeepCollectionEquality().equals(other.height, _height)&&const DeepCollectionEquality().equals(other.weight, _weight)&&(identical(other.eyeColor, eyeColor) || other.eyeColor == eyeColor)&&(identical(other.hairColor, hairColor) || other.hairColor == hairColor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,gender,race,const DeepCollectionEquality().hash(_height),const DeepCollectionEquality().hash(_weight),eyeColor,hairColor);
}

@override
String toString() {
    return 'Appearance(gender: $gender, race: $race, height: $height, weight: $weight, eyeColor: $eyeColor, hairColor: $hairColor)';
}


}

/// @nodoc
abstract mixin class _$AppearanceCopyWith<$Res> implements $AppearanceCopyWith<$Res> {
  factory _$AppearanceCopyWith(_Appearance value, $Res Function(_Appearance) _then) = __$AppearanceCopyWithImpl;
@override @useResult
$Res call({
 String gender, String race, List<String> height, List<String> weight, String eyeColor, String hairColor
});




}
/// @nodoc
class __$AppearanceCopyWithImpl<$Res>
    implements _$AppearanceCopyWith<$Res> {
  __$AppearanceCopyWithImpl(this._self, this._then);

  final _Appearance _self;
  final $Res Function(_Appearance) _then;

/// Create a copy of Appearance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gender = null,Object? race = null,Object? height = null,Object? weight = null,Object? eyeColor = null,Object? hairColor = null,}) {
  return _then(_Appearance(
gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,race: null == race ? _self.race : race // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self._height : height // ignore: cast_nullable_to_non_nullable
as List<String>,weight: null == weight ? _self._weight : weight // ignore: cast_nullable_to_non_nullable
as List<String>,eyeColor: null == eyeColor ? _self.eyeColor : eyeColor // ignore: cast_nullable_to_non_nullable
as String,hairColor: null == hairColor ? _self.hairColor : hairColor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Biography {

 String get fullName; String get alterEgos; List<String> get aliases; String get placeOfBirth; String get firstAppearance; String get publisher; String get alignment;
/// Create a copy of Biography
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BiographyCopyWith<Biography> get copyWith => _$BiographyCopyWithImpl<Biography>(this as Biography, _$identity);

  /// Serializes this Biography to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Biography;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Biography&&(identical(other.fullName, _this.fullName) || other.fullName == _this.fullName)&&(identical(other.alterEgos, _this.alterEgos) || other.alterEgos == _this.alterEgos)&&const DeepCollectionEquality().equals(other.aliases, _this.aliases)&&(identical(other.placeOfBirth, _this.placeOfBirth) || other.placeOfBirth == _this.placeOfBirth)&&(identical(other.firstAppearance, _this.firstAppearance) || other.firstAppearance == _this.firstAppearance)&&(identical(other.publisher, _this.publisher) || other.publisher == _this.publisher)&&(identical(other.alignment, _this.alignment) || other.alignment == _this.alignment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Biography;
  return Object.hash(runtimeType,_this.fullName,_this.alterEgos,const DeepCollectionEquality().hash(_this.aliases),_this.placeOfBirth,_this.firstAppearance,_this.publisher,_this.alignment);
}

@override
String toString() {
  final _this = this as Biography;
  return 'Biography(fullName: ${_this.fullName}, alterEgos: ${_this.alterEgos}, aliases: ${_this.aliases}, placeOfBirth: ${_this.placeOfBirth}, firstAppearance: ${_this.firstAppearance}, publisher: ${_this.publisher}, alignment: ${_this.alignment})';
}


}

/// @nodoc
abstract mixin class $BiographyCopyWith<$Res>  {
  factory $BiographyCopyWith(Biography value, $Res Function(Biography) _then) = _$BiographyCopyWithImpl;
@useResult
$Res call({
 String fullName, String alterEgos, List<String> aliases, String placeOfBirth, String firstAppearance, String publisher, String alignment
});




}
/// @nodoc
class _$BiographyCopyWithImpl<$Res>
    implements $BiographyCopyWith<$Res> {
  _$BiographyCopyWithImpl(this._self, this._then);

  final Biography _self;
  final $Res Function(Biography) _then;

/// Create a copy of Biography
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? alterEgos = null,Object? aliases = null,Object? placeOfBirth = null,Object? firstAppearance = null,Object? publisher = null,Object? alignment = null,}) {
  return _then(Biography(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,alterEgos: null == alterEgos ? _self.alterEgos : alterEgos // ignore: cast_nullable_to_non_nullable
as String,aliases: null == aliases ? _self.aliases : aliases // ignore: cast_nullable_to_non_nullable
as List<String>,placeOfBirth: null == placeOfBirth ? _self.placeOfBirth : placeOfBirth // ignore: cast_nullable_to_non_nullable
as String,firstAppearance: null == firstAppearance ? _self.firstAppearance : firstAppearance // ignore: cast_nullable_to_non_nullable
as String,publisher: null == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String,alignment: null == alignment ? _self.alignment : alignment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Biography].
extension BiographyPatterns on Biography {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Biography value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Biography() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Biography value)  $default,){
final _that = this;
switch (_that) {
case _Biography():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Biography value)?  $default,){
final _that = this;
switch (_that) {
case _Biography() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  String alterEgos,  List<String> aliases,  String placeOfBirth,  String firstAppearance,  String publisher,  String alignment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Biography() when $default != null:
return $default(_that.fullName,_that.alterEgos,_that.aliases,_that.placeOfBirth,_that.firstAppearance,_that.publisher,_that.alignment);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  String alterEgos,  List<String> aliases,  String placeOfBirth,  String firstAppearance,  String publisher,  String alignment)  $default,) {final _that = this;
switch (_that) {
case _Biography():
return $default(_that.fullName,_that.alterEgos,_that.aliases,_that.placeOfBirth,_that.firstAppearance,_that.publisher,_that.alignment);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  String alterEgos,  List<String> aliases,  String placeOfBirth,  String firstAppearance,  String publisher,  String alignment)?  $default,) {final _that = this;
switch (_that) {
case _Biography() when $default != null:
return $default(_that.fullName,_that.alterEgos,_that.aliases,_that.placeOfBirth,_that.firstAppearance,_that.publisher,_that.alignment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Biography implements Biography {
  const _Biography({this.fullName = '', this.alterEgos = '',  List<String> aliases = const [], this.placeOfBirth = 'Unknown', this.firstAppearance = '', this.publisher = 'Unknown', this.alignment = 'neutral'}): _aliases = aliases;
  factory _Biography.fromJson(Map<String, dynamic> json) => _$BiographyFromJson(json);

@override@JsonKey() final  String fullName;
@override@JsonKey() final  String alterEgos;
 final  List<String> _aliases;
@override@JsonKey() List<String> get aliases {
  if (_aliases is EqualUnmodifiableListView) return _aliases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_aliases);
}

@override@JsonKey() final  String placeOfBirth;
@override@JsonKey() final  String firstAppearance;
@override@JsonKey() final  String publisher;
@override@JsonKey() final  String alignment;

/// Create a copy of Biography
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BiographyCopyWith<_Biography> get copyWith => __$BiographyCopyWithImpl<_Biography>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BiographyToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Biography&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.alterEgos, alterEgos) || other.alterEgos == alterEgos)&&const DeepCollectionEquality().equals(other.aliases, _aliases)&&(identical(other.placeOfBirth, placeOfBirth) || other.placeOfBirth == placeOfBirth)&&(identical(other.firstAppearance, firstAppearance) || other.firstAppearance == firstAppearance)&&(identical(other.publisher, publisher) || other.publisher == publisher)&&(identical(other.alignment, alignment) || other.alignment == alignment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fullName,alterEgos,const DeepCollectionEquality().hash(_aliases),placeOfBirth,firstAppearance,publisher,alignment);
}

@override
String toString() {
    return 'Biography(fullName: $fullName, alterEgos: $alterEgos, aliases: $aliases, placeOfBirth: $placeOfBirth, firstAppearance: $firstAppearance, publisher: $publisher, alignment: $alignment)';
}


}

/// @nodoc
abstract mixin class _$BiographyCopyWith<$Res> implements $BiographyCopyWith<$Res> {
  factory _$BiographyCopyWith(_Biography value, $Res Function(_Biography) _then) = __$BiographyCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String alterEgos, List<String> aliases, String placeOfBirth, String firstAppearance, String publisher, String alignment
});




}
/// @nodoc
class __$BiographyCopyWithImpl<$Res>
    implements _$BiographyCopyWith<$Res> {
  __$BiographyCopyWithImpl(this._self, this._then);

  final _Biography _self;
  final $Res Function(_Biography) _then;

/// Create a copy of Biography
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? alterEgos = null,Object? aliases = null,Object? placeOfBirth = null,Object? firstAppearance = null,Object? publisher = null,Object? alignment = null,}) {
  return _then(_Biography(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,alterEgos: null == alterEgos ? _self.alterEgos : alterEgos // ignore: cast_nullable_to_non_nullable
as String,aliases: null == aliases ? _self._aliases : aliases // ignore: cast_nullable_to_non_nullable
as List<String>,placeOfBirth: null == placeOfBirth ? _self.placeOfBirth : placeOfBirth // ignore: cast_nullable_to_non_nullable
as String,firstAppearance: null == firstAppearance ? _self.firstAppearance : firstAppearance // ignore: cast_nullable_to_non_nullable
as String,publisher: null == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String,alignment: null == alignment ? _self.alignment : alignment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Work {

 String get occupation; String get base;
/// Create a copy of Work
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkCopyWith<Work> get copyWith => _$WorkCopyWithImpl<Work>(this as Work, _$identity);

  /// Serializes this Work to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Work;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Work&&(identical(other.occupation, _this.occupation) || other.occupation == _this.occupation)&&(identical(other.base, _this.base) || other.base == _this.base));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Work;
  return Object.hash(runtimeType,_this.occupation,_this.base);
}

@override
String toString() {
  final _this = this as Work;
  return 'Work(occupation: ${_this.occupation}, base: ${_this.base})';
}


}

/// @nodoc
abstract mixin class $WorkCopyWith<$Res>  {
  factory $WorkCopyWith(Work value, $Res Function(Work) _then) = _$WorkCopyWithImpl;
@useResult
$Res call({
 String occupation, String base
});




}
/// @nodoc
class _$WorkCopyWithImpl<$Res>
    implements $WorkCopyWith<$Res> {
  _$WorkCopyWithImpl(this._self, this._then);

  final Work _self;
  final $Res Function(Work) _then;

/// Create a copy of Work
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? occupation = null,Object? base = null,}) {
  return _then(Work(
occupation: null == occupation ? _self.occupation : occupation // ignore: cast_nullable_to_non_nullable
as String,base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Work].
extension WorkPatterns on Work {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Work value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Work() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Work value)  $default,){
final _that = this;
switch (_that) {
case _Work():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Work value)?  $default,){
final _that = this;
switch (_that) {
case _Work() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String occupation,  String base)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Work() when $default != null:
return $default(_that.occupation,_that.base);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String occupation,  String base)  $default,) {final _that = this;
switch (_that) {
case _Work():
return $default(_that.occupation,_that.base);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String occupation,  String base)?  $default,) {final _that = this;
switch (_that) {
case _Work() when $default != null:
return $default(_that.occupation,_that.base);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Work implements Work {
  const _Work({this.occupation = '', this.base = ''});
  factory _Work.fromJson(Map<String, dynamic> json) => _$WorkFromJson(json);

@override@JsonKey() final  String occupation;
@override@JsonKey() final  String base;

/// Create a copy of Work
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkCopyWith<_Work> get copyWith => __$WorkCopyWithImpl<_Work>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Work&&(identical(other.occupation, occupation) || other.occupation == occupation)&&(identical(other.base, base) || other.base == base));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,occupation,base);
}

@override
String toString() {
    return 'Work(occupation: $occupation, base: $base)';
}


}

/// @nodoc
abstract mixin class _$WorkCopyWith<$Res> implements $WorkCopyWith<$Res> {
  factory _$WorkCopyWith(_Work value, $Res Function(_Work) _then) = __$WorkCopyWithImpl;
@override @useResult
$Res call({
 String occupation, String base
});




}
/// @nodoc
class __$WorkCopyWithImpl<$Res>
    implements _$WorkCopyWith<$Res> {
  __$WorkCopyWithImpl(this._self, this._then);

  final _Work _self;
  final $Res Function(_Work) _then;

/// Create a copy of Work
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? occupation = null,Object? base = null,}) {
  return _then(_Work(
occupation: null == occupation ? _self.occupation : occupation // ignore: cast_nullable_to_non_nullable
as String,base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Connections {

 String get groupAffiliation; String get relatives;
/// Create a copy of Connections
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionsCopyWith<Connections> get copyWith => _$ConnectionsCopyWithImpl<Connections>(this as Connections, _$identity);

  /// Serializes this Connections to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Connections;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Connections&&(identical(other.groupAffiliation, _this.groupAffiliation) || other.groupAffiliation == _this.groupAffiliation)&&(identical(other.relatives, _this.relatives) || other.relatives == _this.relatives));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Connections;
  return Object.hash(runtimeType,_this.groupAffiliation,_this.relatives);
}

@override
String toString() {
  final _this = this as Connections;
  return 'Connections(groupAffiliation: ${_this.groupAffiliation}, relatives: ${_this.relatives})';
}


}

/// @nodoc
abstract mixin class $ConnectionsCopyWith<$Res>  {
  factory $ConnectionsCopyWith(Connections value, $Res Function(Connections) _then) = _$ConnectionsCopyWithImpl;
@useResult
$Res call({
 String groupAffiliation, String relatives
});




}
/// @nodoc
class _$ConnectionsCopyWithImpl<$Res>
    implements $ConnectionsCopyWith<$Res> {
  _$ConnectionsCopyWithImpl(this._self, this._then);

  final Connections _self;
  final $Res Function(Connections) _then;

/// Create a copy of Connections
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? groupAffiliation = null,Object? relatives = null,}) {
  return _then(Connections(
groupAffiliation: null == groupAffiliation ? _self.groupAffiliation : groupAffiliation // ignore: cast_nullable_to_non_nullable
as String,relatives: null == relatives ? _self.relatives : relatives // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Connections].
extension ConnectionsPatterns on Connections {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Connections value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Connections() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Connections value)  $default,){
final _that = this;
switch (_that) {
case _Connections():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Connections value)?  $default,){
final _that = this;
switch (_that) {
case _Connections() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String groupAffiliation,  String relatives)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Connections() when $default != null:
return $default(_that.groupAffiliation,_that.relatives);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String groupAffiliation,  String relatives)  $default,) {final _that = this;
switch (_that) {
case _Connections():
return $default(_that.groupAffiliation,_that.relatives);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String groupAffiliation,  String relatives)?  $default,) {final _that = this;
switch (_that) {
case _Connections() when $default != null:
return $default(_that.groupAffiliation,_that.relatives);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Connections implements Connections {
  const _Connections({this.groupAffiliation = '', this.relatives = ''});
  factory _Connections.fromJson(Map<String, dynamic> json) => _$ConnectionsFromJson(json);

@override@JsonKey() final  String groupAffiliation;
@override@JsonKey() final  String relatives;

/// Create a copy of Connections
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionsCopyWith<_Connections> get copyWith => __$ConnectionsCopyWithImpl<_Connections>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectionsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Connections&&(identical(other.groupAffiliation, groupAffiliation) || other.groupAffiliation == groupAffiliation)&&(identical(other.relatives, relatives) || other.relatives == relatives));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,groupAffiliation,relatives);
}

@override
String toString() {
    return 'Connections(groupAffiliation: $groupAffiliation, relatives: $relatives)';
}


}

/// @nodoc
abstract mixin class _$ConnectionsCopyWith<$Res> implements $ConnectionsCopyWith<$Res> {
  factory _$ConnectionsCopyWith(_Connections value, $Res Function(_Connections) _then) = __$ConnectionsCopyWithImpl;
@override @useResult
$Res call({
 String groupAffiliation, String relatives
});




}
/// @nodoc
class __$ConnectionsCopyWithImpl<$Res>
    implements _$ConnectionsCopyWith<$Res> {
  __$ConnectionsCopyWithImpl(this._self, this._then);

  final _Connections _self;
  final $Res Function(_Connections) _then;

/// Create a copy of Connections
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? groupAffiliation = null,Object? relatives = null,}) {
  return _then(_Connections(
groupAffiliation: null == groupAffiliation ? _self.groupAffiliation : groupAffiliation // ignore: cast_nullable_to_non_nullable
as String,relatives: null == relatives ? _self.relatives : relatives // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$HeroImages {

 String get xs; String get sm; String get md; String get lg;
/// Create a copy of HeroImages
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HeroImagesCopyWith<HeroImages> get copyWith => _$HeroImagesCopyWithImpl<HeroImages>(this as HeroImages, _$identity);

  /// Serializes this HeroImages to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HeroImages;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HeroImages&&(identical(other.xs, _this.xs) || other.xs == _this.xs)&&(identical(other.sm, _this.sm) || other.sm == _this.sm)&&(identical(other.md, _this.md) || other.md == _this.md)&&(identical(other.lg, _this.lg) || other.lg == _this.lg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HeroImages;
  return Object.hash(runtimeType,_this.xs,_this.sm,_this.md,_this.lg);
}

@override
String toString() {
  final _this = this as HeroImages;
  return 'HeroImages(xs: ${_this.xs}, sm: ${_this.sm}, md: ${_this.md}, lg: ${_this.lg})';
}


}

/// @nodoc
abstract mixin class $HeroImagesCopyWith<$Res>  {
  factory $HeroImagesCopyWith(HeroImages value, $Res Function(HeroImages) _then) = _$HeroImagesCopyWithImpl;
@useResult
$Res call({
 String xs, String sm, String md, String lg
});




}
/// @nodoc
class _$HeroImagesCopyWithImpl<$Res>
    implements $HeroImagesCopyWith<$Res> {
  _$HeroImagesCopyWithImpl(this._self, this._then);

  final HeroImages _self;
  final $Res Function(HeroImages) _then;

/// Create a copy of HeroImages
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? xs = null,Object? sm = null,Object? md = null,Object? lg = null,}) {
  return _then(HeroImages(
xs: null == xs ? _self.xs : xs // ignore: cast_nullable_to_non_nullable
as String,sm: null == sm ? _self.sm : sm // ignore: cast_nullable_to_non_nullable
as String,md: null == md ? _self.md : md // ignore: cast_nullable_to_non_nullable
as String,lg: null == lg ? _self.lg : lg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HeroImages].
extension HeroImagesPatterns on HeroImages {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HeroImages value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HeroImages() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HeroImages value)  $default,){
final _that = this;
switch (_that) {
case _HeroImages():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HeroImages value)?  $default,){
final _that = this;
switch (_that) {
case _HeroImages() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String xs,  String sm,  String md,  String lg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HeroImages() when $default != null:
return $default(_that.xs,_that.sm,_that.md,_that.lg);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String xs,  String sm,  String md,  String lg)  $default,) {final _that = this;
switch (_that) {
case _HeroImages():
return $default(_that.xs,_that.sm,_that.md,_that.lg);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String xs,  String sm,  String md,  String lg)?  $default,) {final _that = this;
switch (_that) {
case _HeroImages() when $default != null:
return $default(_that.xs,_that.sm,_that.md,_that.lg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HeroImages implements HeroImages {
  const _HeroImages({this.xs = '', this.sm = '', this.md = '', this.lg = ''});
  factory _HeroImages.fromJson(Map<String, dynamic> json) => _$HeroImagesFromJson(json);

@override@JsonKey() final  String xs;
@override@JsonKey() final  String sm;
@override@JsonKey() final  String md;
@override@JsonKey() final  String lg;

/// Create a copy of HeroImages
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HeroImagesCopyWith<_HeroImages> get copyWith => __$HeroImagesCopyWithImpl<_HeroImages>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HeroImagesToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HeroImages&&(identical(other.xs, xs) || other.xs == xs)&&(identical(other.sm, sm) || other.sm == sm)&&(identical(other.md, md) || other.md == md)&&(identical(other.lg, lg) || other.lg == lg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,xs,sm,md,lg);
}

@override
String toString() {
    return 'HeroImages(xs: $xs, sm: $sm, md: $md, lg: $lg)';
}


}

/// @nodoc
abstract mixin class _$HeroImagesCopyWith<$Res> implements $HeroImagesCopyWith<$Res> {
  factory _$HeroImagesCopyWith(_HeroImages value, $Res Function(_HeroImages) _then) = __$HeroImagesCopyWithImpl;
@override @useResult
$Res call({
 String xs, String sm, String md, String lg
});




}
/// @nodoc
class __$HeroImagesCopyWithImpl<$Res>
    implements _$HeroImagesCopyWith<$Res> {
  __$HeroImagesCopyWithImpl(this._self, this._then);

  final _HeroImages _self;
  final $Res Function(_HeroImages) _then;

/// Create a copy of HeroImages
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? xs = null,Object? sm = null,Object? md = null,Object? lg = null,}) {
  return _then(_HeroImages(
xs: null == xs ? _self.xs : xs // ignore: cast_nullable_to_non_nullable
as String,sm: null == sm ? _self.sm : sm // ignore: cast_nullable_to_non_nullable
as String,md: null == md ? _self.md : md // ignore: cast_nullable_to_non_nullable
as String,lg: null == lg ? _self.lg : lg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
