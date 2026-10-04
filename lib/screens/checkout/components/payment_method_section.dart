import 'package:flutter/material.dart';
import '../../../models/fulfillment_mode.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';

class PaymentMethodSection extends StatelessWidget {
  final PaymentMethod selectedPayment;
  final ValueChanged<PaymentMethod> onPaymentSelected;
  final VoidCallback onAddNewClicked;

  const PaymentMethodSection({
    super.key,
    required this.selectedPayment,
    required this.onPaymentSelected,
    required this.onAddNewClicked,
  });

  IconData _getMethodIcon(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.balance:
        return Icons.account_balance_wallet_outlined;
      case PaymentMethod.digitalWallet:
        return Icons.contactless_outlined;
      case PaymentMethod.card:
        return Icons.credit_card_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Payment Method',
                style: BrewCraftTypography.titleSmall.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kSandOnSurfaceVariant,
                ),
              ),
              GestureDetector(
                onTap: onAddNewClicked,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'Add New',
                    style: BrewCraftTypography.labelMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: kCaramelSecondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // 3 Options
          ...PaymentMethod.values.map((method) {
            final isSelected = method == selectedPayment;

            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: GestureDetector(
                onTap: () => onPaymentSelected(method),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? kSandSurfaceContainer : kSandSurfaceContainerLow,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ]
                        : null,
                  ),
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Icon Box
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: method == PaymentMethod.balance && isSelected
                                  ? kEspressoPrimary
                                  : kSandSurfaceContainerHighest,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Icon(
                                _getMethodIcon(method),
                                color: method == PaymentMethod.balance && isSelected
                                    ? Colors.white
                                    : kSandOnSurface,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),

                          // Method Info
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    method.title,
                                    style: BrewCraftTypography.titleSmall.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: kSandOnSurface,
                                    ),
                                  ),
                                  if (method.badge != null) ...[
                                    const SizedBox(width: 6),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: kCaramelSecondaryFixed,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      child: Text(
                                        method.badge!,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: kCaramelOnSecondaryFixed,
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                              Text(
                                method.subtitle,
                                style: BrewCraftTypography.bodySmall.copyWith(
                                  fontWeight: method == PaymentMethod.balance
                                      ? FontWeight.w500
                                      : FontWeight.normal,
                                  color: method == PaymentMethod.balance
                                      ? kCaramelSecondary
                                      : kSandOnSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Radio Check
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: isSelected ? kEspressoPrimary : kSandSurfaceContainerHigh,
                          shape: BoxShape.circle,
                        ),
                        child: isSelected
                            ? const Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              )
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
