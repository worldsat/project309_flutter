import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class ActiveOrderStatusCard extends StatefulWidget {
  final String orderNumber;
  final String pickupBar;
  final int remainingMinutes;
  final String baristaName;
  final String baristaNote;

  const ActiveOrderStatusCard({
    super.key,
    required this.orderNumber,
    required this.pickupBar,
    required this.remainingMinutes,
    required this.baristaName,
    required this.baristaNote,
  });

  @override
  State<ActiveOrderStatusCard> createState() => _ActiveOrderStatusCardState();
}

class _ActiveOrderStatusCardState extends State<ActiveOrderStatusCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseScale;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _pulseScale = Tween<double>(begin: 1.0, end: 1.35).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: kSandSurfaceContainerLow,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              // Decorative warm ambient glow
              Positioned(
                top: -30,
                right: -30,
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        kCaramelSecondaryFixed.withValues(alpha: 0.45),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Header Details Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ORDER ${widget.orderNumber}',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.0,
                                color: kSandOnSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                const Icon(
                                  Icons.timer_outlined,
                                  color: kCaramelSecondary,
                                  size: 18,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '${widget.remainingMinutes} mins remaining',
                                  style: BrewCraftTypography.titleMedium.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: kEspressoPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // Pickup Bar Pill
                        Container(
                          decoration: const BoxDecoration(
                            color: kSandSurfaceContainer,
                            borderRadius: BrewCraftShapes.pill,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          child: Text(
                            widget.pickupBar,
                            style: BrewCraftTypography.labelSmall.copyWith(
                              fontWeight: FontWeight.w500,
                              color: kSandOnSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // M3 Progress Stepper
                    _buildProgressStepper(),
                    const SizedBox(height: 16),

                    // Barista Warm Note & Portrait
                    Container(
                      decoration: BoxDecoration(
                        color: kSandSurfaceContainer,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  'assets/images/profile.png',
                                  width: 44,
                                  height: 44,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: const BoxDecoration(
                                    color: kCaramelSecondary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: kCaramelOnSecondary,
                                      size: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.baristaName,
                                  style: BrewCraftTypography.labelMedium.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: kEspressoPrimary,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  widget.baristaNote,
                                  style: BrewCraftTypography.bodySmall.copyWith(
                                    color: kSandOnSurfaceVariant,
                                    height: 16 / 12,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressStepper() {
    return Stack(
      children: [
        // Connecting Progress Bar Track
        Positioned(
          top: 18,
          left: 24,
          right: 24,
          child: Container(
            height: 4,
            decoration: const BoxDecoration(
              color: kSandSurfaceContainerHighest,
              borderRadius: BrewCraftShapes.pill,
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.42,
              child: Container(
                decoration: const BoxDecoration(
                  color: kCaramelSecondary,
                  borderRadius: BrewCraftShapes.pill,
                ),
              ),
            ),
          ),
        ),

        // Stepper Nodes Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Step 1: Received (Completed)
            _buildStepNode(
              icon: Icons.check,
              title: 'Order\nReceived',
              containerColor: kEspressoPrimary,
              contentColor: kEspressoOnPrimary,
              textColor: kEspressoPrimary,
              isBold: false,
            ),

            // Step 2: Brewing (Active) with pulsating ring
            Stack(
              alignment: Alignment.topCenter,
              children: [
                AnimatedBuilder(
                  animation: _pulseScale,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _pulseScale.value,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: kCaramelSecondaryFixed.withValues(alpha: 0.5),
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  },
                ),
                _buildStepNode(
                  icon: Icons.coffee_rounded,
                  title: 'Brewing &\nCrafting',
                  containerColor: kCaramelSecondary,
                  contentColor: kCaramelOnSecondary,
                  textColor: kCaramelSecondary,
                  isBold: true,
                ),
              ],
            ),

            // Step 3: Ready (Upcoming)
            _buildStepNode(
              icon: Icons.storefront_outlined,
              title: 'Ready for\nPickup',
              containerColor: kSandSurfaceContainerHigh,
              contentColor: kSandOnSurfaceVariant,
              textColor: kSandOnSurfaceVariant,
              isBold: false,
            ),

            // Step 4: Enjoy (Upcoming)
            _buildStepNode(
              icon: Icons.sentiment_satisfied_alt_outlined,
              title: 'Enjoy!',
              containerColor: kSandSurfaceContainerHigh,
              contentColor: kSandOnSurfaceVariant,
              textColor: kSandOnSurfaceVariant,
              isBold: false,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStepNode({
    required IconData icon,
    required String title,
    required Color containerColor,
    required Color contentColor,
    required Color textColor,
    required bool isBold,
  }) {
    return SizedBox(
      width: 72,
      child: Column(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: containerColor,
              shape: BoxShape.circle,
              boxShadow: isBold
                  ? [
                      BoxShadow(
                        color: containerColor.withValues(alpha: 0.3),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
            child: Center(
              child: Icon(
                icon,
                color: contentColor,
                size: 18,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: TextStyle(
              fontSize: 11,
              height: 14 / 11,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
