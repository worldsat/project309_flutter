import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class CheckoutHeaderSection extends StatelessWidget {
  final String branchName;

  const CheckoutHeaderSection({
    super.key,
    required this.branchName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tag & Location Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'REVIEW ORDER',
                style: BrewCraftTypography.labelSmall.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kCaramelSecondary,
                  letterSpacing: 1.0,
                ),
              ),

              Container(
                decoration: const BoxDecoration(
                  color: kCaramelSecondaryContainer,
                  borderRadius: BrewCraftShapes.pill,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.coffee_rounded,
                      color: kCaramelOnSecondaryContainer,
                      size: 13,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      branchName,
                      style: BrewCraftTypography.labelSmall.copyWith(
                        fontWeight: FontWeight.w600,
                        color: kCaramelOnSecondaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Headline
          Text(
            'Your Coffee Bag',
            style: BrewCraftTypography.headlineSmall.copyWith(
              fontWeight: FontWeight.bold,
              color: kSandOnSurface,
            ),
          ),
        ],
      ),
    );
  }
}
