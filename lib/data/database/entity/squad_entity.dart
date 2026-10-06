class SquadEntity {
  final int heroId;
  final String heroName;
  final String imageMd;
  final int intelligence;
  final int strength;
  final int speed;
  final int durability;
  final int power;
  final int combat;
  final int recruitedAt;

  const SquadEntity({
    required this.heroId,
    required this.heroName,
    required this.imageMd,
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
    required this.recruitedAt,
  });

  static const String tableName = 'squad';

  static const String createTableSql = '''
    CREATE TABLE IF NOT EXISTS $tableName (
      heroId INTEGER PRIMARY KEY,
      heroName TEXT NOT NULL,
      imageMd TEXT DEFAULT '',
      intelligence INTEGER DEFAULT 0,
      strength INTEGER DEFAULT 0,
      speed INTEGER DEFAULT 0,
      durability INTEGER DEFAULT 0,
      power INTEGER DEFAULT 0,
      combat INTEGER DEFAULT 0,
      recruitedAt INTEGER NOT NULL
    )
  ''';

  Map<String, dynamic> toMap() {
    return {
      'heroId': heroId,
      'heroName': heroName,
      'imageMd': imageMd,
      'intelligence': intelligence,
      'strength': strength,
      'speed': speed,
      'durability': durability,
      'power': power,
      'combat': combat,
      'recruitedAt': recruitedAt,
    };
  }

  factory SquadEntity.fromMap(Map<String, dynamic> map) {
    return SquadEntity(
      heroId: map['heroId'] as int,
      heroName: map['heroName'] as String,
      imageMd: map['imageMd'] as String? ?? '',
      intelligence: map['intelligence'] as int? ?? 0,
      strength: map['strength'] as int? ?? 0,
      speed: map['speed'] as int? ?? 0,
      durability: map['durability'] as int? ?? 0,
      power: map['power'] as int? ?? 0,
      combat: map['combat'] as int? ?? 0,
      recruitedAt: map['recruitedAt'] as int,
    );
  }
}
