import 'package:flutter/material.dart';
import '../../../models/customizer_options.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class MilkChoiceSection extends StatelessWidget {
  final MilkOption selectedMilk;
  final ValueChanged<MilkOption> onMilkSelected;

  const MilkChoiceSection({
    super.key,
    required this.selectedMilk,
    required this.onMilkSelected,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Choice of Milk',
                style: BrewCraftTypography.titleSmall.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kEspressoPrimary,
                ),
              ),
              Text(
                '1 Selection',
                style: BrewCraftTypography.labelSmall.copyWith(
                  color: kSandOnSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: MilkOption.values.map((option) {
              final isSelected = option == selectedMilk;
              return GestureDetector(
                onTap: () => onMilkSelected(option),
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
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isSelected) ...[
                        const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                      ],
                      Text(
                        option.displayLabel,
                        style: BrewCraftTypography.labelMedium.copyWith(
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          color: isSelected ? Colors.white : kSandOnSurfaceVariant,
                        ),
                      ),
                    ],
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
