import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class TrackerActionButtons extends StatelessWidget {
  final bool isGeneratingReceipt;
  final bool receiptSaved;
  final VoidCallback onDownloadReceipt;
  final VoidCallback onNeedHelp;

  const TrackerActionButtons({
    super.key,
    required this.isGeneratingReceipt,
    required this.receiptSaved,
    required this.onDownloadReceipt,
    required this.onNeedHelp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          // Download Order Receipt Button
          GestureDetector(
            onTap: isGeneratingReceipt ? null : onDownloadReceipt,
            child: Container(
              width: double.infinity,
              height: 44,
              decoration: const BoxDecoration(
                borderRadius: BrewCraftShapes.pill,
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isGeneratingReceipt) ...[
                    const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: kEspressoPrimary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Generating Receipt...',
                      style: BrewCraftTypography.labelLarge.copyWith(
                        fontWeight: FontWeight.w500,
                        color: kEspressoPrimary,
                      ),
                    ),
                  ] else if (receiptSaved) ...[
                    const Icon(
                      Icons.check,
                      color: kCaramelSecondary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Receipt Saved! (PDF)',
                      style: BrewCraftTypography.labelLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kCaramelSecondary,
                      ),
                    ),
                  ] else ...[
                    const Icon(
                      Icons.receipt_long_outlined,
                      color: kEspressoPrimary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Download Order Receipt (PDF)',
                      style: BrewCraftTypography.labelLarge.copyWith(
                        fontWeight: FontWeight.w500,
                        color: kEspressoPrimary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 6),

          // Need Help or Report an Issue Button
          GestureDetector(
            onTap: onNeedHelp,
            child: Container(
              width: double.infinity,
              height: 42,
              decoration: const BoxDecoration(
                borderRadius: BrewCraftShapes.pill,
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.help_outline,
                    color: kSandOnSurfaceVariant,
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Need Help or Report an Issue?',
                    style: BrewCraftTypography.labelMedium.copyWith(
                      fontWeight: FontWeight.normal,
                      color: kSandOnSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
