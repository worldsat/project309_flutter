import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/shapes.dart';
import '../../../theme/typography.dart';

class BaristaNotesSection extends StatefulWidget {
  final String notes;
  final ValueChanged<String> onNotesChange;

  const BaristaNotesSection({
    super.key,
    required this.notes,
    required this.onNotesChange,
  });

  @override
  State<BaristaNotesSection> createState() => _BaristaNotesSectionState();
}

class _BaristaNotesSectionState extends State<BaristaNotesSection> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.notes);
  }

  @override
  void didUpdateWidget(covariant BaristaNotesSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.notes != _controller.text) {
      _controller.text = widget.notes;
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Row(
            children: [
              const Icon(
                Icons.edit_note,
                color: kCaramelSecondary,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                'Barista Notes',
                style: BrewCraftTypography.titleSmall.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kEspressoPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Input Container
          Container(
            decoration: BoxDecoration(
              color: kSandSurfaceContainer,
              borderRadius: BrewCraftShapes.medium,
            ),
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 54,
                  child: TextField(
                    controller: _controller,
                    onChanged: widget.onNotesChange,
                    maxLines: 2,
                    cursorColor: kCaramelSecondary,
                    style: BrewCraftTypography.bodyMedium.copyWith(
                      color: kSandOnSurface,
                    ),
                    decoration: InputDecoration(
                      hintText: 'e.g. Extra hot, light caramel drizzle, extra napkin...',
                      hintStyle: BrewCraftTypography.bodyMedium.copyWith(
                        color: kSandOnSurfaceVariant.withValues(alpha: 0.65),
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                Text(
                  'Optional',
                  style: BrewCraftTypography.labelSmall.copyWith(
                    color: kSandOnSurfaceVariant,
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
