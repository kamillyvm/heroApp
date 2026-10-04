import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide Hero;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repository/hero_repository_impl.dart';
import '../../domain/hero.dart';

class DailyContractPage extends StatefulWidget {
  const DailyContractPage({super.key});

  @override
  State<DailyContractPage> createState() => _DailyContractPageState();
}

class _DailyContractPageState extends State<DailyContractPage> {
  static const _keyLastDrawDate = 'daily_contract_date';
  static const _keyDailyHeroId = 'daily_hero_id';

  static const Color _background = Color(0xFF080808);
  static const Color _surface = Color(0xFF151515);
  static const Color _primary = Color(0xFFFF0054);
  static const Color _lime = Color(0xFFC8FF00);
  static const Color _lilac = Color(0xFFC45CFF);
  static const Color _border = Color(0xFF292929);
  static const Color _secondaryText = Color(0xFF9E9E9E);

  late final HeroRepositoryImpl _repo;
  Hero? _dailyHero;
  bool _loading = true;
  bool _alreadyInSquad = false;
  bool _squadFull = false;
  bool _isRecruiting = false;
  String _statusMessage = '';

  @override
  void initState() {
    super.initState();
    _repo = context.read<HeroRepositoryImpl>();
    _loadDailyHero();
  }

  String _todayKey() {
    final now = DateTime.now();
    return '${now.year}-${now.month}-${now.day}';
  }

  Future<void> _loadDailyHero() async {
    setState(() => _loading = true);

    try {
      final prefs = await SharedPreferences.getInstance();
      final lastDate = prefs.getString(_keyLastDrawDate) ?? '';
      final today = _todayKey();

      Hero? hero;

      if (lastDate == today) {
        // Same day - load the same hero
        final savedId = prefs.getInt(_keyDailyHeroId);

        if (savedId != null) {
          try {
            hero = await _repo.getHeroById(savedId);
          } catch (_) {
            hero = await _repo.getRandomHeroForDaily();
          }
        }
      }

      if (hero == null) {
        // New day or first time - draw a new hero
        hero = await _repo.getRandomHeroForDaily();

        if (hero != null) {
          await prefs.setString(_keyLastDrawDate, today);
          await prefs.setInt(_keyDailyHeroId, hero.id);
        }
      }

      if (hero != null && mounted) {
        final inSquad = await _repo.isInSquad(hero.id);
        final squadFull = await _repo.isSquadFull();

        setState(() {
          _dailyHero = hero;
          _alreadyInSquad = inSquad;
          _squadFull = squadFull;
          _loading = false;
        });
      } else {
        if (mounted) {
          setState(() => _loading = false);
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _loading = false;
          _statusMessage = 'Erro ao carregar contrato: $e';
        });
      }
    }
  }

  Future<void> _recruitHero() async {
    final hero = _dailyHero;

    if (hero == null) return;

    setState(() => _isRecruiting = true);

    try {
      await _repo.addToSquad(hero);

      setState(() {
        _alreadyInSquad = true;
        _isRecruiting = false;
      });

      if (!mounted) return;

      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.scale,
        title: 'Agente Recrutado!',
        desc: '${hero.name} agora faz parte do seu esquadrão.',
        btnOkText: 'Excelente!',
        btnOkOnPress: () {},
        btnOkColor: _primary,
      ).show();
    } catch (e) {
      setState(() => _isRecruiting = false);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao recrutar: $e'),
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
        title: const Row(
          children: [
            Icon(
              Icons.today_rounded,
              color: _lime,
              size: 22,
            ),
            SizedBox(width: 9),
            Text(
              'CONTRATO DIÁRIO',
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
      body: _loading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: _lime,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Sorteando agente do dia...',
                    style: TextStyle(
                      color: _secondaryText,
                    ),
                  ),
                ],
              ),
            )
          : _dailyHero == null
              ? _buildError()
              : _buildContract(),
    );
  }

  Widget _buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Color(0xFFEF5350),
            size: 64,
          ),
          const SizedBox(height: 16),
          const Text(
            'Falha no contrato',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _statusMessage,
            style: const TextStyle(
              color: Colors.white54,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _loadDailyHero,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4FC3F7),
            ),
            child: const Text(
              'Tentar novamente',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContract() {
    final hero = _dailyHero!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Top badge
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: _surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _border,
              ),
            ),
            child: Text(
              '📅 AGENTE DISPONÍVEL HOJE — ${_todayKey()}',
              style: const TextStyle(
                color: _lime,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Hero card
          Container(
            decoration: BoxDecoration(
              color: _surface,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: _border,
              ),
            ),
            child: Column(
              children: [
                // Hero image
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: hero.images.md,
                    width: double.infinity,
                    height: 280,
                    fit: BoxFit.cover,
                    errorWidget: (ctx, url, err) => Container(
                      height: 280,
                      color: const Color(0xFF202020),
                      child: const Icon(
                        Icons.person,
                        color: _primary,
                        size: 120,
                      ),
                    ),
                  ),
                ),

                // Info
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        hero.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      _buildPowerstatsGrid(hero),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Action buttons
          if (_alreadyInSquad)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF66BB6A)
                    .withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF66BB6A)
                      .withValues(alpha: 0.4),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Color(0xFF66BB6A),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Já está no seu Esquadrão!',
                    style: TextStyle(
                      color: Color(0xFF66BB6A),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          else if (_squadFull)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFEF5350)
                    .withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFEF5350)
                      .withValues(alpha: 0.4),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.block,
                    color: Color(0xFFEF5350),
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Esquadrão Cheio! (15/15)\n'
                      'Dispense um agente para recrutar.',
                      style: TextStyle(
                        color: Color(0xFFEF5350),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )
          else
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _isRecruiting ? null : _recruitHero,
                icon: _isRecruiting
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.add_circle),
                label: Text(
                  _isRecruiting
                      ? 'Recrutando...'
                      : 'RECRUTAR PARA O ESQUADRÃO',
                  style: const TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
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

  Widget _buildPowerstatsGrid(Hero hero) {
    final stats = [
      ('INT', hero.powerstats.intelligence, _primary),
      ('STR', hero.powerstats.strength, _lime),
      ('SPD', hero.powerstats.speed, _lilac),
      ('DUR', hero.powerstats.durability, _primary),
      ('POW', hero.powerstats.power, _lime),
      ('CMB', hero.powerstats.combat, _lilac),
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: stats.map((s) {
        final (label, value, color) = s;

        return Container(
          width: 70,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF202020),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _border,
            ),
          ),
          child: Column(
            children: [
              Text(
                '$value',
                style: TextStyle(
                  color: color,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  color: color.withValues(alpha: 0.7),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}