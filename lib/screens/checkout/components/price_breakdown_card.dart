import 'package:flutter/material.dart';
import '../../../models/fulfillment_mode.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class PriceBreakdownCard extends StatelessWidget {
  final int totalItems;
  final String formattedSubtotal;
  final FulfillmentMode fulfillmentMode;
  final String formattedFee;
  final bool voucherApplied;
  final double discount;
  final String formattedDiscount;
  final String formattedTax;
  final String formattedTotal;

  const PriceBreakdownCard({
    super.key,
    required this.totalItems,
    required this.formattedSubtotal,
    required this.fulfillmentMode,
    required this.formattedFee,
    required this.voucherApplied,
    required this.discount,
    required this.formattedDiscount,
    required this.formattedTax,
    required this.formattedTotal,
  });

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header: Price Breakdown & Count Badge
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Price Breakdown',
                  style: BrewCraftTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: kSandOnSurface,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: kSandSurfaceContainer,
                    borderRadius: BrewCraftShapes.pill,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  child: Text(
                    '$totalItems items',
                    style: BrewCraftTypography.labelSmall.copyWith(
                      color: kSandOnSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Subtotal
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: BrewCraftTypography.bodyMedium.copyWith(
                    color: kSandOnSurfaceVariant,
                  ),
                ),
                Text(
                  formattedSubtotal,
                  style: BrewCraftTypography.titleSmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: kSandOnSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Fee
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      fulfillmentMode.feeLabel,
                      style: BrewCraftTypography.bodyMedium.copyWith(
                        color: kSandOnSurfaceVariant,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.info_outline,
                      color: kEspressoOutline,
                      size: 14,
                    ),
                  ],
                ),
                Text(
                  formattedFee,
                  style: BrewCraftTypography.titleSmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: kSandOnSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Promo Discount
            if (voucherApplied && discount > 0) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Promo Discount (BREWFIRST)',
                    style: BrewCraftTypography.bodyMedium.copyWith(
                      color: kCaramelSecondary,
                    ),
                  ),
                  Text(
                    formattedDiscount,
                    style: BrewCraftTypography.titleSmall.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kCaramelSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],

            // Estimated Tax
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Estimated Tax (8.5%)',
                  style: BrewCraftTypography.bodyMedium.copyWith(
                    color: kSandOnSurfaceVariant,
                  ),
                ),
                Text(
                  formattedTax,
                  style: BrewCraftTypography.titleSmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: kSandOnSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Divider
            const Divider(
              color: kSandSurfaceContainerHighest,
              thickness: 1,
              height: 16,
            ),

            // Total Amount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Amount',
                      style: BrewCraftTypography.titleLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kSandOnSurface,
                      ),
                    ),
                    Text(
                      'Includes all local taxes',
                      style: BrewCraftTypography.labelSmall.copyWith(
                        color: kSandOnSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      'USD',
                      style: BrewCraftTypography.labelMedium.copyWith(
                        color: kEspressoOutline,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      formattedTotal,
                      style: BrewCraftTypography.headlineSmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kEspressoPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
