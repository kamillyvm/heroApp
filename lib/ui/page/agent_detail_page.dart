import 'package:flutter/material.dart' hide Hero;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';

import '../../domain/hero.dart';

class AgentDetailPage extends StatefulWidget {
  final Hero hero;

  const AgentDetailPage({super.key, required this.hero});

  @override
  State<AgentDetailPage> createState() => _AgentDetailPageState();
}

class _AgentDetailPageState extends State<AgentDetailPage> {
  static const Color _background = Color(0xFF080808);
  static const Color _primary = Color(0xFFFF0054);
  static const Color _lime = Color(0xFFC8FF00);
  static const Color _lilac = Color(0xFFC45CFF);
  static const Color _card = Color(0xFF151515);
  static const Color _border = Color(0xFF292929);
  static const Color _secondaryText = Color(0xFF9E9E9E);

  @override
  Widget build(BuildContext context) {
    final hero = widget.hero;

    return Scaffold(
      backgroundColor: _background,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(hero),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNameAndBadges(hero),
                  const SizedBox(height: 28),
                  _buildSection(
                    title: 'BIOGRAPHY',
                    icon: Icons.person_outline,
                    child: _buildBiographySection(hero),
                  ),
                  const SizedBox(height: 20),
                  _buildSection(
                    title: 'APPEARANCE',
                    icon: Icons.accessibility_new,
                    child: _buildAppearanceSection(hero),
                  ),
                  const SizedBox(height: 20),
                  _buildSection(
                    title: 'WORK',
                    icon: Icons.work_outline,
                    child: _buildWorkSection(hero),
                  ),
                  const SizedBox(height: 20),
                  _buildSection(
                    title: 'CONNECTIONS',
                    icon: Icons.groups_outlined,
                    child: _buildConnectionsSection(hero),
                  ),
                  const SizedBox(height: 20),
                  _buildSection(
                    title: 'POWERSTATS',
                    icon: Icons.bolt,
                    child: _buildPowerstatsSection(hero),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(Hero hero) {
    return SliverAppBar(
      expandedHeight: 360,
      pinned: true,
      backgroundColor: _background,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _background.withValues(alpha: 0.7),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: _primary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: CachedNetworkImage(
          imageUrl: hero.images.lg,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: _card,
            child: const Center(
              child: CircularProgressIndicator(
                color: _primary,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: _card,
            child: const Icon(
              Icons.broken_image_rounded,
              color: _primary,
              size: 64,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameAndBadges(Hero hero) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hero.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 34,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 8,
          children: [
            _buildBadge(
              label: hero.biography.publisher,
              icon: Icons.public,
              color: _primary,
            ),
            _buildBadge(
              label: _alignmentLabel(hero.biography.alignment),
              icon: _alignmentIcon(hero.biography.alignment),
              color: _alignmentColor(hero.biography.alignment),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBadge({
    required String label,
    required IconData icon,
    required Color color,
  }) {
    if (label.isEmpty || label == '-') {
      return const SizedBox.shrink();
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 14),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Row(
              children: [
                Icon(icon, color: _primary, size: 18),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    color: _primary,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: _border, height: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildBiographySection(Hero hero) {
    final bio = hero.biography;

    final aliases = bio.aliases.isNotEmpty
        ? bio.aliases.join(', ')
        : '-';

    return Column(
      children: [
        _infoRow('Nome Completo', bio.fullName),
        _infoRow('Alter Egos', bio.alterEgos),
        _infoRow('Aliases', aliases),
        _infoRow('Local de Nascimento', bio.placeOfBirth),
        _infoRow('Primeira Aparição', bio.firstAppearance),
        _infoRow('Editora', bio.publisher),
        _infoRow(
          'Alinhamento',
          _alignmentLabel(bio.alignment),
          valueColor: _alignmentColor(bio.alignment),
        ),
      ],
    );
  }

  Widget _buildAppearanceSection(Hero hero) {
    final app = hero.appearance;
    final height = app.height.isNotEmpty ? app.height.join(' / ') : '-';
    final weight = app.weight.isNotEmpty ? app.weight.join(' / ') : '-';
    return Column(
      children: [
        _infoRow('Gênero', app.gender),
        _infoRow('Raça', app.race),
        _infoRow('Altura', height),
        _infoRow('Peso', weight),
        _infoRow('Cor dos Olhos', app.eyeColor),
        _infoRow('Cor do Cabelo', app.hairColor),
      ],
    );
  }

  Widget _buildWorkSection(Hero hero) {
    final work = hero.work;

    return Column(
      children: [
        _infoRow('Ocupação', work.occupation),
        _infoRow('Base', work.base),
      ],
    );
  }

  Widget _buildConnectionsSection(Hero hero) {
    final connections = hero.connections;

    return Column(
      children: [
        _infoRow('Afiliação', connections.groupAffiliation),
        _infoRow('Parentes', connections.relatives),
      ],
    );
  }

  Widget _infoRow(String label, String value, {Color? valueColor}) {
    final displayValue = (value.isEmpty || value == '-') ? 'Desconhecido' : value;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              label,
              style: TextStyle(
                color: _secondaryText,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              displayValue,
              style: TextStyle(
                color: valueColor ?? Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPowerstatsSection(Hero hero) {
    final stats = hero.powerstats;

    final segments = <_StatDefinition>[
      _StatDefinition('Inteligência', stats.intelligence, _primary, ),
      _StatDefinition('Força', stats.strength, _lime, ),
      _StatDefinition('Velocidade', stats.speed, _lilac, ),
      _StatDefinition('Durabilidade', stats.durability, _primary, ),
      _StatDefinition('Poder', stats.power, _lime, ),
      _StatDefinition('Combate', stats.combat, _lilac, ),
    ];

    return Column(
      children: segments.map((stat) => _buildStatRow(stat)).toList(),
    );
  }

  Widget _buildStatRow(_StatDefinition stat) {
    final value = stat.value.clamp(0, 100);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stat.label,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '$value',
                style: TextStyle(
                  color: stat.color,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          PrimerProgressBar(
            segments: [
              Segment(
                value: value,
                color: stat.color,
                label: Text(
                  stat.label,
                  style: const TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─── Alignment helpers ────────────────────────────────────────────────────

  String _alignmentLabel(String alignment) {
    switch (alignment.toLowerCase()) {
      case 'good':
        return 'Herói';
      case 'bad':
        return 'Vilão';
      case 'neutral':
        return 'Neutro';
      default:
        return alignment.isNotEmpty ? alignment : 'Desconhecido';
    }
  }

  Color _alignmentColor(String alignment) {
    switch (alignment.toLowerCase()) {
      case 'good':
        return const Color(0xFF66BB6A);
      case 'bad':
        return const Color(0xFFEF5350);
      case 'neutral':
        return const Color(0xFFFFCA28);
      default:
        return Colors.grey;
    }
  }

  IconData _alignmentIcon(String alignment) {
    switch (alignment.toLowerCase()) {
      case 'good':
        return Icons.shield_outlined;
      case 'bad':
        return Icons.bolt;
      case 'neutral':
        return Icons.balance;
      default:
        return Icons.help_outline;
    }
  }
}

/// Simple data holder for a powerstat row.
class _StatDefinition {
  final String label;
  final int value;
  final Color color;

  const _StatDefinition(this.label, this.value, this.color);
}
