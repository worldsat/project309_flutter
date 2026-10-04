import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';

class CustomizerTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackClick;
  final VoidCallback onMoreClick;
  final VoidCallback onProfileClick;

  const CustomizerTopAppBar({
    super.key,
    this.title = 'Drink Customizer',
    required this.onBackClick,
    required this.onMoreClick,
    required this.onProfileClick,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      color: kSandSurface,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Back Button
          IconButton(
            icon: const Icon(Icons.arrow_back, color: kEspressoPrimary, size: 24),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
            onPressed: onBackClick,
          ),

          const SizedBox(width: 4),

          // Small logo coffee mark
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: kCaramelSecondaryContainer.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Icon(
                Icons.coffee_rounded,
                color: kCaramelSecondary,
                size: 20,
              ),
            ),
          ),

          const SizedBox(width: 10),

          // Title
          Expanded(
            child: Text(
              title,
              style: BrewCraftTypography.titleMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: kEspressoPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // More options button
          IconButton(
            icon: const Icon(Icons.more_vert, color: kEspressoPrimary, size: 22),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
            onPressed: onMoreClick,
          ),

          const SizedBox(width: 4),

          // Profile Avatar (Alex)
          GestureDetector(
            onTap: onProfileClick,
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kEspressoOutlineVariant, width: 1),
                image: const DecorationImage(
                  image: AssetImage('assets/images/profile.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

