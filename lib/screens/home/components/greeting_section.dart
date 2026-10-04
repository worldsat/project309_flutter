import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class GreetingSection extends StatelessWidget {
  final String greeting;
  final String userTier;
  final String readyEstimate;

  const GreetingSection({
    super.key,
    required this.greeting,
    required this.userTier,
    required this.readyEstimate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main greeting row with Tier badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                greeting,
                style: BrewCraftTypography.headlineSmall.copyWith(
                  fontWeight: FontWeight.w600,
                  color: kEspressoPrimary,
                ),
              ),

              // Tier Gold Pill
              Container(
                decoration: const BoxDecoration(
                  color: kCaramelSecondaryContainer,
                  borderRadius: BrewCraftShapes.pill,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.bolt,
                      color: kCaramelOnSecondaryContainer,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      userTier,
                      style: BrewCraftTypography.labelSmall.copyWith(
                        fontWeight: FontWeight.w600,
                        color: kCaramelOnSecondaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),

          // Subtitle status row: "Ready in ~10 mins at Downtown Roastery"
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.schedule,
                color: kCaramelSecondary,
                size: 16,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: BrewCraftTypography.bodySmall.copyWith(
                      color: kSandOnSurfaceVariant,
                    ),
                    children: _buildStatusSpans(readyEstimate),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<TextSpan> _buildStatusSpans(String text) {
    const highlight = '~10 mins';
    if (!text.contains(highlight)) {
      return [TextSpan(text: text)];
    }
    final parts = text.split(highlight);
    return [
      TextSpan(text: parts[0]),
      const TextSpan(
        text: highlight,
        style: TextStyle(
          color: kEspressoPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
      if (parts.length > 1) TextSpan(text: parts[1]),
    ];
  }
}
