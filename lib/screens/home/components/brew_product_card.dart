import 'package:flutter/material.dart';
import '../../../models/drink_item.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class BrewProductCard extends StatelessWidget {
  final DrinkItem drink;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;
  final VoidCallback onAddToCartClick;
  final VoidCallback onCardClick;

  const BrewProductCard({
    super.key,
    required this.drink,
    required this.isFavorite,
    required this.onFavoriteClick,
    required this.onAddToCartClick,
    required this.onCardClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardClick,
      child: Container(
        decoration: BoxDecoration(
          color: kSandSurfaceContainerLow,
          borderRadius: BrewCraftShapes.medium,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image Container with Favorite Heart Button
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(color: kSandSurfaceContainer),
                        Image.asset(
                          drink.imagePath,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => const Center(
                            child: Icon(Icons.coffee, color: kEspressoOutline),
                          ),
                        ),

                        // Favorite Heart Toggle Button
                        Positioned(
                          top: 8,
                          right: 8,
                          child: GestureDetector(
                            onTap: onFavoriteClick,
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: kSandSurfaceContainerLowest.withValues(alpha: 0.85),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  isFavorite ? Icons.favorite : Icons.favorite_border,
                                  color: isFavorite ? kErrorColor : kSandOnSurfaceVariant,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Rating row: Star + 4.9 + (1.2k)
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: kCaramelSecondaryContainer,
                      size: 16,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '${drink.rating}',
                      style: BrewCraftTypography.labelSmall.copyWith(
                        fontWeight: FontWeight.w600,
                        color: kSandOnSurface,
                      ),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '(${drink.reviewCount})',
                      style: BrewCraftTypography.labelSmall.copyWith(
                        color: kSandOnSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),

                // Drink Name
                Text(
                  drink.name,
                  style: BrewCraftTypography.titleSmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: kEspressoPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),

                // Drink Description
                Text(
                  drink.subtitle,
                  style: BrewCraftTypography.bodySmall.copyWith(
                    color: kSandOnSurfaceVariant,
                    height: 16 / 12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Bottom row: Price & Add button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  drink.price,
                  style: BrewCraftTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: kEspressoPrimary,
                  ),
                ),

                // Add (+) Button: Circular Espresso Primary with White plus icon
                GestureDetector(
                  onTap: onAddToCartClick,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: kEspressoPrimary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: kEspressoPrimary.withValues(alpha: 0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: kSandSurfaceContainerLowest,
                        size: 20,
                      ),
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
