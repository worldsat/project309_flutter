import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class SeasonalHeroBanner extends StatelessWidget {
  final VoidCallback onTryNowClick;

  const SeasonalHeroBanner({
    super.key,
    required this.onTryNowClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Container(
        height: 200.0,
        decoration: BoxDecoration(
          color: kEspressoPrimary,
          borderRadius: BrewCraftShapes.large,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BrewCraftShapes.large,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background photo with dark espresso scrim
              Opacity(
                opacity: 0.40,
                child: Image.asset(
                  'assets/images/banner.jpg',
                  fit: BoxFit.cover,
                ),
              ),

              // Gradient overlay to guarantee full text readability
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xBB2B1409),
                      Color(0xDD2B1409),
                      Color(0xF52B1409),
                    ],
                  ),
                ),
              ),

              // Card foreground content
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top badges row: "Limited Edition" & "20% OFF TODAY"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: kCaramelSecondaryFixed,
                            borderRadius: BrewCraftShapes.pill,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          child: Text(
                            'Limited Edition',
                            style: BrewCraftTypography.labelSmall.copyWith(
                              fontWeight: FontWeight.w600,
                              color: kCaramelOnSecondaryFixed,
                            ),
                          ),
                        ),
                        Text(
                          '20% OFF TODAY',
                          style: BrewCraftTypography.titleSmall.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kCaramelSecondaryFixed,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),

                    // Middle title & description
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Autumn Maple Latte',
                          style: BrewCraftTypography.headlineSmall.copyWith(
                            fontWeight: FontWeight.w600,
                            color: kSandSurfaceContainerLowest,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Dark-roasted single origin blend infused with pure Vermont maple and velvety steamed oat milk.',
                          style: BrewCraftTypography.bodySmall.copyWith(
                            color: kSandSurfaceVariant,
                            height: 16 / 12,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),

                    // Bottom pricing & "Try Now" CTA button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '\$4.95',
                              style: BrewCraftTypography.titleLarge.copyWith(
                                fontWeight: FontWeight.bold,
                                color: kSandSurfaceContainerLowest,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '\$6.20',
                              style: BrewCraftTypography.bodySmall.copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: kEspressoOutlineVariant,
                              ),
                            ),
                          ],
                        ),

                        GestureDetector(
                          onTap: onTryNowClick,
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: kSandSurfaceContainerLowest,
                              borderRadius: BrewCraftShapes.pill,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.12),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.center,
                            child: Text(
                              'Try Now',
                              style: BrewCraftTypography.labelLarge.copyWith(
                                fontWeight: FontWeight.w600,
                                color: kEspressoPrimary,
                              ),
                            ),
                          ),
                        ),
                      ],
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
