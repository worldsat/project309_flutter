import 'package:flutter/material.dart';
import '../../../models/fulfillment_mode.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class FulfillmentToggle extends StatelessWidget {
  final FulfillmentMode selectedMode;
  final ValueChanged<FulfillmentMode> onModeSelected;

  const FulfillmentToggle({
    super.key,
    required this.selectedMode,
    required this.onModeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: kSandSurfaceContainerHigh,
          borderRadius: BrewCraftShapes.pill,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            // Pickup
            Expanded(
              child: _buildToggleOption(
                title: 'Pickup',
                timing: '10-15 mins',
                icon: Icons.storefront_outlined,
                isSelected: selectedMode == FulfillmentMode.pickup,
                onTap: () => onModeSelected(FulfillmentMode.pickup),
              ),
            ),
            const SizedBox(width: 4),

            // Fast Delivery
            Expanded(
              child: _buildToggleOption(
                title: 'Fast Delivery',
                timing: '25-30 mins',
                icon: Icons.two_wheeler_rounded,
                isSelected: selectedMode == FulfillmentMode.delivery,
                onTap: () => onModeSelected(FulfillmentMode.delivery),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleOption({
    required String title,
    required String timing,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? kEspressoPrimary : Colors.transparent,
          borderRadius: BrewCraftShapes.pill,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: kEspressoPrimary.withValues(alpha: 0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: isSelected ? Colors.white : kSandOnSurfaceVariant,
                  size: 17,
                ),
                const SizedBox(width: 6),
                Text(
                  title,
                  style: BrewCraftTypography.titleSmall.copyWith(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected ? Colors.white : kSandOnSurfaceVariant,
                  ),
                ),
              ],
            ),
            Text(
              timing,
              style: TextStyle(
                fontSize: 11,
                color: isSelected ? Colors.white.withValues(alpha: 0.85) : kSandOnSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
