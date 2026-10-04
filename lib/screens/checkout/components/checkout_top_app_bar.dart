import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';

class CheckoutTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackClick;
  final VoidCallback onMoreClick;

  const CheckoutTopAppBar({
    super.key,
    required this.title,
    required this.onBackClick,
    required this.onMoreClick,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kSandSurface,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: kEspressoPrimary),
        onPressed: onBackClick,
      ),
      title: Text(
        title,
        style: BrewCraftTypography.titleMedium.copyWith(
          fontWeight: FontWeight.bold,
          color: kEspressoPrimary,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert, color: kSandOnSurface),
          onPressed: onMoreClick,
        ),
      ],
    );
  }
}
