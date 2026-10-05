import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';

class TrackerTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackClick;
  final VoidCallback onMoreClick;
  final VoidCallback onProfileClick;

  const TrackerTopAppBar({
    super.key,
    this.title = 'Live Order Tracker',
    required this.onBackClick,
    required this.onMoreClick,
    required this.onProfileClick,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Material(
        color: kSandSurface,
        child: SafeArea(
          bottom: false,
          child: Container(
            height: 56.0,
            color: kSandSurface,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Back Button
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: kEspressoPrimary, size: 24),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
                  onPressed: onBackClick,
                ),

                const SizedBox(width: 2),

                // BrewCraft Logo
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: kCaramelSecondaryContainer.withValues(alpha: 0.45),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.coffee_rounded,
                      color: kCaramelSecondary,
                      size: 20,
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                // Title
                Expanded(
                  child: Text(
                    title,
                    style: BrewCraftTypography.titleLarge.copyWith(
                      fontWeight: FontWeight.w500,
                      color: kEspressoPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // More Options Button
                IconButton(
                  icon: const Icon(Icons.more_vert, color: kSandOnSurface, size: 22),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
                  onPressed: onMoreClick,
                ),

                // Profile Avatar
                GestureDetector(
                  onTap: onProfileClick,
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: kEspressoOutlineVariant, width: 1.5),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/profile.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

