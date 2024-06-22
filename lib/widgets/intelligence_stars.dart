import 'package:flutter/material.dart';

class IntelligenceStars extends StatelessWidget {
  final int intelligenceLevel;

  const IntelligenceStars({super.key, required this.intelligenceLevel});

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];
    const double starSize = 20.0;
    const Color starColor = Colors.amber;

    for (int i = 0; i < intelligenceLevel; i++) {
      stars.add(
        const Icon(Icons.star, size: starSize, color: starColor),
      );
    }

    for (int i = intelligenceLevel; i < 5; i++) {
      stars.add(
        const Icon(Icons.star_border, size: starSize, color: starColor),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }
}