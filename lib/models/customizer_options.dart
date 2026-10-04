enum ServingStyle {
  iced('Iced'),
  hot('Hot');

  final String title;
  const ServingStyle(this.title);
}

enum CupSize {
  small('Small', '8 oz', 0.00, 'Standard'),
  medium('Medium', '12 oz', 0.60, '+\$0.60'),
  large('Large', '16 oz', 1.20, '+\$1.20');

  final String title;
  final String volume;
  final double surcharge;
  final String surchargeLabel;
  const CupSize(this.title, this.volume, this.surcharge, this.surchargeLabel);
}

enum MilkOption {
  oat('Oat Milk', 0.50, 'Oat Milk (+\$0.50)'),
  almond('Almond Milk', 0.50, 'Almond Milk'),
  whole('Whole Milk', 0.00, 'Whole Milk'),
  skim('Skim Milk', 0.00, 'Skim Milk'),
  coconut('Coconut Milk', 0.50, 'Coconut Milk');

  final String title;
  final double surcharge;
  final String displayLabel;
  const MilkOption(this.title, this.surcharge, this.displayLabel);
}

enum SweetnessLevel {
  noSugar('No Sugar'),
  mild25('25% Mild'),
  standard50('50% Standard'),
  sweet100('100% Sweet');

  final String title;
  const SweetnessLevel(this.title);
}

enum IceLevel {
  noIce('No Ice'),
  lessIce('Less Ice'),
  regularIce('Regular Ice');

  final String title;
  const IceLevel(this.title);
}
