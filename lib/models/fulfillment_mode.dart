enum FulfillmentMode {
  pickup(
    title: 'Pickup',
    timing: '10-15 mins',
    fee: 0.50,
    feeLabel: 'Pickup Packaging & Prep',
  ),
  delivery(
    title: 'Fast Delivery',
    timing: '25-30 mins',
    fee: 2.50,
    feeLabel: 'Delivery & Dispatch Fee',
  );

  final String title;
  final String timing;
  final double fee;
  final String feeLabel;

  const FulfillmentMode({
    required this.title,
    required this.timing,
    required this.fee,
    required this.feeLabel,
  });
}

enum PaymentMethod {
  balance(
    title: 'BrewCraft Balance',
    subtitle: 'Available: \$24.50',
    badge: 'Fastest',
  ),
  digitalWallet(
    title: 'Apple Pay / Google Pay',
    subtitle: 'Default device card',
  ),
  card(
    title: 'Mastercard ending in 4242',
    subtitle: 'Expires 09/27',
  );

  final String title;
  final String subtitle;
  final String? badge;

  const PaymentMethod({
    required this.title,
    required this.subtitle,
    this.badge,
  });
}
