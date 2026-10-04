import 'customizer_options.dart';

class DrinkItem {
  final String id;
  final String name;
  final String subtitle;
  final String category;
  final String price;
  final double priceValue;
  final double rating;
  final String reviewCount;
  final String imagePath;
  final bool isFavorite;

  const DrinkItem({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.category,
    required this.price,
    required this.priceValue,
    required this.rating,
    required this.reviewCount,
    required this.imagePath,
    this.isFavorite = false,
  });

  DrinkItem copyWith({
    String? id,
    String? name,
    String? subtitle,
    String? category,
    String? price,
    double? priceValue,
    double? rating,
    String? reviewCount,
    String? imagePath,
    bool? isFavorite,
  }) {
    return DrinkItem(
      id: id ?? this.id,
      name: name ?? this.name,
      subtitle: subtitle ?? this.subtitle,
      category: category ?? this.category,
      price: price ?? this.price,
      priceValue: priceValue ?? this.priceValue,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      imagePath: imagePath ?? this.imagePath,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

class DrinkDetailData {
  final String id;
  final String name;
  final String subtitle;
  final String category;
  final double basePrice;
  final double rating;
  final String reviewCount;
  final String fullReviewCount;
  final String calories;
  final String description;
  final String imagePath;
  final String tag1;
  final String tag2;
  final ServingStyle defaultServingStyle;
  final CupSize defaultCupSize;
  final int defaultShots;
  final MilkOption defaultMilk;
  final SweetnessLevel defaultSweetness;
  final IceLevel defaultIce;

  const DrinkDetailData({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.category,
    required this.basePrice,
    required this.rating,
    required this.reviewCount,
    required this.fullReviewCount,
    required this.calories,
    required this.description,
    required this.imagePath,
    this.tag1 = "100% Arabica",
    this.tag2 = "Medium Roast",
    this.defaultServingStyle = ServingStyle.iced,
    this.defaultCupSize = CupSize.medium,
    this.defaultShots = 2,
    this.defaultMilk = MilkOption.oat,
    this.defaultSweetness = SweetnessLevel.standard50,
    this.defaultIce = IceLevel.lessIce,
  });

  DrinkItem toHomeDrinkItem() {
    return DrinkItem(
      id: id,
      name: name,
      subtitle: subtitle,
      category: category,
      price: '\$${basePrice.toStringAsFixed(2)}',
      priceValue: basePrice,
      rating: rating,
      reviewCount: reviewCount,
      imagePath: imagePath,
    );
  }
}
