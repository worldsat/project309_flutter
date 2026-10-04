import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class CategoryChipRow extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const CategoryChipRow({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'all':
        return Icons.check;
      case 'espresso':
        return Icons.coffee_rounded;
      case 'cold brew':
        return Icons.ac_unit;
      case 'pourover':
        return Icons.coffee_maker_outlined;
      case 'signature lattes':
        return Icons.local_cafe_rounded;
      case 'pastries':
        return Icons.bakery_dining_outlined;
      default:
        return Icons.coffee_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Explore Categories',
                style: BrewCraftTypography.titleMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: kEspressoPrimary,
                ),
              ),
              Text(
                'Scroll to view',
                style: BrewCraftTypography.labelSmall.copyWith(
                  color: kSandOnSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // Horizontal Chips Row
        SizedBox(
          height: 36,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: categories.length,
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = category == selectedCategory;
              final chipBg = isSelected ? kCaramelSecondary : kSandSurfaceContainer;
              final contentColor = isSelected ? kCaramelOnSecondary : kSandOnSurfaceVariant;

              return GestureDetector(
                onTap: () => onCategorySelected(category),
                child: Container(
                  height: 36,
                  decoration: BoxDecoration(
                    color: chipBg,
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _getCategoryIcon(category),
                        color: contentColor,
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        category,
                        style: BrewCraftTypography.labelMedium.copyWith(
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                          color: contentColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
