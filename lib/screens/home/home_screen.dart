import 'package:flutter/material.dart';
import '../../models/drink_catalog.dart';
import '../../models/drink_item.dart';
import '../../theme/colors.dart';
import '../../widgets/custom_toast.dart';
import 'components/category_chip_row.dart';
import 'components/club_card.dart';
import 'components/greeting_section.dart';
import 'components/home_bottom_bar.dart';
import 'components/home_top_app_bar.dart';
import 'components/popular_drinks_section.dart';
import 'components/search_bar_section.dart';
import 'components/seasonal_hero_banner.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<String> onNavigateToCustomizer;
  final VoidCallback onNavigateToCheckout;
  final VoidCallback onNavigateToTracker;
  final int cartBadgeCount;
  final ValueChanged<DrinkItem>? onAddToCart;

  const HomeScreen({
    super.key,
    required this.onNavigateToCustomizer,
    required this.onNavigateToCheckout,
    required this.onNavigateToTracker,
    this.cartBadgeCount = 2,
    this.onAddToCart,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';
  String _selectedCategory = 'All';
  final Set<String> _favorites = {};
  BottomNavTab _selectedTab = BottomNavTab.home;
  late int _cartCount;

  final List<String> _categories = [
    'All',
    'Espresso',
    'Cold Brew',
    'Pourover',
    'Signature Lattes',
    'Pastries',
  ];

  late List<DrinkItem> _allDrinks;

  @override
  void initState() {
    super.initState();
    _cartCount = widget.cartBadgeCount;
    _allDrinks = DrinkCatalog.getHomeDrinkItems();
  }

  void _toggleFavorite(String drinkId) {
    setState(() {
      if (_favorites.contains(drinkId)) {
        _favorites.remove(drinkId);
      } else {
        _favorites.add(drinkId);
      }
    });
  }

  void _handleAddToCart(DrinkItem drink) {
    setState(() {
      _cartCount++;
    });
    if (widget.onAddToCart != null) {
      widget.onAddToCart!(drink);
    }
    showBrewCraftToast(context, 'Added ${drink.name} to bag');
  }

  @override
  Widget build(BuildContext context) {
    // Filter drinks according to category and search query exactly like Kotlin HomeScreen.kt
    final displayedDrinks = _allDrinks.where((drink) {
      final matchesCategory = _selectedCategory == 'All' ||
          drink.category.toLowerCase().contains(_selectedCategory.toLowerCase()) ||
          drink.name.toLowerCase().contains(_selectedCategory.toLowerCase());

      final matchesQuery = _searchQuery.trim().isEmpty ||
          drink.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          drink.subtitle.toLowerCase().contains(_searchQuery.toLowerCase());

      return matchesCategory && matchesQuery;
    }).toList();

    final drinksToShow = displayedDrinks.isEmpty && _searchQuery.isEmpty ? _allDrinks : displayedDrinks;

    return Scaffold(
      backgroundColor: kSandSurface,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // 1. Top App Bar
            BrewCraftTopAppBar(
              branchName: 'Downtown Roastery, 5th Ave',
              onBranchClick: () {
                showBrewCraftToast(context, 'Downtown Roastery (Pick up ready)');
              },
              onNotificationClick: () {
                showBrewCraftToast(context, '2 unread club offers available');
              },
              onProfileClick: () {
                showBrewCraftToast(context, 'Next Tier: Platinum at 400 beans');
              },
            ),

            // 2. Greeting & Status
            const GreetingSection(
              greeting: 'Good morning, Alex ☕',
              userTier: 'Tier Gold',
              readyEstimate: 'Ready in ~10 mins at Downtown Roastery',
            ),

            // 3. Search Bar
            SearchBarSection(
              query: _searchQuery,
              onQueryChange: (val) {
                setState(() => _searchQuery = val);
              },
              onVoiceClick: () {
                showBrewCraftToast(context, 'Listening for coffee orders...');
              },
              onFilterClick: () {
                showBrewCraftToast(context, 'Filter: All Roasts & Brew Types');
              },
            ),

            // 4. BrewCraft Club Card
            BrewCraftClubCard(
              currentBeans: 140,
              maxBeans: 200,
              nextReward: 'Handcrafted Pourover',
              onViewPerksClick: () {
                showBrewCraftToast(context, 'Next Tier: Platinum at 400 beans');
              },
            ),

            // 5. Explore Categories
            CategoryChipRow(
              categories: _categories,
              selectedCategory: _selectedCategory,
              onCategorySelected: (cat) {
                setState(() => _selectedCategory = cat);
              },
            ),

            // 6. Seasonal Promotional Hero
            SeasonalHeroBanner(
              onTryNowClick: () {
                widget.onNavigateToCustomizer('autumn_maple_latte');
              },
            ),

            // 7. Popular Drinks Two-Column Grid
            PopularDrinksSection(
              drinks: drinksToShow,
              favorites: _favorites,
              onFavoriteToggle: _toggleFavorite,
              onAddToCart: _handleAddToCart,
              onDrinkClick: widget.onNavigateToCustomizer,
              onSeeAllClick: () {
                setState(() {
                  _selectedTab = BottomNavTab.menu;
                  _selectedCategory = 'All';
                  _searchQuery = '';
                });
              },
            ),

            // Bottom Spacing
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: BrewCraftBottomBar(
        selectedTab: _selectedTab,
        cartBadgeCount: _cartCount,
        onTabSelected: (tab) {
          setState(() => _selectedTab = tab);
          if (tab == BottomNavTab.cart) {
            widget.onNavigateToCheckout();
          } else if (tab == BottomNavTab.activity) {
            widget.onNavigateToTracker();
          }
        },
      ),
    );
  }
}
