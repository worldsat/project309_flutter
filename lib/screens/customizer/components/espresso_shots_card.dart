import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class EspressoShotsCard extends StatelessWidget {
  final int shots;
  final String shotDescription;
  final ValueChanged<int> onAdjustShots;

  const EspressoShotsCard({
    super.key,
    required this.shots,
    required this.shotDescription,
    required this.onAdjustShots,
  });

  @override
  Widget build(BuildContext context) {
    final bool canMinus = shots > 1;
    final bool canPlus = shots < 4;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: kSandSurfaceContainerLow,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left icon + titles
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: kCaramelSecondaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.coffee_maker_outlined,
                        color: kEspressoPrimary,
                        size: 24,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Espresso Shots',
                          style: BrewCraftTypography.titleSmall.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kEspressoPrimary,
                          ),
                        ),
                        Text(
                          shotDescription,
                          style: BrewCraftTypography.bodySmall.copyWith(
                            color: kSandOnSurfaceVariant,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Right Stepper
            Container(
              decoration: const BoxDecoration(
                color: kSandSurfaceContainerHigh,
                borderRadius: BrewCraftShapes.pill,
              ),
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Minus button
                  GestureDetector(
                    onTap: canMinus ? () => onAdjustShots(-1) : null,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: canMinus ? kSandSurfaceContainerLowest : kSandSurfaceContainerHigh,
                        shape: BoxShape.circle,
                        boxShadow: canMinus
                            ? [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.08),
                                  blurRadius: 2,
                                  offset: const Offset(0, 1),
                                ),
                              ]
                            : null,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.remove,
                          color: canMinus
                              ? kEspressoPrimary
                              : kSandOnSurfaceVariant.withValues(alpha: 0.4),
                          size: 16,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '$shots ${shots == 1 ? "Shot" : "Shots"}',
                      style: BrewCraftTypography.labelLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kEspressoPrimary,
                      ),
                    ),
                  ),

                  // Plus button
                  GestureDetector(
                    onTap: canPlus ? () => onAdjustShots(1) : null,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: canPlus ? kSandSurfaceContainerLowest : kSandSurfaceContainerHigh,
                        shape: BoxShape.circle,
                        boxShadow: canPlus
                            ? [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.08),
                                  blurRadius: 2,
                                  offset: const Offset(0, 1),
                                ),
                              ]
                            : null,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: canPlus
                              ? kEspressoPrimary
                              : kSandOnSurfaceVariant.withValues(alpha: 0.4),
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
