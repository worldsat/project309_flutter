import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class AtmosphereVisualCard extends StatelessWidget {
  const AtmosphereVisualCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Container(
        height: 128.0,
        decoration: BoxDecoration(
          borderRadius: BrewCraftShapes.medium,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BrewCraftShapes.medium,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/banner.jpg',
                fit: BoxFit.cover,
              ),

              // Gradient overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      kEspressoPrimary.withValues(alpha: 0.3),
                      kEspressoPrimary.withValues(alpha: 0.85),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    const Icon(
                      Icons.coffee_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Roasted fresh this morning in-house',
                      style: BrewCraftTypography.titleSmall.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
