import 'package:flutter/material.dart';
import '../../../models/customizer_options.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class ServingStyleSelector extends StatelessWidget {
  final ServingStyle selectedStyle;
  final ValueChanged<ServingStyle> onStyleSelected;

  const ServingStyleSelector({
    super.key,
    required this.selectedStyle,
    required this.onStyleSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Serving Style',
            style: BrewCraftTypography.titleSmall.copyWith(
              fontWeight: FontWeight.bold,
              color: kEspressoPrimary,
            ),
          ),
          const SizedBox(height: 8),

          // Pill Segmented container
          Container(
            height: 48,
            decoration: const BoxDecoration(
              color: kSandSurfaceContainer,
              borderRadius: BrewCraftShapes.pill,
            ),
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                // Iced Button
                Expanded(
                  child: _buildStyleOption(
                    title: 'Iced',
                    icon: Icons.ac_unit,
                    isSelected: selectedStyle == ServingStyle.iced,
                    onTap: () => onStyleSelected(ServingStyle.iced),
                  ),
                ),
                const SizedBox(width: 4),

                // Hot Button
                Expanded(
                  child: _buildStyleOption(
                    title: 'Hot',
                    icon: Icons.whatshot_outlined,
                    isSelected: selectedStyle == ServingStyle.hot,
                    onTap: () => onStyleSelected(ServingStyle.hot),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStyleOption({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? kCaramelSecondary : Colors.transparent,
          borderRadius: BrewCraftShapes.pill,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: kCaramelSecondary.withValues(alpha: 0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : kSandOnSurfaceVariant,
              size: 18,
            ),
            const SizedBox(width: 6),
            Text(
              title,
              style: BrewCraftTypography.labelLarge.copyWith(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? Colors.white : kSandOnSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
