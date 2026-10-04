class CartItem {
  final String id;
  final String name;
  final String description;
  final double unitPrice;
  final int quantity;
  final String imagePath;

  const CartItem({
    required this.id,
    required this.name,
    required this.description,
    required this.unitPrice,
    required this.quantity,
    required this.imagePath,
  });

  double get linePrice => unitPrice * quantity;

  String get formattedUnitPrice => '\$${unitPrice.toStringAsFixed(2)}';

  CartItem copyWith({
    String? id,
    String? name,
    String? description,
    double? unitPrice,
    int? quantity,
    String? imagePath,
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      unitPrice: unitPrice ?? this.unitPrice,
      quantity: quantity ?? this.quantity,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
