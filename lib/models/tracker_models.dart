enum TrackerStep {
  received('Order\nReceived'),
  brewing('Brewing &\nCrafting'),
  ready('Ready for\nPickup'),
  enjoy('Enjoy!');

  final String title;
  const TrackerStep(this.title);
}

class RedeemableReward {
  final String id;
  final String title;
  final String description;
  final int costBeans;

  const RedeemableReward({
    required this.id,
    required this.title,
    required this.description,
    required this.costBeans,
  });
}
