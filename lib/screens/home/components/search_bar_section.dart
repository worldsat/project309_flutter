import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class SearchBarSection extends StatefulWidget {
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
  State<SearchBarSection> createState() => _SearchBarSectionState();
}

class _SearchBarSectionState extends State<SearchBarSection> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.query);
  }

  @override
  void didUpdateWidget(covariant SearchBarSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.query != _controller.text) {
      _controller.text = widget.query;
      _controller.selection = TextSelection.collapsed(offset: widget.query.length);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                controller: _controller,
                onChanged: widget.onQueryChange,
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
              onTap: widget.onVoiceClick,
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
              onTap: widget.onFilterClick,
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
