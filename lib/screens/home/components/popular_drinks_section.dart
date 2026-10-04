import 'package:flutter/material.dart';
import '../../../models/drink_item.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import 'brew_product_card.dart';

class PopularDrinksSection extends StatelessWidget {
  final List<DrinkItem> drinks;
  final Set<String> favorites;
  final ValueChanged<String> onFavoriteToggle;
  final ValueChanged<DrinkItem> onAddToCart;
  final ValueChanged<String> onDrinkClick;
  final VoidCallback onSeeAllClick;

  const PopularDrinksSection({
    super.key,
    required this.drinks,
    required this.favorites,
    required this.onFavoriteToggle,
    required this.onAddToCart,
    required this.onDrinkClick,
    required this.onSeeAllClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Column(
        children: [
          // Section Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.local_fire_department_rounded,
                    color: kCaramelSecondary,
                    size: 20,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Popular Drinks',
                    style: BrewCraftTypography.titleLarge.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kEspressoPrimary,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: onSeeAllClick,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'See all (18)',
                    style: BrewCraftTypography.labelMedium.copyWith(
                      fontWeight: FontWeight.w500,
                      color: kCaramelSecondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Two-Column Grid items
          for (int i = 0; i < drinks.length; i += 2)
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First card
                  Expanded(
                    child: BrewProductCard(
                      drink: drinks[i],
                      isFavorite: favorites.contains(drinks[i].id),
                      onFavoriteClick: () => onFavoriteToggle(drinks[i].id),
                      onAddToCartClick: () => onAddToCart(drinks[i]),
                      onCardClick: () => onDrinkClick(drinks[i].id),
                    ),
                  ),
                  const SizedBox(width: 14),

                  // Second card if exists
                  if (i + 1 < drinks.length)
                    Expanded(
                      child: BrewProductCard(
                        drink: drinks[i + 1],
                        isFavorite: favorites.contains(drinks[i + 1].id),
                        onFavoriteClick: () => onFavoriteToggle(drinks[i + 1].id),
                        onAddToCartClick: () => onAddToCart(drinks[i + 1]),
                        onCardClick: () => onDrinkClick(drinks[i + 1].id),
                      ),
                    )
                  else
                    const Expanded(child: SizedBox()),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
