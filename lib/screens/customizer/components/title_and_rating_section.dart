import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';

class TitleAndRatingSection extends StatelessWidget {
  final String productName;
  final double rating;
  final String reviewCount;
  final String formattedBasePrice;
  final String description;

  const TitleAndRatingSection({
    super.key,
    required this.productName,
    required this.rating,
    required this.reviewCount,
    required this.formattedBasePrice,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Product Name & Base Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  productName,
                  style: BrewCraftTypography.headlineSmall.copyWith(
                    fontWeight: FontWeight.bold,
                    color: kEspressoPrimary,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                formattedBasePrice,
                style: BrewCraftTypography.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kEspressoPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Rating Row
          Row(
            children: [
              const Icon(
                Icons.star_rounded,
                color: kCaramelSecondaryContainer,
                size: 18,
              ),
              const SizedBox(width: 4),
              Text(
                '$rating',
                style: BrewCraftTypography.titleSmall.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kSandOnSurface,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                reviewCount,
                style: BrewCraftTypography.labelSmall.copyWith(
                  color: kSandOnSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Full Description
          Text(
            description,
            style: BrewCraftTypography.bodySmall.copyWith(
              color: kSandOnSurfaceVariant,
              height: 18 / 12,
            ),
          ),
        ],
      ),
    );
  }
}
