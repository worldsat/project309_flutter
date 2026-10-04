import 'package:flutter/material.dart';
import '../../../models/customizer_options.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class CupSizeSelector extends StatelessWidget {
  final CupSize selectedSize;
  final ValueChanged<CupSize> onSizeSelected;
  final VoidCallback onVolumeGuideClick;

  const CupSizeSelector({
    super.key,
    required this.selectedSize,
    required this.onSizeSelected,
    required this.onVolumeGuideClick,
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
                'Cup Size',
                style: BrewCraftTypography.titleSmall.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kEspressoPrimary,
                ),
              ),
              GestureDetector(
                onTap: onVolumeGuideClick,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'Volume Guide',
                    style: BrewCraftTypography.labelSmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: kCaramelSecondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          Row(
            children: CupSize.values.map((size) {
              final isSelected = size == selectedSize;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size == CupSize.small ? 0 : 5,
                    right: size == CupSize.large ? 0 : 5,
                  ),
                  child: GestureDetector(
                    onTap: () => onSizeSelected(size),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? kEspressoPrimary : kSandSurfaceContainerLow,
                        borderRadius: BrewCraftShapes.medium,
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: kEspressoPrimary.withValues(alpha: 0.3),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ]
                            : null,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.coffee_rounded,
                            color: isSelected ? kCaramelSecondaryFixed : kSandOnSurfaceVariant,
                            size: 24,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            size.title,
                            style: BrewCraftTypography.titleSmall.copyWith(
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : kSandOnSurface,
                            ),
                          ),
                          Text(
                            size.volume,
                            style: BrewCraftTypography.labelSmall.copyWith(
                              color: isSelected ? const Color(0xFFD4C3BD) : kSandOnSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            size.surchargeLabel,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                              color: isSelected ? kCaramelSecondaryFixed : kSandOnSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
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
