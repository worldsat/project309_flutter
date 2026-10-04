import 'package:flutter/material.dart';
import '../../../models/fulfillment_mode.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class CheckoutStickyBottomBar extends StatelessWidget {
  final String totalAmount;
  final FulfillmentMode fulfillmentMode;
  final bool isSubmitting;
  final bool orderSubmitted;
  final VoidCallback onPlaceOrderClicked;

  const CheckoutStickyBottomBar({
    super.key,
    required this.totalAmount,
    required this.fulfillmentMode,
    required this.isSubmitting,
    required this.orderSubmitted,
    required this.onPlaceOrderClicked,
  });

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = orderSubmitted ? kCaramelSecondary : kEspressoPrimary;

    return Container(
      decoration: BoxDecoration(
        color: kSandSurface.withValues(alpha: 0.98),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1F2B1409),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: isSubmitting ? null : onPlaceOrderClicked,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 56,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BrewCraftShapes.pill,
                    boxShadow: [
                      BoxShadow(
                        color: buttonColor.withValues(alpha: 0.35),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: isSubmitting
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Brewing Order...',
                              style: BrewCraftTypography.titleMedium.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      : orderSubmitted
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 22,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Order Placed! #BC-8942',
                                  style: BrewCraftTypography.titleMedium.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.shopping_bag,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Place Order',
                                      style: BrewCraftTypography.titleMedium.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      totalAmount,
                                      style: BrewCraftTypography.titleMedium.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: kCaramelSecondaryFixed,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                ),
              ),
              const SizedBox(height: 8),

              // Micro Delight Security Notice
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.lock_outline,
                    color: kEspressoOutline,
                    size: 13,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    fulfillmentMode == FulfillmentMode.pickup
                        ? '256-bit encrypted • Fresh pickup guaranteed'
                        : '256-bit encrypted • Safe contactless delivery guaranteed',
                    style: const TextStyle(
                      fontSize: 11,
                      color: kEspressoOutline,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
