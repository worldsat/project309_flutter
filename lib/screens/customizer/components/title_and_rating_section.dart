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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: BrewCraftTypography.headlineSmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kEspressoPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: kCaramelSecondary,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$rating',
                          style: BrewCraftTypography.titleSmall.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kEspressoPrimary,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          reviewCount,
                          style: BrewCraftTypography.bodySmall.copyWith(
                            color: kSandOnSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'BASE',
                      style: BrewCraftTypography.labelSmall.copyWith(
                        fontWeight: FontWeight.w600,
                        color: kSandOnSurfaceVariant,
                        letterSpacing: 1.0,
                      ),
                    ),
                    Text(
                      formattedBasePrice,
                      style: BrewCraftTypography.titleLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kCaramelSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Full Description
          Text(
            description,
            style: BrewCraftTypography.bodyMedium.copyWith(
              color: kSandOnSurfaceVariant,
              height: 22 / 14,
            ),
          ),
        ],
      ),
    );
  }
}

