import 'package:flutter/material.dart';
import '../../../models/cart_item.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class CartItemsListSection extends StatelessWidget {
  final List<CartItem> items;
  final void Function(String itemId, int delta) onUpdateQuantity;
  final void Function(String itemId) onRemoveItem;
  final VoidCallback onAddMoreClicked;

  const CartItemsListSection({
    super.key,
    required this.items,
    required this.onUpdateQuantity,
    required this.onRemoveItem,
    required this.onAddMoreClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Items (${items.length})',
                style: BrewCraftTypography.titleSmall.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kSandOnSurfaceVariant,
                ),
              ),
              Text(
                'Crafted with care',
                style: BrewCraftTypography.labelSmall.copyWith(
                  color: kCaramelSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // List of Cart Items
          ...items.map((item) {
            final bool canMinus = item.quantity > 1;
            final bool canPlus = item.quantity < 10;

            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
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
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Item thumbnail image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Container(
                        width: 76,
                        height: 76,
                        color: kSandSurfaceContainer,
                        child: Image.asset(
                          item.imagePath,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => const Center(
                            child: Icon(Icons.coffee, color: kEspressoOutline),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Details Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  item.name,
                                  style: BrewCraftTypography.titleSmall.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: kSandOnSurface,
                                  ),
                                ),
                              ),

                              // Delete button
                              GestureDetector(
                                onTap: () => onRemoveItem(item.id),
                                child: const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.delete_outline,
                                    color: kEspressoOutline,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),

                          Text(
                            item.description,
                            style: BrewCraftTypography.bodySmall.copyWith(
                              color: kSandOnSurfaceVariant,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 10),

                          // Price and Stepper
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                item.formattedUnitPrice,
                                style: BrewCraftTypography.titleMedium.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: kEspressoPrimary,
                                ),
                              ),

                              // Stepper
                              Container(
                                decoration: const BoxDecoration(
                                  color: kSandSurfaceContainerHigh,
                                  borderRadius: BrewCraftShapes.pill,
                                ),
                                padding: const EdgeInsets.all(2.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: canMinus
                                          ? () => onUpdateQuantity(item.id, -1)
                                          : null,
                                      child: Container(
                                        width: 26,
                                        height: 26,
                                        decoration: BoxDecoration(
                                          color: canMinus
                                              ? kSandSurfaceContainerLowest
                                              : kSandSurfaceContainerHigh,
                                          shape: BoxShape.circle,
                                          boxShadow: canMinus
                                              ? [
                                                  BoxShadow(
                                                    color: Colors.black.withValues(alpha: 0.08),
                                                    blurRadius: 2,
                                                    offset: const Offset(0, 1),
                                                  ),
                                                ]
                                              : null,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.remove,
                                            color: canMinus
                                                ? kEspressoPrimary
                                                : kSandOnSurfaceVariant.withValues(alpha: 0.35),
                                            size: 14,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      width: 26,
                                      child: Text(
                                        '${item.quantity}',
                                        style: BrewCraftTypography.titleSmall.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: kSandOnSurface,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),

                                    GestureDetector(
                                      onTap: canPlus
                                          ? () => onUpdateQuantity(item.id, 1)
                                          : null,
                                      child: Container(
                                        width: 26,
                                        height: 26,
                                        decoration: BoxDecoration(
                                          color: canPlus
                                              ? kSandSurfaceContainerLowest
                                              : kSandSurfaceContainerHigh,
                                          shape: BoxShape.circle,
                                          boxShadow: canPlus
                                              ? [
                                                  BoxShadow(
                                                    color: Colors.black.withValues(alpha: 0.08),
                                                    blurRadius: 2,
                                                    offset: const Offset(0, 1),
                                                  ),
                                                ]
                                              : null,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            color: canPlus
                                                ? kEspressoPrimary
                                                : kSandOnSurfaceVariant.withValues(alpha: 0.35),
                                            size: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
            );
          }),

          // Add More Items Tile
          GestureDetector(
            onTap: onAddMoreClicked,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: kSandSurfaceContainerLow,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add_circle_outline,
                    color: kCaramelSecondary,
                    size: 19,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Add More from the Bakery or Roastery',
                    style: BrewCraftTypography.titleSmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: kCaramelSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
