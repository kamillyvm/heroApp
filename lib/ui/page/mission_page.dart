import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide Hero;
import 'package:provider/provider.dart';

import '../../data/repository/hero_repository_impl.dart';
import '../../domain/hero.dart';
import '../widgets/hero_avatar.dart';

// ─── Mission data model ───────────────────────────────────────────────────────

class MissionRound {
  final String attribute;
  final Hero enemy;

  const MissionRound({required this.attribute, required this.enemy});
}

class RoundResult {
  final String attribute;
  final Hero hero;
  final Hero enemy;
  final int heroValue;
  final int enemyValue;
  final String outcome; // 'win' | 'loss' | 'draw'

  const RoundResult({
    required this.attribute,
    required this.hero,
    required this.enemy,
    required this.heroValue,
    required this.enemyValue,
    required this.outcome,
  });
}

// ─── Mission Page ─────────────────────────────────────────────────────────────

class MissionPage extends StatefulWidget {
  const MissionPage({super.key});

  @override
  State<MissionPage> createState() => _MissionPageState();
}

class _MissionPageState extends State<MissionPage> {
  static const Color _background = Color(0xFF080808);
  static const Color _surface = Color(0xFF151515);
  static const Color _primary = Color(0xFFFF0054);
  static const Color _lime = Color(0xFFC8FF00);
  static const Color _lilac = Color(0xFFC45CFF);
  static const Color _border = Color(0xFF292929);
  static const Color _secondaryText = Color(0xFF9E9E9E);

  late final HeroRepositoryImpl _repo;

  // Loading state
  bool _loading = true;
  String _loadingMsg = 'Preparando missão...';

  // Data
  List<Hero> _squad = [];
  List<Hero> _allHeroes = [];

  // Mission state
  bool _missionStarted = false;
  List<MissionRound> _rounds = [];
  int _currentRoundIndex = 0;
  List<RoundResult> _results = [];
  Set<int> _usedHeroIds = {};

  // Current round selection
  Hero? _selectedHero;

  static const List<String> _attributes = [
    'intelligence',
    'strength',
    'speed',
    'combat',
    'durability',
    'power',
  ];

  @override
  void initState() {
    super.initState();
    _repo = context.read<HeroRepositoryImpl>();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _loading = true;
      _loadingMsg = 'Carregando esquadrão...';
    });
    try {
      final squad = await _repo.getSquad();
      setState(() {
        _loadingMsg = 'Carregando catálogo de inimigos...';
      });
      final allHeroes = await _repo.getAllCachedHeroes();
      setState(() {
        _squad = squad;
        _allHeroes = allHeroes;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
      });
      debugPrint('Erro ao carregar dados: $e');
    }
  }

  void _startMission() {
    final random = Random();
    final squadIds = _squad.map((h) => h.id).toSet();

    // Enemies: heroes NOT in squad
    final enemies = _allHeroes.where((h) => !squadIds.contains(h.id)).toList();
    if (enemies.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não há inimigos disponíveis!')),
      );
      return;
    }

    // 3–5 rounds
    final roundCount = 3 + random.nextInt(3);
    enemies.shuffle(random);

    final rounds = List.generate(roundCount, (i) {
      final attribute = _attributes[random.nextInt(_attributes.length)];
      final enemy = enemies[i % enemies.length];
      return MissionRound(attribute: attribute, enemy: enemy);
    });

    setState(() {
      _rounds = rounds;
      _currentRoundIndex = 0;
      _results = [];
      _usedHeroIds = {};
      _selectedHero = null;
      _missionStarted = true;
    });
  }

  int _getStatValue(Hero hero, String attribute) {
    switch (attribute) {
      case 'intelligence':
        return hero.powerstats.intelligence;
      case 'strength':
        return hero.powerstats.strength;
      case 'speed':
        return hero.powerstats.speed;
      case 'durability':
        return hero.powerstats.durability;
      case 'power':
        return hero.powerstats.power;
      case 'combat':
        return hero.powerstats.combat;
      default:
        return 0;
    }
  }

  String _attributeLabel(String attr) {
    const labels = {
      'intelligence': 'Inteligência',
      'strength': 'Força',
      'speed': 'Velocidade',
      'durability': 'Durabilidade',
      'power': 'Poder',
      'combat': 'Combate',
    };
    return labels[attr] ?? attr;
  }

  Color _attributeColor(String attr) {
    const colors = {
      'intelligence': _primary,
      'strength': _lime,
      'speed': _lilac,
      'durability': _primary,
      'power': _lime,
      'combat': _lilac,
    };

    return colors[attr] ?? Colors.white;
  }

  void _confirmRound() {
    final hero = _selectedHero;
    if (hero == null) return;

    final round = _rounds[_currentRoundIndex];
    final heroValue = _getStatValue(hero, round.attribute);
    final enemyValue = _getStatValue(round.enemy, round.attribute);

    String outcome;
    if (heroValue > enemyValue) {
      outcome = 'win';
    } else if (heroValue < enemyValue) {
      outcome = 'loss';
    } else {
      outcome = 'draw';
    }

    final result = RoundResult(
      attribute: round.attribute,
      hero: hero,
      enemy: round.enemy,
      heroValue: heroValue,
      enemyValue: enemyValue,
      outcome: outcome,
    );

    final newResults = [..._results, result];
    final newUsed = <int>{..._usedHeroIds, hero.id};
    final nextIndex = _currentRoundIndex + 1;

    setState(() {
      _results = newResults;
      _usedHeroIds = newUsed;
      _currentRoundIndex = nextIndex;
      _selectedHero = null;
    });

    // Show round result briefly then advance
    _showRoundResultDialog(result, () {
      if (nextIndex >= _rounds.length) {
        _finishMission(newResults);
      }
    });
  }

  Future<void> _showRoundResultDialog(
    RoundResult result,
    VoidCallback onClose,
  ) async {
    final isWin = result.outcome == 'win';
    final isDraw = result.outcome == 'draw';

    AwesomeDialog(
      context: context,
      dialogType: isWin
          ? DialogType.success
          : isDraw
              ? DialogType.info
              : DialogType.error,
      animType: AnimType.scale,
      title: isWin
          ? '⚡ VITÓRIA!'
          : isDraw
              ? '⚖️ EMPATE TÁTICO'
              : '💥 DERROTA',
      desc:
          '${result.hero.name} (${result.heroValue}) vs '
          '${result.enemy.name} (${result.enemyValue})\n'
          'Atributo: ${_attributeLabel(result.attribute)}',
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
    ).show();

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    Navigator.of(context, rootNavigator: true).pop();

    await Future.delayed(const Duration(milliseconds: 300));

    if (!mounted) return;

    onClose();
  }

  void _finishMission(List<RoundResult> results) async {
    final wins = results.where((r) => r.outcome == 'win').length;
    final losses = results.where((r) => r.outcome == 'loss').length;
    final total = results.length;
    final isSuccess = wins > total / 2;

    if (isSuccess) {
      // Give +1 to a random powerstat of a random winning hero
      final winningResults = results.where((r) => r.outcome == 'win').toList();
      if (winningResults.isNotEmpty) {
        final random = Random();
        final luckyResult = winningResults[random.nextInt(winningResults.length)];
        final statsToBoost = ['intelligence', 'strength', 'speed', 'durability', 'power', 'combat'];
        final statKey = statsToBoost[random.nextInt(statsToBoost.length)];
        final currentValue = _getStatValue(luckyResult.hero, statKey);
        final newValue = (currentValue + 1).clamp(0, 100);

        try {
          await _repo.updateHeroPowerstat(
            heroId: luckyResult.hero.id,
            powerstat: statKey,
            newValue: newValue,
          );
        } catch (_) {}

        if (!mounted) return;
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.scale,
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: luckyResult.hero.images.lg.isNotEmpty
                      ? luckyResult.hero.images.lg
                      : luckyResult.hero.images.md,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Icon(
                    Icons.person,
                    size: 100,
                    color: Color(0xFF66BB6A),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                '🏆 MISSÃO CUMPRIDA!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Vitórias: $wins | Derrotas: $losses\n\n'
                '⚡ ${luckyResult.hero.name} ganhou +1 em ${_attributeLabel(statKey)}!',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          btnOkText: 'Finalizar',
          btnOkOnPress: () {
            setState(() => _missionStarted = false);
          },
          btnOkColor: const Color(0xFF66BB6A),
          dismissOnTouchOutside: false,
        ).show();
      }
    } else {
      if (!mounted) return;
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/mission_failed.png',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '💀 OPERAÇÃO FRACASSADA!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Vitórias: $wins | Derrotas: $losses\n\n'
              'Seu esquadrão precisa treinar mais!',
              textAlign: TextAlign.center,
            ),
          ],
        ),
        btnOkText: 'Retirar',
        btnOkOnPress: () {
          setState(() => _missionStarted = false);
        },
        btnOkColor: const Color(0xFFEF5350),
        dismissOnTouchOutside: false,
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        backgroundColor: _background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(color: _primary,),
              const SizedBox(height: 16),
              Text(_loadingMsg, style: const TextStyle(color: _secondaryText)),
            ],
          ),
        ),
      );
    }

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
        title: const Row(
          children: [
            Icon(
              Icons.flash_on_rounded,
              color: _primary,
              size: 22,
            ),
            SizedBox(width: 8),
            Text(
              'MISSÕES',
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
      body: _missionStarted ? _buildMissionActive() : _buildMissionLobby(),
    );
  }

  // ── LOBBY ──────────────────────────────────────────────────────────────────

  Widget _buildMissionLobby() {
    final canStart = _squad.length >= 5;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: _surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _border,
              ),
            ),
            child: Column(
              children: [
                const Icon(Icons.flash_on, color: _primary, size: 48),
                const SizedBox(height: 12),
                const Text(
                  'CENTRAL TÁTICA',
                  style: TextStyle(
                    color: _primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Escale seu esquadrão para enfrentar\ndesafios épicos em ${3}–${5} rounds de combate.',
                  style: const TextStyle(color: _secondaryText, fontSize: 13),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Squad status
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: canStart
                    ? const Color(0xFF66BB6A).withValues(alpha: 0.4)
                    : const Color(0xFFEF5350).withValues(alpha: 0.4),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  canStart ? Icons.check_circle : Icons.warning,
                  color: canStart ? const Color(0xFF66BB6A) : const Color(0xFFEF5350),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Esquadrão: ${_squad.length} agente(s)',
                        style: TextStyle(
                          color: canStart ? const Color(0xFF66BB6A) : const Color(0xFFEF5350),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (!canStart)
                        const Text(
                          'Mínimo de 5 agentes para iniciar uma missão',
                          style: TextStyle(color: _secondaryText, fontSize: 12),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Squad mini avatars
          if (_squad.isNotEmpty) ...[
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'SEU TIME',
                style: TextStyle(
                  color: _lilac,
                  fontSize: 11,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: _squad.map((h) => HeroAvatar(
                imageUrl: h.images.md,
                name: h.name,
                size: 52,
              )).toList(),
            ),
            const SizedBox(height: 24),
          ],

          // Mission rules
          _buildRulesCard(),
          const SizedBox(height: 24),

          // Start button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: canStart ? _startMission : null,
              icon: const Icon(Icons.play_arrow),
              label: const Text(
                'INICIAR MISSÃO',
                style: TextStyle(fontSize: 16, letterSpacing: 1, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: _primary,
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.white12,
                disabledForegroundColor: Colors.white30,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRulesCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _surface,),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'REGRAS DE COMBATE',
            style: TextStyle(
              color: _lilac,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 12),
          _rule('1', '3 a 5 rounds por missão'),
          _rule('2', 'Cada round possui um atributo aleatório'),
          _rule('3', 'Cada agente só pode ser usado 1x por missão'),
          _rule('4', 'Vitória: maioria dos rounds vencidos'),
          _rule('5', 'Missão cumprida: herói ganha +1 em powerstat aleatório'),
        ],
      ),
    );
  }

  Widget _rule(String emoji, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  // ── ACTIVE MISSION ─────────────────────────────────────────────────────────

  Widget _buildMissionActive() {
    if (_currentRoundIndex >= _rounds.length) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFFEF5350)),
      );
    }

    final round = _rounds[_currentRoundIndex];
    final availableHeroes = _squad.where((h) => !_usedHeroIds.contains(h.id)).toList();
    final wins = _results.where((r) => r.outcome == 'win').length;
    final losses = _results.where((r) => r.outcome == 'loss').length;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Round indicator + scoreboard
          _buildRoundHeader(wins, losses),
          const SizedBox(height: 16),

          // Enemy card
          _buildEnemyCard(round),
          const SizedBox(height: 20),

          // Attribute in dispute
          _buildAttributeBadge(round.attribute),
          const SizedBox(height: 20),

          // Hero selection grid
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'ESCOLHA SEU AGENTE',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildHeroGrid(availableHeroes, round.attribute),
          const SizedBox(height: 20),

          // Confirm button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _selectedHero != null ? _confirmRound : null,
              icon: const Icon(Icons.bolt),
              label: Text(
                _selectedHero != null
                    ? 'ENVIAR ${_selectedHero!.name.toUpperCase()}'
                    : 'SELECIONE UM AGENTE',
                style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: _primary,
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.white12,
                disabledForegroundColor: Colors.white30,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoundHeader(int wins, int losses) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: _surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _border),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ROUND ${_currentRoundIndex + 1}/${_rounds.length}',
            style: const TextStyle(
              color: _primary,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: 1,
            ),
          ),
          Row(
            children: [
              const Icon(Icons.check, color: Color(0xFF66BB6A), size: 16),
              Text(' $wins', style: const TextStyle(color: Color(0xFF66BB6A), fontWeight: FontWeight.bold)),
              const SizedBox(width: 12),
              const Icon(Icons.close, color: Color(0xFFEF5350), size: 16),
              Text(' $losses', style: const TextStyle(color: Color(0xFFEF5350), fontWeight: FontWeight.bold)),
            ],
          ),
          // Progress dots
          Row(
            children: List.generate(_rounds.length, (i) {
              Color color;
              if (i < _results.length) {
                color = _results[i].outcome == 'win'
                    ? const Color(0xFF66BB6A)
                    : _results[i].outcome == 'draw'
                        ? const Color(0xFF4FC3F7)
                        : const Color(0xFFEF5350);
              } else if (i == _currentRoundIndex) {
                color = _lilac;
              } else {
                color = Colors.white12;
              }
              return Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildEnemyCard(MissionRound round) {
    return Container(
      decoration: BoxDecoration(
        color: _surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _primary,
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
              imageUrl: round.enemy.images.md,
              width: 100,
              height: 130,
              fit: BoxFit.cover,
              errorWidget: (ctx, url, err) => Container(
                width: 100,
                height: 130,
                color: const Color(0xFF202020),
                child: const Icon(Icons.person, color: _primary, size: 50),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFF202020),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: _border),
                    ),
                    child: const Text(
                      '⚠️ INIMIGO DA RODADA',
                      style: TextStyle(
                        color: _primary,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    round.enemy.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '??? Atributos Ocultos',
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttributeBadge(String attribute) {
    final color = _attributeColor(attribute);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: _surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color,
        ),
      ),
      child: Column(
        children: [
          const Text(
            'ATRIBUTO EM DISPUTA',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 11,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _attributeLabel(attribute).toUpperCase(),
            style: TextStyle(
              color: color,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroGrid(List<Hero> heroes, String attribute) {
    if (heroes.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Todos os agentes foram usados nesta missão!',
          style: TextStyle(color: Colors.white54),
          textAlign: TextAlign.center,
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.75,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: heroes.length,
      itemBuilder: (context, index) {
        final hero = heroes[index];
        final isSelected = _selectedHero?.id == hero.id;

        return GestureDetector(
          onTap: () => setState(() => _selectedHero = hero),
          child: Container(
            decoration: BoxDecoration(
              color: _surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? _lilac : _border,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: CachedNetworkImage(
                        imageUrl: hero.images.md,
                        fit: BoxFit.cover,
                        errorWidget: (ctx, url, err) => Container(
                          color: const Color(0xFF16213E),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white38,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    hero.name,
                    style: TextStyle(
                      color: isSelected ? _lilac : Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}