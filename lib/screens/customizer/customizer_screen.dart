import 'package:flutter/material.dart';
import '../../models/cart_item.dart';
import '../../models/customizer_options.dart';
import '../../models/drink_catalog.dart';
import '../../models/drink_item.dart';
import '../../theme/colors.dart';
import '../../widgets/custom_toast.dart';
import 'components/barista_notes_section.dart';
import 'components/cup_size_selector.dart';
import 'components/customizer_sticky_bottom_bar.dart';
import 'components/customizer_top_app_bar.dart';
import 'components/espresso_shots_card.dart';
import 'components/ice_level_section.dart';
import 'components/milk_choice_section.dart';
import 'components/product_hero_section.dart';
import 'components/serving_style_selector.dart';
import 'components/sweetness_level_section.dart';
import 'components/title_and_rating_section.dart';

class CustomizerScreen extends StatefulWidget {
  final String drinkId;
  final VoidCallback onNavigateBack;
  final ValueChanged<CartItem> onNavigateToCheckout;

  const CustomizerScreen({
    super.key,
    required this.drinkId,
    required this.onNavigateBack,
    required this.onNavigateToCheckout,
  });

  @override
  State<CustomizerScreen> createState() => _CustomizerScreenState();
}

class _CustomizerScreenState extends State<CustomizerScreen> {
  late DrinkDetailData _drink;
  late ServingStyle _servingStyle;
  late CupSize _cupSize;
  late int _shots;
  late MilkOption _selectedMilk;
  late SweetnessLevel _selectedSweetness;
  late IceLevel _selectedIce;
  String _baristaNotes = '';
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    _loadDrink(widget.drinkId);
  }

  @override
  void didUpdateWidget(covariant CustomizerScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.drinkId != widget.drinkId) {
      _loadDrink(widget.drinkId);
    }
  }

  void _loadDrink(String id) {
    _drink = DrinkCatalog.getDrinkDetail(id);
    _servingStyle = _drink.defaultServingStyle;
    _cupSize = _drink.defaultCupSize;
    _shots = _drink.defaultShots;
    _selectedMilk = _drink.defaultMilk;
    _selectedSweetness = _drink.defaultSweetness;
    _selectedIce = _drink.defaultIce;
    _baristaNotes = '';
    _quantity = 1;
  }

  String get _shotDescription {
    switch (_shots) {
      case 1:
        return 'Single Espresso (Mild)';
      case 2:
        return 'Double Ristretto (Balanced)';
      case 3:
        return 'Triple Bold (Robust)';
      default:
        return 'Quad Turbo (Extra Strong)';
    }
  }

  double get _unitPrice {
    final sizePrice = _cupSize.surcharge;
    final milkPrice = _selectedMilk.surcharge;
    final shotPrice = (_shots - 2) * 0.80;
    return (_drink.basePrice + sizePrice + milkPrice + shotPrice).clamp(0.0, 999.0);
  }

  double get _totalPrice => (_unitPrice * _quantity).clamp(0.0, 999.0);

  String get _formattedTotalPrice => '\$${_totalPrice.toStringAsFixed(2)}';
  String get _formattedBasePrice => '\$${_drink.basePrice.toStringAsFixed(2)}';

  CartItem _toCartItem() {
    final options = <String>[];
    options.add(_cupSize.title);
    if (_servingStyle == ServingStyle.iced) {
      options.add(_selectedIce.title);
    } else {
      options.add('Hot');
    }
    options.add(_selectedMilk.title);
    if (_selectedSweetness != SweetnessLevel.noSugar) {
      options.add(_selectedSweetness.title);
    }

    return CartItem(
      id: 'cart-custom-${_drink.id}-${DateTime.now().millisecondsSinceEpoch}',
      name: _drink.name,
      description: options.join(' • '),
      unitPrice: _unitPrice,
      quantity: _quantity,
      imagePath: _drink.imagePath,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSandSurface,
      appBar: CustomizerTopAppBar(
        title: _drink.name,
        onBackClick: widget.onNavigateBack,
        onMoreClick: () {
          showBrewCraftToast(context, 'Options: Share recipe, Dietary info');
        },
      ),
      bottomNavigationBar: CustomizerStickyBottomBar(
        quantity: _quantity,
        formattedTotalPrice: _formattedTotalPrice,
        onAdjustQuantity: (delta) {
          setState(() {
            _quantity = (_quantity + delta).clamp(1, 10);
          });
        },
        onAddToCart: () {
          final item = _toCartItem();
          widget.onNavigateToCheckout(item);
        },
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // 1. Product Showcase Hero
          ProductHeroSection(
            imagePath: _drink.imagePath,
            calories: _drink.calories,
            productName: _drink.name,
            tag1: _drink.tag1,
            tag2: _drink.tag2,
          ),

          // 2. Title & Rating Header
          TitleAndRatingSection(
            productName: _drink.name,
            rating: _drink.rating,
            reviewCount: _drink.fullReviewCount,
            formattedBasePrice: _formattedBasePrice,
            description: _drink.description,
          ),

          // 3. Temperature Toggle (Serving Style)
          ServingStyleSelector(
            selectedStyle: _servingStyle,
            onStyleSelected: (style) {
              setState(() => _servingStyle = style);
            },
          ),

          // 4. Cup Size Selector
          CupSizeSelector(
            selectedSize: _cupSize,
            onSizeSelected: (size) {
              setState(() => _cupSize = size);
            },
            onVolumeGuideClick: () {
              showBrewCraftToast(context, 'Standard sizing: Small 8oz, Med 12oz, Lrg 16oz');
            },
          ),

          // 5. Espresso Shots Counter Card
          EspressoShotsCard(
            shots: _shots,
            shotDescription: _shotDescription,
            onAdjustShots: (delta) {
              setState(() {
                _shots = (_shots + delta).clamp(1, 4);
              });
            },
          ),

          // 6. Choice of Milk
          MilkChoiceSection(
            selectedMilk: _selectedMilk,
            onMilkSelected: (milk) {
              setState(() => _selectedMilk = milk);
            },
          ),

          // 7. Sweetness Level
          SweetnessLevelSection(
            selectedSweetness: _selectedSweetness,
            onSweetnessSelected: (sweetness) {
              setState(() => _selectedSweetness = sweetness);
            },
          ),

          // 8. Ice Level (Only visible when Serving Style == Iced)
          if (_servingStyle == ServingStyle.iced)
            IceLevelSection(
              selectedIce: _selectedIce,
              onIceSelected: (ice) {
                setState(() => _selectedIce = ice);
              },
            ),

          // 9. Barista Notes
          BaristaNotesSection(
            notes: _baristaNotes,
            onNotesChange: (notes) {
              setState(() => _baristaNotes = notes);
            },
          ),

          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
