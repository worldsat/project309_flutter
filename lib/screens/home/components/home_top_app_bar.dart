import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';

class BrewCraftTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String branchName;
  final VoidCallback onBranchClick;
  final VoidCallback onNotificationClick;
  final VoidCallback onProfileClick;

  const BrewCraftTopAppBar({
    super.key,
    required this.branchName,
    required this.onBranchClick,
    required this.onNotificationClick,
    required this.onProfileClick,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.0,
      color: kSandSurface,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            // Left side: Logo badge + Brand title + Branch location
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Coffee logo icon badge
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: kSandSurfaceContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.coffee_rounded,
                      color: kEspressoPrimary,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'BrewCraft',
                          style: BrewCraftTypography.titleSmall.copyWith(
                            fontWeight: FontWeight.bold,
                            color: kEspressoPrimary,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '• Explore',
                          style: BrewCraftTypography.labelSmall.copyWith(
                            color: kSandOnSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    GestureDetector(
                      onTap: onBranchClick,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: kCaramelSecondary,
                            size: 15,
                          ),
                          const SizedBox(width: 2),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 135),
                            child: Text(
                              branchName,
                              style: BrewCraftTypography.labelSmall.copyWith(
                                color: kSandOnSurfaceVariant,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Icon(
                            Icons.expand_more,
                            color: kSandOnSurfaceVariant,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Right side: Notification bell + Alex profile avatar
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: onNotificationClick,
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: kSandOnSurface,
                    size: 22,
                  ),
                  splashRadius: 20,
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: onProfileClick,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: kSandSurfaceContainerHighest,
                        width: 1.5,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
