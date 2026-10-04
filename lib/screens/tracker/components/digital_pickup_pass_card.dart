import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class DigitalPickupPassCard extends StatelessWidget {
  final String productName;
  final String productDetails;
  final String storeName;
  final String storeAddress;
  final VoidCallback onGetDirections;
  final VoidCallback onCallStore;

  const DigitalPickupPassCard({
    super.key,
    required this.productName,
    required this.productDetails,
    required this.storeName,
    required this.storeAddress,
    required this.onGetDirections,
    required this.onCallStore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: kSandSurfaceContainerLowest,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.qr_code_2,
                      color: kCaramelSecondary,
                      size: 22,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Digital Pickup Pass',
                      style: BrewCraftTypography.titleSmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kEspressoPrimary,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kCaramelSecondaryFixed.withValues(alpha: 0.5),
                    borderRadius: BrewCraftShapes.pill,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Text(
                    'Scan at Counter',
                    style: BrewCraftTypography.labelSmall.copyWith(
                      fontWeight: FontWeight.w500,
                      color: kCaramelSecondary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // QR Code Scan Module
            Container(
              decoration: BoxDecoration(
                color: kSandSurfaceContainerLow,
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  // QR Code Graphic in White Tile
                  Container(
                    width: 108,
                    height: 108,
                    decoration: BoxDecoration(
                      color: kSandSurfaceContainerLowest,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: CustomPaint(
                      size: const Size(92, 92),
                      painter: QrCodePainter(
                        qrColor: kEspressoPrimary,
                        bgColor: const Color(0xFFFAF3ED),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),

                  // Pass Summary Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: BrewCraftTypography.titleMedium.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kEspressoPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          productDetails,
                          style: BrewCraftTypography.bodySmall.copyWith(
                            color: kSandOnSurfaceVariant,
                            height: 16 / 12,
                          ),
                        ),
                        const SizedBox(height: 6),

                        // Auto-verified tag
                        Container(
                          decoration: const BoxDecoration(
                            color: kSandSurfaceContainer,
                            borderRadius: BrewCraftShapes.pill,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.verified,
                                color: kCaramelSecondary,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Auto-verified at counter',
                                style: const TextStyle(
                                  fontSize: 10.5,
                                  color: kSandOnSurface,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Store Location & Assist Chips
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: kCaramelSecondary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        storeName,
                        style: BrewCraftTypography.labelLarge.copyWith(
                          fontWeight: FontWeight.w600,
                          color: kEspressoPrimary,
                        ),
                      ),
                      Text(
                        storeAddress,
                        style: BrewCraftTypography.bodySmall.copyWith(
                          color: kSandOnSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Assist Chips Row
            Row(
              children: [
                // Get Directions
                Expanded(
                  child: GestureDetector(
                    onTap: onGetDirections,
                    child: Container(
                      height: 38,
                      decoration: const BoxDecoration(
                        color: kCaramelSecondaryFixed,
                        borderRadius: BrewCraftShapes.pill,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.directions_outlined,
                            color: kCaramelOnSecondaryFixed,
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Get Directions',
                            style: BrewCraftTypography.labelMedium.copyWith(
                              fontWeight: FontWeight.w600,
                              color: kCaramelOnSecondaryFixed,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                // Call Store
                Expanded(
                  child: GestureDetector(
                    onTap: onCallStore,
                    child: Container(
                      height: 38,
                      decoration: const BoxDecoration(
                        color: kSandSurfaceContainer,
                        borderRadius: BrewCraftShapes.pill,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.phone_outlined,
                            color: kEspressoPrimary,
                            size: 18,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Call Store',
                            style: BrewCraftTypography.labelMedium.copyWith(
                              fontWeight: FontWeight.w600,
                              color: kEspressoPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QrCodePainter extends CustomPainter {
  final Color qrColor;
  final Color bgColor;

  QrCodePainter({required this.qrColor, required this.bgColor});

  @override
  void paint(Canvas canvas, Size size) {
    final double scale = size.width / 100.0;
    double s(double v) => v * scale;

    void drawR(double x, double y, double w, double h, double rx, Color color) {
      final paint = Paint()..color = color;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(s(x), s(y), s(w), s(h)),
          Radius.circular(s(rx)),
        ),
        paint,
      );
    }

    // Top-Left Finder
    drawR(0, 0, 30, 30, 4, qrColor);
    drawR(5, 5, 20, 20, 2, bgColor);
    drawR(9, 9, 12, 12, 1, qrColor);

    // Top-Right Finder
    drawR(70, 0, 30, 30, 4, qrColor);
    drawR(75, 5, 20, 20, 2, bgColor);
    drawR(79, 9, 12, 12, 1, qrColor);

    // Bottom-Left Finder
    drawR(0, 70, 30, 30, 4, qrColor);
    drawR(5, 75, 20, 20, 2, bgColor);
    drawR(9, 79, 12, 12, 1, qrColor);

    // Data Blocks
    drawR(36, 8, 6, 6, 1, qrColor);
    drawR(46, 8, 6, 6, 1, qrColor);
    drawR(56, 16, 6, 6, 1, qrColor);
    drawR(36, 24, 6, 6, 1, qrColor);
    drawR(46, 24, 6, 6, 1, qrColor);
    drawR(10, 38, 6, 6, 1, qrColor);
    drawR(22, 44, 6, 6, 1, qrColor);
    drawR(36, 38, 8, 8, 2, qrColor);
    drawR(50, 38, 6, 6, 1, qrColor);
    drawR(62, 38, 6, 6, 1, qrColor);
    drawR(74, 38, 6, 6, 1, qrColor);
    drawR(86, 44, 6, 6, 1, qrColor);
    drawR(36, 52, 6, 6, 1, qrColor);
    drawR(48, 52, 8, 8, 2, qrColor);
    drawR(64, 52, 6, 6, 1, qrColor);
    drawR(76, 58, 6, 6, 1, qrColor);
    drawR(12, 58, 6, 6, 1, qrColor);
    drawR(36, 66, 6, 6, 1, qrColor);
    drawR(48, 66, 6, 6, 1, qrColor);
    drawR(62, 66, 6, 6, 1, qrColor);
    drawR(74, 74, 6, 6, 1, qrColor);
    drawR(84, 74, 6, 6, 1, qrColor);
    drawR(36, 80, 8, 8, 2, qrColor);
    drawR(52, 80, 6, 6, 1, qrColor);
    drawR(64, 80, 6, 6, 1, qrColor);
    drawR(76, 86, 6, 6, 1, qrColor);
    drawR(86, 86, 6, 6, 1, qrColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
