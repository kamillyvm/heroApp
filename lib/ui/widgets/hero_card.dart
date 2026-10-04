import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide Hero;

import '../../domain/hero.dart';

class HeroCard extends StatelessWidget {
  final Hero hero;
  final VoidCallback? onTap;

  const HeroCard({
    super.key,
    required this.hero,
    this.onTap,
  });

  static const Color _surface = Color(0xFF151515);
  static const Color _pink = Color(0xFFFF0054);
  static const Color _lime = Color(0xFFC8FF00);
  static const Color _lilac = Color(0xFFC45CFF);
  static const Color _secondaryText = Color(0xFF9E9E9E);

  String get _alignmentEmoji {
    switch (hero.biography.alignment) {
      case 'good':
        return '⭐';
      case 'bad':
        return '💀';
      default:
        return '⚡';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFF292929),
            ),
          ),
          child: Row(
            children: [
              _buildImage(),
              Expanded(
                child: _buildInfo(),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 14),
                child: Icon(
                  Icons.chevron_right_rounded,
                  color: _lilac,
                  size: 23,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        bottomLeft: Radius.circular(16),
      ),
      child: CachedNetworkImage(
        imageUrl: hero.images.sm,
        width: 90,
        height: 110,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          width: 90,
          height: 110,
          color: const Color(0xFF202020),
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: _pink,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: 90,
          height: 110,
          color: const Color(0xFF202020),
          child: const Icon(
            Icons.person_rounded,
            color: _pink,
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                _alignmentEmoji,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  hero.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            [
              if (hero.appearance.race.isNotEmpty)
                hero.appearance.race,
              if (hero.appearance.gender.isNotEmpty)
                hero.appearance.gender,
            ].join(' • '),
            style: const TextStyle(
              color: _secondaryText,
              fontSize: 11,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          _buildMiniStats(),
        ],
      ),
    );
  }

  Widget _buildMiniStats() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _miniStat(
          'INT',
          hero.powerstats.intelligence,
          _pink,
        ),
        const SizedBox(width: 12),
        _miniStat(
          'STR',
          hero.powerstats.strength,
          _lime,
        ),
        const SizedBox(width: 12),
        _miniStat(
          'SPD',
          hero.powerstats.speed,
          _lilac,
        ),
      ],
    );
  }

  Widget _miniStat(
    String label,
    int value,
    Color color,
  ) {
    return Column(
      children: [
        Text(
          '$value',
          style: TextStyle(
            color: color,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 1),
        Text(
          label,
          style: const TextStyle(
            color: _secondaryText,
            fontSize: 9,
          ),
        ),
      ],
    );
  }
}