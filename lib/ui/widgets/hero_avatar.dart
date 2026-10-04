import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HeroAvatar extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double size;
  final bool isSelected;
  final VoidCallback? onTap;

  const HeroAvatar({
    super.key,
    required this.imageUrl,
    required this.name,
    this.size = 60,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF4FC3F7)
                    : Colors.white.withValues(alpha: 0.2),
                width: isSelected ? 3 : 1,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: const Color(0xFF4FC3F7).withValues(alpha: 0.5),
                        blurRadius: 12,
                        spreadRadius: 2,
                      ),
                    ]
                  : null,
            ),
            child: CircleAvatar(
              radius: size / 2,
              backgroundColor: const Color(0xFF16213E),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Icon(
                    Icons.person,
                    color: const Color(0xFF4FC3F7),
                    size: size * 0.5,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: size + 10,
            child: Text(
              name,
              style: TextStyle(
                color: isSelected ? const Color(0xFF4FC3F7) : Colors.white70,
                fontSize: 10,
                fontWeight:
                    isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
