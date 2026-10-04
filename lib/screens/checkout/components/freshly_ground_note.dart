import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';

class FreshlyGroundNote extends StatelessWidget {
  const FreshlyGroundNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: kSandSurfaceContainerLow,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: kCaramelSecondaryFixed,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.eco_outlined,
                  color: kCaramelOnSecondaryFixed,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Freshly Ground Upon Arrival',
                    style: BrewCraftTypography.titleSmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: kSandOnSurface,
                    ),
                  ),
                  Text(
                    'Prepared with 100% shade-grown fair trade beans.',
                    style: BrewCraftTypography.bodySmall.copyWith(
                      color: kSandOnSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
