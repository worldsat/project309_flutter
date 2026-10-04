import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class CustomizerStickyBottomBar extends StatelessWidget {
  final int quantity;
  final String formattedTotalPrice;
  final ValueChanged<int> onAdjustQuantity;
  final VoidCallback onAddToCart;

  const CustomizerStickyBottomBar({
    super.key,
    required this.quantity,
    required this.formattedTotalPrice,
    required this.onAdjustQuantity,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    final bool canMinus = quantity > 1;
    final bool canPlus = quantity < 10;

    return Container(
      decoration: BoxDecoration(
        color: kSandSurfaceContainerHigh.withValues(alpha: 0.95),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              // Quantity Selector Stepper
              Container(
                decoration: BoxDecoration(
                  color: kSandSurfaceContainerLowest,
                  borderRadius: BrewCraftShapes.pill,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: canMinus ? () => onAdjustQuantity(-1) : null,
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.remove,
                            color: canMinus
                                ? kEspressoPrimary
                                : kSandOnSurfaceVariant.withValues(alpha: 0.35),
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 28,
                      child: Text(
                        '$quantity',
                        style: BrewCraftTypography.titleMedium.copyWith(
                          fontWeight: FontWeight.bold,
                          color: kEspressoPrimary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: canPlus ? () => onAdjustQuantity(1) : null,
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: canPlus
                                ? kEspressoPrimary
                                : kSandOnSurfaceVariant.withValues(alpha: 0.35),
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),

              // Primary Add to Cart Button
              Expanded(
                child: GestureDetector(
                  onTap: onAddToCart,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: kEspressoPrimary,
                      borderRadius: BrewCraftShapes.pill,
                      boxShadow: [
                        BoxShadow(
                          color: kEspressoPrimary.withValues(alpha: 0.35),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Add to Cart',
                              style: BrewCraftTypography.labelLarge.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          formattedTotalPrice,
                          style: BrewCraftTypography.titleMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kCaramelSecondaryFixed,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
