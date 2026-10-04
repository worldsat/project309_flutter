import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class TrackerHeaderBanner extends StatefulWidget {
  const TrackerHeaderBanner({super.key});

  @override
  State<TrackerHeaderBanner> createState() => _TrackerHeaderBannerState();
}

class _TrackerHeaderBannerState extends State<TrackerHeaderBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAlpha;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _pulseAlpha = Tween<double>(begin: 0.4, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LIVE PICKUP TRACKER',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: kCaramelSecondary,
                ),
              ),
              Text(
                'Your Brew is in Motion',
                style: BrewCraftTypography.headlineSmall.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kEspressoPrimary,
                ),
              ),
            ],
          ),

          // Live status pill badge
          Container(
            decoration: BoxDecoration(
              color: kCaramelSecondaryContainer,
              borderRadius: BrewCraftShapes.pill,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedBuilder(
                  animation: _pulseAlpha,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _pulseAlpha.value,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: kCaramelSecondary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 6),
                Text(
                  'Live',
                  style: BrewCraftTypography.labelMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: kCaramelOnSecondaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
