import 'package:flutter/material.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';

class PromotionsSection extends StatefulWidget {
  final String voucherCode;
  final bool voucherApplied;
  final ValueChanged<String> onVoucherCodeChange;
  final VoidCallback onApplyVoucher;
  final VoidCallback onRemoveVoucher;

  const PromotionsSection({
    super.key,
    required this.voucherCode,
    required this.voucherApplied,
    required this.onVoucherCodeChange,
    required this.onApplyVoucher,
    required this.onRemoveVoucher,
  });

  @override
  State<PromotionsSection> createState() => _PromotionsSectionState();
}

class _PromotionsSectionState extends State<PromotionsSection> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.voucherCode);
  }

  @override
  void didUpdateWidget(covariant PromotionsSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.voucherCode != _controller.text) {
      _controller.text = widget.voucherCode;
      _controller.selection = TextSelection.collapsed(offset: widget.voucherCode.length);
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
          Text(
            'Promotions & Benefits',
            style: BrewCraftTypography.titleSmall.copyWith(
              fontWeight: FontWeight.bold,
              color: kSandOnSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),

          // Voucher Input Box
          Container(
            decoration: BoxDecoration(
              color: kSandSurfaceContainerLow,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            padding: const EdgeInsets.all(6.0),
            child: Row(
              children: [
                const SizedBox(width: 6),
                const Icon(
                  Icons.confirmation_number_outlined,
                  color: kEspressoOutline,
                  size: 20,
                ),
                const SizedBox(width: 10),

                Expanded(
                  child: TextField(
                    controller: _controller,
                    onChanged: widget.onVoucherCodeChange,
                    cursorColor: kCaramelSecondary,
                    style: BrewCraftTypography.bodyMedium.copyWith(
                      color: kSandOnSurface,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter voucher code',
                      hintStyle: BrewCraftTypography.bodyMedium.copyWith(
                        color: kEspressoOutline,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),

                // Apply Button
                GestureDetector(
                  onTap: widget.onApplyVoucher,
                  child: Container(
                    decoration: BoxDecoration(
                      color: kEspressoPrimary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    alignment: Alignment.center,
                    child: Text(
                      'Apply',
                      style: BrewCraftTypography.labelMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Applied Voucher Tag Banner
          if (widget.voucherApplied)
            Container(
              decoration: BoxDecoration(
                color: kCaramelSecondaryFixed,
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            color: kCaramelSecondary,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.check,
                              color: kCaramelOnSecondary,
                              size: 15,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'BREWFIRST Applied',
                                style: BrewCraftTypography.titleSmall.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: kCaramelOnSecondaryFixed,
                                ),
                              ),
                              Text(
                                'First order artisanal discount (\$2.00 off)',
                                style: BrewCraftTypography.bodySmall.copyWith(
                                  color: kCaramelOnSecondaryFixed.withValues(alpha: 0.9),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onRemoveVoucher,
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.close,
                        color: kCaramelOnSecondaryFixed,
                        size: 18,
                      ),
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

