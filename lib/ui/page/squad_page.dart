import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide Hero;
import 'package:provider/provider.dart';

import '../../data/repository/hero_repository_impl.dart';
import '../../domain/hero.dart';

class SquadPage extends StatefulWidget {
  const SquadPage({super.key});

  @override
  State<SquadPage> createState() => _SquadPageState();
}

class _SquadPageState extends State<SquadPage> {
  static const Color _background = Color(0xFF080808);
  static const Color _surface = Color(0xFF151515);
  static const Color _primary = Color(0xFFFF0054);
  static const Color _lime = Color(0xFFC8FF00);
  static const Color _lilac = Color(0xFFC45CFF);
  static const Color _border = Color(0xFF292929);
  static const Color _secondaryText = Color(0xFF9E9E9E);

  late final HeroRepositoryImpl _repo;

  List<Hero> _squad = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _repo = context.read<HeroRepositoryImpl>();
    _loadSquad();
  }

  Future<void> _loadSquad() async {
    setState(() => _loading = true);

    try {
      final squad = await _repo.getSquad();

      setState(() {
        _squad = squad;
        _loading = false;
      });
    } catch (e) {
      setState(() => _loading = false);
    }
  }

  String _topAttributeLabel(Hero hero) {
    final stats = {
      'Inteligência': hero.powerstats.intelligence,
      'Força': hero.powerstats.strength,
      'Velocidade': hero.powerstats.speed,
      'Durabilidade': hero.powerstats.durability,
      'Poder': hero.powerstats.power,
      'Combate': hero.powerstats.combat,
    };

    return stats.entries
        .reduce((a, b) => a.value > b.value ? a : b)
        .key;
  }

  void _navigateToDetail(Hero hero) async {
    try {
      final fullHero = await _repo.getHeroById(hero.id);

      final heroWithUpdatedStats = fullHero.copyWith(
        powerstats: hero.powerstats,
      );

      if (!mounted) return;

      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => SquadAgentDetailPage(
            hero: heroWithUpdatedStats,
            onDismiss: _loadSquad,
          ),
        ),
      );
    } catch (_) {
      if (!mounted) return;

      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => SquadAgentDetailPage(
            hero: hero,
            onDismiss: _loadSquad,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      appBar: AppBar(
        backgroundColor: _background,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        shape: const Border(
          bottom: BorderSide(
            color: _border,
            width: 1,
          ),
        ),
        title: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.shield_rounded,
                color: _lilac,
                size: 22,
              ),
              SizedBox(width: 8),
              Text(
                'MEU ESQUADRÃO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(right: 4),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: _surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _border,
                ),
              ),
              child: Text(
                '${_squad.length}/15',
                style: const TextStyle(
                  color: _lime,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.refresh_rounded,
              color: _lilac,
            ),
            onPressed: _loadSquad,
          ),
        ],
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(
                color: _lilac,
              ),
            )
          : _squad.isEmpty
              ? _buildEmptySquad()
              : _buildSquadList(),
    );
  }

  Widget _buildEmptySquad() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shield_outlined,
              size: 80,
              color: _lilac,
            ),
            const SizedBox(height: 16),
            const Text(
              'Esquadrão Vazio',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Recrute heróis pelo Contrato Diário',
              style: TextStyle(
                color: _secondaryText,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSquadList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: _squad.length,
      itemBuilder: (context, index) {
        final hero = _squad[index];
        return _buildSquadCard(hero);
      },
    );
  }

  Widget _buildSquadCard(Hero hero) {
    return GestureDetector(
      onTap: () => _navigateToDetail(hero),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: _surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _border,
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: CachedNetworkImage(
                imageUrl: hero.images.md,
                width: 80,
                height: 100,
                fit: BoxFit.cover,
                errorWidget: (ctx, url, err) => Container(
                  width: 80,
                  height: 100,
                  color: const Color(0xFF202020),
                  child: const Icon(
                    Icons.person,
                    color: _primary,
                    size: 40,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hero.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF202020),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _border,
                        ),
                      ),
                      child: Text(
                        '⚡ ${_topAttributeLabel(hero)}',
                        style: const TextStyle(
                          color: _lime,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Icon(
                Icons.chevron_right_rounded,
                color: _lilac,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// squad agent detail page

class SquadAgentDetailPage extends StatelessWidget {
  static const Color _background = Color(0xFF080808);
  static const Color _surface = Color(0xFF151515);
  static const Color _primary = Color(0xFFFF0054);
  static const Color _lime = Color(0xFFC8FF00);
  static const Color _lilac = Color(0xFFC45CFF);
  static const Color _border = Color(0xFF292929);
  static const Color _secondaryText = Color(0xFF9E9E9E);

  final Hero hero;
  final VoidCallback? onDismiss;

  const SquadAgentDetailPage({
    super.key,
    required this.hero,
    this.onDismiss,
  });

  String _statLabel(String key) {
    const labels = {
      'intelligence': 'Inteligência',
      'strength': 'Força',
      'speed': 'Velocidade',
      'durability': 'Durabilidade',
      'power': 'Poder',
      'combat': 'Combate',
    };

    return labels[key] ?? key;
  }

  Color _statColor(String key) {
    const colors = {
      'intelligence': _primary,
      'strength': _lime,
      'speed': _lilac,
      'durability': _primary,
      'power': _lime,
      'combat': _lilac,
    };

    return colors[key] ?? Colors.white;
  }

  void _confirmDismiss(BuildContext context) {
    final repo = context.read<HeroRepositoryImpl>();

    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.scale,
      title: 'Dispensar Agente',
      desc:
          'Deseja dispensar ${hero.name} do esquadrão?\n\n'
          'Uma vaga será liberada.',
      btnCancelText: 'Cancelar',
      btnOkText: 'Dispensar',
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        await repo.removeFromSquad(hero.id);

        if (context.mounted) {
          Navigator.pop(context);
          onDismiss?.call();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${hero.name} foi dispensado do esquadrão.',
              ),
              backgroundColor: const Color(0xFFEF5350),
            ),
          );
        }
      },
      btnOkColor: const Color(0xFFEF5350),
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            backgroundColor: _background,
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: hero.images.lg.isNotEmpty
                    ? hero.images.lg
                    : hero.images.md,
                fit: BoxFit.cover,
                errorWidget: (ctx, url, err) => Container(
                  color: _surface,
                  child: const Icon(
                    Icons.person,
                    color: _primary,
                    size: 120,
                  ),
                ),
              ),
              title: Text(
                hero.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(
                    'POWERSTATS',
                    _buildPowerstats(),
                  ),
                  const SizedBox(height: 20),
                  _buildSection(
                    'BIOGRAFIA',
                    _buildBio(),
                  ),
                  const SizedBox(height: 20),
                  _buildSection(
                    'APARÊNCIA',
                    _buildAppearance(),
                  ),
                  const SizedBox(height: 20),
                  _buildSection(
                    'TRABALHO',
                    _buildWork(),
                  ),
                  const SizedBox(height: 20),
                  _buildSection(
                    'CONEXÕES',
                    _buildConnections(),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => _confirmDismiss(context),
                      icon: const Icon(Icons.exit_to_app),
                      label: const Text(
                        'DISPENSAR DO ESQUADRÃO',
                        style: TextStyle(
                          letterSpacing: 1,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFFEF5350),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    String title,
    Widget content,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: _lilac,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 2),
        const Divider(
          color: _border,
          thickness: 1,
        ),
        const SizedBox(height: 12),
        content,
      ],
    );
  }

  Widget _buildPowerstats() {
    final stats = [
      ('intelligence', hero.powerstats.intelligence),
      ('strength', hero.powerstats.strength),
      ('speed', hero.powerstats.speed),
      ('durability', hero.powerstats.durability),
      ('power', hero.powerstats.power),
      ('combat', hero.powerstats.combat),
    ];

    return Column(
      children: stats.map((e) {
        final (key, value) = e;

        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 110,
                child: Text(
                  _statLabel(key),
                  style: TextStyle(
                    color: _statColor(key),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius:
                            BorderRadius.circular(4),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: value / 100,
                      child: Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: _statColor(key),
                          borderRadius:
                              BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '$value',
                style: TextStyle(
                  color: _statColor(key),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBio() {
    return _infoTable([
      if (hero.biography.fullName.isNotEmpty)
        ('Nome Completo', hero.biography.fullName),

      if (hero.biography.alterEgos.isNotEmpty)
        ('Alter Egos', hero.biography.alterEgos),

      if (hero.biography.aliases.isNotEmpty)
        ('Aliases', hero.biography.aliases.join(', ')),

      if (hero.biography.publisher.isNotEmpty)
        ('Editora', hero.biography.publisher),

      if (hero.biography.alignment.isNotEmpty)
        ('Alinhamento', hero.biography.alignment),

      if (hero.biography.placeOfBirth.isNotEmpty)
        ('Nascimento', hero.biography.placeOfBirth),

      if (hero.biography.firstAppearance.isNotEmpty)
        ('1ª Aparição', hero.biography.firstAppearance),
    ]);
  }

  Widget _buildAppearance() {
    return _infoTable([
      if (hero.appearance.gender.isNotEmpty)
        ('Gênero', hero.appearance.gender),

      if (hero.appearance.race.isNotEmpty)
        ('Raça', hero.appearance.race),

      if (hero.appearance.eyeColor.isNotEmpty)
        ('Olhos', hero.appearance.eyeColor),

      if (hero.appearance.hairColor.isNotEmpty)
        ('Cabelo', hero.appearance.hairColor),

      if (hero.appearance.height.length > 1)
        ('Altura', hero.appearance.height[1]),

      if (hero.appearance.weight.length > 1)
        ('Peso', hero.appearance.weight[1]),
    ]);
  }

  Widget _buildWork() {
    return _infoTable([
      if (hero.work.occupation.isNotEmpty)
        ('Ocupação', hero.work.occupation),

      if (hero.work.base.isNotEmpty)
        ('Base', hero.work.base),
    ]);
  }

  Widget _buildConnections() {
    return _infoTable([
      if (hero.connections.groupAffiliation.isNotEmpty)
        ('Afiliação', hero.connections.groupAffiliation),

      if (hero.connections.relatives.isNotEmpty)
        ('Parentes', hero.connections.relatives),
    ]);
  }

  Widget _infoTable(
    List<(String, String)> rows,
  ) {
    return Column(
      children: rows.map((row) {
        final (label, value) = row;

        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 110,
                child: Text(
                  label,
                  style: const TextStyle(
                    color: _secondaryText,
                    fontSize: 13,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}