import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class ProductHeroSection extends StatelessWidget {
  final String imagePath;
  final String calories;
  final String productName;
  final String tag1;
  final String tag2;

  const ProductHeroSection({
    super.key,
    required this.imagePath,
    required this.calories,
    required this.productName,
    this.tag1 = "100% Arabica",
    this.tag2 = "Medium Roast",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: kSandSurfaceContainerLow,
          borderRadius: BrewCraftShapes.large,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BrewCraftShapes.large,
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Main Product Image
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => const Center(
                    child: Icon(Icons.coffee, size: 64, color: kEspressoOutline),
                  ),
                ),

                // Ambient vignette gradient overlay
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x22000000),
                        Colors.transparent,
                        Color(0x992B1409),
                      ],
                    ),
                  ),
                ),

                // Floating Top-Right Calories Badge (180 kcal)
                Positioned(
                  top: 14,
                  right: 14,
                  child: Container(
                    decoration: BoxDecoration(
                      color: kSandSurfaceContainerLowest.withValues(alpha: 0.92),
                      borderRadius: BrewCraftShapes.pill,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.local_fire_department_rounded,
                          color: kCaramelSecondary,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          calories,
                          style: BrewCraftTypography.labelMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kEspressoPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Floating Bottom Metadata Badges ("100% Arabica", "Medium Roast")
                Positioned(
                  bottom: 14,
                  left: 14,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Tag 1 (100% Arabica)
                      Container(
                        decoration: BoxDecoration(
                          color: kSandSurfaceContainerLowest.withValues(alpha: 0.92),
                          borderRadius: BrewCraftShapes.pill,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.verified,
                              color: kCaramelSecondary,
                              size: 14,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              tag1,
                              style: BrewCraftTypography.labelSmall.copyWith(
                                fontWeight: FontWeight.w600,
                                color: kEspressoPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Tag 2 (Medium Roast)
                      Container(
                        decoration: BoxDecoration(
                          color: kSandSurfaceContainerLowest.withValues(alpha: 0.92),
                          borderRadius: BrewCraftShapes.pill,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.coffee_rounded,
                              color: kCaramelSecondary,
                              size: 14,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              tag2,
                              style: BrewCraftTypography.labelSmall.copyWith(
                                fontWeight: FontWeight.w600,
                                color: kEspressoPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
