class HeroEntity {
  final int id;
  final String name;
  final String slug;
  // Powerstats
  final int intelligence;
  final int strength;
  final int speed;
  final int durability;
  final int power;
  final int combat;
  // Appearance
  final String gender;
  final String race;
  final String height;
  final String weight;
  final String eyeColor;
  final String hairColor;
  // Biography
  final String fullName;
  final String alterEgos;
  final String aliases;
  final String placeOfBirth;
  final String firstAppearance;
  final String publisher;
  final String alignment;
  // Work
  final String occupation;
  final String base;
  // Connections
  final String groupAffiliation;
  final String relatives;
  // Images
  final String imageXs;
  final String imageSm;
  final String imageMd;
  final String imageLg;

  const HeroEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
    required this.gender,
    required this.race,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hairColor,
    required this.fullName,
    required this.alterEgos,
    required this.aliases,
    required this.placeOfBirth,
    required this.firstAppearance,
    required this.publisher,
    required this.alignment,
    required this.occupation,
    required this.base,
    required this.groupAffiliation,
    required this.relatives,
    required this.imageXs,
    required this.imageSm,
    required this.imageMd,
    required this.imageLg,
  });

  static const String tableName = 'heroes';

  static const String createTableSql = '''
    CREATE TABLE IF NOT EXISTS $tableName (
      id INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      slug TEXT NOT NULL,
      intelligence INTEGER DEFAULT 0,
      strength INTEGER DEFAULT 0,
      speed INTEGER DEFAULT 0,
      durability INTEGER DEFAULT 0,
      power INTEGER DEFAULT 0,
      combat INTEGER DEFAULT 0,
      gender TEXT DEFAULT 'Unknown',
      race TEXT DEFAULT 'Unknown',
      height TEXT DEFAULT '',
      weight TEXT DEFAULT '',
      eyeColor TEXT DEFAULT 'Unknown',
      hairColor TEXT DEFAULT 'Unknown',
      fullName TEXT DEFAULT '',
      alterEgos TEXT DEFAULT '',
      aliases TEXT DEFAULT '',
      placeOfBirth TEXT DEFAULT 'Unknown',
      firstAppearance TEXT DEFAULT '',
      publisher TEXT DEFAULT 'Unknown',
      alignment TEXT DEFAULT 'neutral',
      occupation TEXT DEFAULT '',
      base TEXT DEFAULT '',
      groupAffiliation TEXT DEFAULT '',
      relatives TEXT DEFAULT '',
      imageXs TEXT DEFAULT '',
      imageSm TEXT DEFAULT '',
      imageMd TEXT DEFAULT '',
      imageLg TEXT DEFAULT ''
    )
  ''';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'intelligence': intelligence,
      'strength': strength,
      'speed': speed,
      'durability': durability,
      'power': power,
      'combat': combat,
      'gender': gender,
      'race': race,
      'height': height,
      'weight': weight,
      'eyeColor': eyeColor,
      'hairColor': hairColor,
      'fullName': fullName,
      'alterEgos': alterEgos,
      'aliases': aliases,
      'placeOfBirth': placeOfBirth,
      'firstAppearance': firstAppearance,
      'publisher': publisher,
      'alignment': alignment,
      'occupation': occupation,
      'base': base,
      'groupAffiliation': groupAffiliation,
      'relatives': relatives,
      'imageXs': imageXs,
      'imageSm': imageSm,
      'imageMd': imageMd,
      'imageLg': imageLg,
    };
  }

  factory HeroEntity.fromMap(Map<String, dynamic> map) {
    return HeroEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      slug: map['slug'] as String,
      intelligence: map['intelligence'] as int? ?? 0,
      strength: map['strength'] as int? ?? 0,
      speed: map['speed'] as int? ?? 0,
      durability: map['durability'] as int? ?? 0,
      power: map['power'] as int? ?? 0,
      combat: map['combat'] as int? ?? 0,
      gender: map['gender'] as String? ?? 'Unknown',
      race: map['race'] as String? ?? 'Unknown',
      height: map['height'] as String? ?? '',
      weight: map['weight'] as String? ?? '',
      eyeColor: map['eyeColor'] as String? ?? 'Unknown',
      hairColor: map['hairColor'] as String? ?? 'Unknown',
      fullName: map['fullName'] as String? ?? '',
      alterEgos: map['alterEgos'] as String? ?? '',
      aliases: map['aliases'] as String? ?? '',
      placeOfBirth: map['placeOfBirth'] as String? ?? 'Unknown',
      firstAppearance: map['firstAppearance'] as String? ?? '',
      publisher: map['publisher'] as String? ?? 'Unknown',
      alignment: map['alignment'] as String? ?? 'neutral',
      occupation: map['occupation'] as String? ?? '',
      base: map['base'] as String? ?? '',
      groupAffiliation: map['groupAffiliation'] as String? ?? '',
      relatives: map['relatives'] as String? ?? '',
      imageXs: map['imageXs'] as String? ?? '',
      imageSm: map['imageSm'] as String? ?? '',
      imageMd: map['imageMd'] as String? ?? '',
      imageLg: map['imageLg'] as String? ?? '',
    );
  }
}
