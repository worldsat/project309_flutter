import 'package:flutter/material.dart';
import 'models/cart_item.dart';
import 'models/drink_item.dart';
import 'screens/checkout/checkout_screen.dart';
import 'screens/customizer/customizer_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/tracker/tracker_screen.dart';
import 'theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BrewCraftApp());
}

enum AppDestination {
  home,
  customizer,
  checkout,
  tracker,
}

class BrewCraftApp extends StatelessWidget {
  const BrewCraftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BrewCraft',
      debugShowCheckedModeBanner: false,
      theme: buildBrewCraftTheme(),
      home: const MainNavigationHost(),
    );
  }
}

class MainNavigationHost extends StatefulWidget {
  const MainNavigationHost({super.key});

  @override
  State<MainNavigationHost> createState() => _MainNavigationHostState();
}

class _MainNavigationHostState extends State<MainNavigationHost> {
  AppDestination _currentDestination = AppDestination.home;
  String _selectedDrinkId = 'caramel_macchiato';

  final List<CartItem> _cartItems = [
    const CartItem(
      id: 'cart-item-1',
      name: 'Caramel Macchiato',
      description: 'Medium • Oat Milk • 50% Sweetness • Less Ice',
      unitPrice: 5.95,
      quantity: 1,
      imagePath: 'assets/images/caramel_macchiato.png',
    ),
    const CartItem(
      id: 'cart-item-2',
      name: 'Almond Croissant',
      description: 'Warm & toasted • Butter glaze',
      unitPrice: 3.80,
      quantity: 1,
      imagePath: 'assets/images/almond_croissant.png',
    ),
  ];

  void _navigateToCustomizer(String drinkId) {
    setState(() {
      _selectedDrinkId = drinkId;
      _currentDestination = AppDestination.customizer;
    });
  }

  void _navigateToCheckout() {
    setState(() {
      _currentDestination = AppDestination.checkout;
    });
  }

  void _navigateToTracker() {
    setState(() {
      _currentDestination = AppDestination.tracker;
    });
  }

  void _handleBack() {
    setState(() {
      switch (_currentDestination) {
        case AppDestination.tracker:
          _currentDestination = AppDestination.checkout;
          break;
        case AppDestination.checkout:
          _currentDestination = AppDestination.home;
          break;
        case AppDestination.customizer:
          _currentDestination = AppDestination.home;
          break;
        case AppDestination.home:
          break;
      }
    });
  }

  void _addCustomizedItemToCart(CartItem item) {
    setState(() {
      _cartItems.add(item);
      _currentDestination = AppDestination.checkout;
    });
  }

  void _addDrinkItemToCart(DrinkItem drink) {
    setState(() {
      _cartItems.add(
        CartItem(
          id: 'cart-item-${drink.id}-${DateTime.now().millisecondsSinceEpoch}',
          name: drink.name,
          description: drink.subtitle,
          unitPrice: drink.priceValue,
          quantity: 1,
          imagePath: drink.imagePath,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _currentDestination == AppDestination.home,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _currentDestination != AppDestination.home) {
          _handleBack();
        }
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: _buildCurrentScreen(),
      ),
    );
  }

  Widget _buildCurrentScreen() {
    switch (_currentDestination) {
      case AppDestination.home:
        return HomeScreen(
          key: const ValueKey('home_screen'),
          onNavigateToCustomizer: _navigateToCustomizer,
          onNavigateToCheckout: _navigateToCheckout,
          onNavigateToTracker: _navigateToTracker,
          cartBadgeCount: _cartItems.length,
          onAddToCart: _addDrinkItemToCart,
        );

      case AppDestination.customizer:
        return CustomizerScreen(
          key: ValueKey('customizer_screen_$_selectedDrinkId'),
          drinkId: _selectedDrinkId,
          onNavigateBack: _handleBack,
          onNavigateToCheckout: _addCustomizedItemToCart,
        );

      case AppDestination.checkout:
        return CheckoutScreen(
          key: const ValueKey('checkout_screen'),
          initialItems: _cartItems,
          onNavigateBack: _handleBack,
          onNavigateToTracker: _navigateToTracker,
          onAddMoreItems: () {
            setState(() {
              _currentDestination = AppDestination.home;
            });
          },
        );

      case AppDestination.tracker:
        return TrackerScreen(
          key: const ValueKey('tracker_screen'),
          onNavigateBack: _handleBack,
        );
    }
  }
}
