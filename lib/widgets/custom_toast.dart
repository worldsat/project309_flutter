import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/shapes.dart';
import '../theme/typography.dart';

void showBrewCraftToast(BuildContext context, String message) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
      content: Center(
        child: Container(
          decoration: BoxDecoration(
            color: kSandOnSurface,
            borderRadius: BrewCraftShapes.pill,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.18),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check,
                size: 18,
                color: kCaramelSecondaryFixed,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  message,
                  style: BrewCraftTypography.labelMedium.copyWith(
                    color: kSandSurfaceContainerLowest,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}
