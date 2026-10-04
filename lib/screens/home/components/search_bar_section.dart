import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class SearchBarSection extends StatelessWidget {
  final String query;
  final ValueChanged<String> onQueryChange;
  final VoidCallback onVoiceClick;
  final VoidCallback onFilterClick;

  const SearchBarSection({
    super.key,
    required this.query,
    required this.onQueryChange,
    required this.onVoiceClick,
    required this.onFilterClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Container(
        height: 56.0,
        decoration: const BoxDecoration(
          color: kSandSurfaceContainer,
          borderRadius: BrewCraftShapes.pill,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Search icon
            const Icon(
              Icons.search,
              color: kSandOnSurfaceVariant,
              size: 22,
            ),
            const SizedBox(width: 12),

            // Search text input
            Expanded(
              child: TextField(
                onChanged: onQueryChange,
                controller: TextEditingController(text: query)..selection = TextSelection.collapsed(offset: query.length),
                cursorColor: kEspressoPrimary,
                style: BrewCraftTypography.bodyMedium.copyWith(
                  color: kSandOnSurface,
                ),
                decoration: InputDecoration(
                  hintText: 'Search coffee, roast, pastries...',
                  hintStyle: BrewCraftTypography.bodyMedium.copyWith(
                    color: kSandOnSurfaceVariant,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            const SizedBox(width: 8),

            // Voice search button
            GestureDetector(
              onTap: onVoiceClick,
              child: Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.mic_none,
                    color: kSandOnSurfaceVariant,
                    size: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),

            // Filter button in circular surface
            GestureDetector(
              onTap: onFilterClick,
              child: Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  color: kSandSurfaceContainerHigh,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.tune,
                    color: kEspressoPrimary,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
