import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class BrewCraftClubCard extends StatelessWidget {
  final int currentBeans;
  final int maxBeans;
  final String nextReward;
  final VoidCallback onViewPerksClick;

  const BrewCraftClubCard({
    super.key,
    required this.currentBeans,
    required this.maxBeans,
    required this.nextReward,
    required this.onViewPerksClick,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = (currentBeans / maxBeans).clamp(0.0, 1.0);
    final int remainingBeans = (maxBeans - currentBeans).clamp(0, maxBeans);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Container(
        decoration: const BoxDecoration(
          color: kSandSurfaceContainerLow,
          borderRadius: BrewCraftShapes.large,
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Top row: Badge + Title / Subtitle + Count
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    // Circular coffee cup badge
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: kGoldTertiaryFixed,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.coffee_rounded,
                          color: kMochaTertiaryContainer,
                          size: 22,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BrewCraft Club',
                          style: BrewCraftTypography.titleSmall.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kEspressoPrimary,
                          ),
                        ),
                        Text(
                          '$remainingBeans beans until your free cup',
                          style: BrewCraftTypography.bodySmall.copyWith(
                            color: kSandOnSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Bean ratio indicator: 140 / 200
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '$currentBeans',
                      style: BrewCraftTypography.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kCaramelSecondary,
                      ),
                    ),
                    Text(
                      ' / $maxBeans',
                      style: BrewCraftTypography.labelSmall.copyWith(
                        color: kSandOnSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Progress bar indicator
            Container(
              width: double.infinity,
              height: 10,
              decoration: const BoxDecoration(
                color: kSandSurfaceContainerHigh,
                borderRadius: BrewCraftShapes.pill,
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: progress,
                child: Container(
                  decoration: const BoxDecoration(
                    color: kCaramelSecondary,
                    borderRadius: BrewCraftShapes.pill,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Bottom row: Gift next reward & View perks link
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.redeem,
                      color: kCaramelSecondary,
                      size: 15,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Next reward: $nextReward',
                      style: BrewCraftTypography.labelSmall.copyWith(
                        color: kSandOnSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onViewPerksClick,
                  child: Text(
                    'View perks →',
                    style: BrewCraftTypography.labelSmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: kCaramelSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
