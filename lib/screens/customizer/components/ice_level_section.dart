import 'package:flutter/material.dart';
import '../../../models/customizer_options.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class IceLevelSection extends StatelessWidget {
  final IceLevel selectedIce;
  final ValueChanged<IceLevel> onIceSelected;

  const IceLevelSection({
    super.key,
    required this.selectedIce,
    required this.onIceSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ice Level',
            style: BrewCraftTypography.titleSmall.copyWith(
              fontWeight: FontWeight.bold,
              color: kEspressoPrimary,
            ),
          ),
          const SizedBox(height: 8),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: IceLevel.values.map((level) {
              final isSelected = level == selectedIce;
              return GestureDetector(
                onTap: () => onIceSelected(level),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? kCaramelSecondary : kSandSurfaceContainer,
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
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    level.title,
                    style: BrewCraftTypography.labelMedium.copyWith(
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                      color: isSelected ? Colors.white : kSandOnSurfaceVariant,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
