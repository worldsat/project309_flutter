import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

enum BottomNavTab {
  home('Home'),
  menu('Menu'),
  cart('Cart'),
  activity('Activity');

  final String title;
  const BottomNavTab(this.title);
}

class BrewCraftBottomBar extends StatelessWidget {
  final BottomNavTab selectedTab;
  final int cartBadgeCount;
  final ValueChanged<BottomNavTab> onTabSelected;

  const BrewCraftBottomBar({
    super.key,
    required this.selectedTab,
    required this.cartBadgeCount,
    required this.onTabSelected,
  });

  IconData _getTabIcon(BottomNavTab tab) {
    switch (tab) {
      case BottomNavTab.home:
        return Icons.explore_outlined;
      case BottomNavTab.menu:
        return Icons.local_cafe_outlined;
      case BottomNavTab.cart:
        return Icons.shopping_bag_outlined;
      case BottomNavTab.activity:
        return Icons.receipt_long_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSandSurfaceContainer,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 72.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: BottomNavTab.values.map((tab) {
              final isSelected = tab == selectedTab;
              return GestureDetector(
                onTap: () => onTabSelected(tab),
                behavior: HitTestBehavior.opaque,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Active indicator capsule
                    Container(
                      width: 64,
                      height: 32,
                      decoration: BoxDecoration(
                        color: isSelected ? kCaramelSecondaryContainer : Colors.transparent,
                        borderRadius: BrewCraftShapes.pill,
                      ),
                      child: Center(
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              _getTabIcon(tab),
                              color: isSelected ? kEspressoPrimary : kSandOnSurfaceVariant,
                              size: 24,
                            ),

                            // Cart count badge
                            if (tab == BottomNavTab.cart && cartBadgeCount > 0)
                              Positioned(
                                top: -4,
                                right: -8,
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: const BoxDecoration(
                                    color: kCaramelSecondary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '$cartBadgeCount',
                                      style: const TextStyle(
                                        fontSize: 10,
                                        height: 1,
                                        fontWeight: FontWeight.bold,
                                        color: kCaramelOnSecondary,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Tab label
                    Text(
                      tab.title,
                      style: BrewCraftTypography.labelMedium.copyWith(
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                        color: isSelected ? kEspressoPrimary : kSandOnSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
