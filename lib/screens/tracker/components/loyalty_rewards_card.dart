import 'package:flutter/material.dart';
import '../../../models/tracker_models.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class LoyaltyRewardsCard extends StatelessWidget {
  final String memberName;
  final int memberBeans;
  final int beansBrewing;
  final int beansToNextTier;
  final int goldTierTarget;
  final double progressPercent;
  final List<RedeemableReward> rewards;
  final ValueChanged<String> onRedeemReward;

  const LoyaltyRewardsCard({
    super.key,
    required this.memberName,
    required this.memberBeans,
    required this.beansBrewing,
    required this.beansToNextTier,
    required this.goldTierTarget,
    required this.progressPercent,
    required this.rewards,
    required this.onRedeemReward,
  });

  IconData _getRewardIcon(String id) {
    if (id == 'flavor') {
      return Icons.liquor_outlined;
    }
    return Icons.bakery_dining_outlined;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: kSandSurfaceContainerLow,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Rewards Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      decoration: const BoxDecoration(
                        color: kCaramelSecondaryFixed,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.loyalty_outlined,
                          color: kCaramelOnSecondaryFixed,
                          size: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$memberName\'s Bean Rewards',
                          style: BrewCraftTypography.titleMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kEspressoPrimary,
                          ),
                        ),
                        Text(
                          '+$beansBrewing beans brewing right now!',
                          style: BrewCraftTypography.bodySmall.copyWith(
                            fontWeight: FontWeight.w500,
                            color: kCaramelSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Total Beans Badge
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$memberBeans',
                      style: BrewCraftTypography.headlineSmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kEspressoPrimary,
                      ),
                    ),
                    Text(
                      'Total Beans',
                      style: BrewCraftTypography.labelSmall.copyWith(
                        color: kSandOnSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Progress Dial & Status Bar
            Container(
              decoration: BoxDecoration(
                color: kSandSurfaceContainerLowest,
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.workspace_premium_outlined,
                            color: kCaramelSecondary,
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Gold Tier Unlocks at $goldTierTarget',
                            style: BrewCraftTypography.labelMedium.copyWith(
                              fontWeight: FontWeight.w600,
                              color: kEspressoPrimary,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '$beansToNextTier beans away',
                        style: BrewCraftTypography.labelSmall.copyWith(
                          fontWeight: FontWeight.w500,
                          color: kCaramelSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Linear Gauge
                  Container(
                    width: double.infinity,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: kSandSurfaceContainerHigh,
                      borderRadius: BrewCraftShapes.pill,
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: progressPercent.clamp(0.0, 1.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              kCaramelSecondaryContainer,
                              kCaramelSecondary,
                            ],
                          ),
                          borderRadius: BrewCraftShapes.pill,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Tier Status Footnote
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Silver Roaster',
                        style: BrewCraftTypography.labelSmall.copyWith(
                          color: kSandOnSurfaceVariant,
                        ),
                      ),
                      Text(
                        'Free Artisan Tumbler 🎁',
                        style: BrewCraftTypography.labelSmall.copyWith(
                          fontWeight: FontWeight.w600,
                          color: kEspressoPrimary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Available Rewards List
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Available Rewards to Redeem',
                  style: BrewCraftTypography.labelMedium.copyWith(
                    fontWeight: FontWeight.w500,
                    color: kSandOnSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 8),

                ...rewards.map((reward) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: kSandSurfaceContainerLowest,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: kSandSurfaceContainer,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Icon(
                                    _getRewardIcon(reward.id),
                                    color: kCaramelSecondary,
                                    size: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    reward.title,
                                    style: BrewCraftTypography.labelLarge.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: kEspressoPrimary,
                                    ),
                                  ),
                                  Text(
                                    reward.description,
                                    style: BrewCraftTypography.bodySmall.copyWith(
                                      color: kSandOnSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Redeem pill button
                          GestureDetector(
                            onTap: () => onRedeemReward(reward.id),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: kCaramelSecondaryFixed,
                                borderRadius: BrewCraftShapes.pill,
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                              child: Text(
                                '${reward.costBeans} Beans',
                                style: BrewCraftTypography.labelMedium.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: kCaramelOnSecondaryFixed,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
