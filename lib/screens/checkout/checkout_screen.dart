import 'package:flutter/material.dart';
import '../../models/cart_item.dart';
import '../../models/fulfillment_mode.dart';
import '../../theme/colors.dart';
import '../../widgets/custom_toast.dart';
import 'components/cart_items_list_section.dart';
import 'components/checkout_header_section.dart';
import 'components/checkout_sticky_bottom_bar.dart';
import 'components/checkout_top_app_bar.dart';
import 'components/freshly_ground_note.dart';
import 'components/fulfillment_toggle.dart';
import 'components/payment_method_section.dart';
import 'components/price_breakdown_card.dart';
import 'components/promotions_section.dart';

class CheckoutScreen extends StatefulWidget {
  final List<CartItem> initialItems;
  final VoidCallback onNavigateBack;
  final VoidCallback onNavigateToTracker;
  final VoidCallback onAddMoreItems;

  const CheckoutScreen({
    super.key,
    required this.initialItems,
    required this.onNavigateBack,
    required this.onNavigateToTracker,
    required this.onAddMoreItems,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final String _branchName = 'Downtown Roastery';
  FulfillmentMode _fulfillmentMode = FulfillmentMode.pickup;
  late List<CartItem> _items;
  String _voucherCode = 'BREWFIRST';
  bool _voucherApplied = true;
  final double _voucherDiscountAmount = 2.00;
  PaymentMethod _selectedPayment = PaymentMethod.balance;
  bool _isSubmitting = false;
  bool _orderSubmitted = false;

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.initialItems);
    if (_items.isEmpty) {
      _items = [
        const CartItem(
          id: 'cart-item-1',
          name: 'Caramel Macchiato',
          description: 'Medium • Oat Milk • 50% Sweetness • Less Ice',
          unitPrice: 5.95,
          quantity: 1,
          imagePath: 'assets/images/caramel_macchiato.png',
        ),
        const CartItem(
          id: 'cart-item-2',
          name: 'Almond Croissant',
          description: 'Warm & toasted • Butter glaze',
          unitPrice: 3.80,
          quantity: 1,
          imagePath: 'assets/images/almond_croissant.png',
        ),
      ];
    }
  }

  double get _subtotal => _items.fold(0.0, (sum, item) => sum + item.unitPrice * item.quantity);
  double get _fulfillmentFee => _items.isNotEmpty ? _fulfillmentMode.fee : 0.0;
  double get _discount => (_voucherApplied && _items.isNotEmpty) ? _voucherDiscountAmount : 0.0;
  double get _taxableAmount => (_subtotal + _fulfillmentFee - _discount).clamp(0.0, 9999.0);
  double get _estimatedTax => _items.isNotEmpty ? (_taxableAmount * 0.085) : 0.0;
  double get _totalAmount => (_subtotal + _fulfillmentFee - _discount + _estimatedTax).clamp(0.0, 9999.0);

  int get _totalItemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  String get _formattedSubtotal => '\$${_subtotal.toStringAsFixed(2)}';
  String get _formattedFee => '\$${_fulfillmentFee.toStringAsFixed(2)}';
  String get _formattedDiscount => '-\$${_discount.toStringAsFixed(2)}';
  String get _formattedTax => '\$${_estimatedTax.toStringAsFixed(2)}';
  String get _formattedTotal => '\$${_totalAmount.toStringAsFixed(2)}';

  void _handleUpdateQuantity(String itemId, int delta) {
    setState(() {
      final index = _items.indexWhere((it) => it.id == itemId);
      if (index != -1) {
        final newQty = (_items[index].quantity + delta).clamp(1, 10);
        _items[index] = _items[index].copyWith(quantity: newQty);
      }
    });
  }

  void _handleRemoveItem(String itemId) {
    final index = _items.indexWhere((it) => it.id == itemId);
    final removed = index != -1 ? _items[index] : null;
    setState(() {
      _items.removeWhere((it) => it.id == itemId);
    });
    if (removed != null) {
      showBrewCraftToast(context, 'Removed ${removed.name} from bag');
    }
  }

  void _handleApplyVoucher() {
    if (_voucherCode.trim().isNotEmpty) {
      setState(() => _voucherApplied = true);
      showBrewCraftToast(context, '${_voucherCode.trim()} coupon applied (-\$2.00)');
    }
  }

  void _handleRemoveVoucher() {
    setState(() {
      _voucherApplied = false;
      _voucherCode = '';
    });
    showBrewCraftToast(context, 'Voucher removed');
  }

  void _handlePlaceOrder() async {
    setState(() => _isSubmitting = true);
    await Future.delayed(const Duration(milliseconds: 700));
    if (!mounted) return;
    setState(() {
      _isSubmitting = false;
      _orderSubmitted = true;
    });
    showBrewCraftToast(context, 'Order Placed! #BC-8942 • $_branchName');
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    widget.onNavigateToTracker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSandSurface,
      appBar: CheckoutTopAppBar(
        title: 'Checkout',
        onBackClick: widget.onNavigateBack,
        onMoreClick: () {
          showBrewCraftToast(context, 'Order settings & invoice options');
        },
        onProfileClick: () {
          showBrewCraftToast(context, 'Signed in as Alex');
        },
      ),
      bottomNavigationBar: CheckoutStickyBottomBar(
        totalAmount: _formattedTotal,
        fulfillmentMode: _fulfillmentMode,
        isSubmitting: _isSubmitting,
        orderSubmitted: _orderSubmitted,
        onPlaceOrderClicked: _handlePlaceOrder,
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 16.0),
        children: [
          // Header Review Order & Downtown Roastery Badge
          CheckoutHeaderSection(branchName: _branchName),

          // Pickup vs Fast Delivery Segmented Toggle
          FulfillmentToggle(
            selectedMode: _fulfillmentMode,
            onModeSelected: (mode) {
              setState(() => _fulfillmentMode = mode);
            },
          ),

          // Cart Items Section (with Item Cards & "Add More" tile)
          CartItemsListSection(
            items: _items,
            onUpdateQuantity: _handleUpdateQuantity,
            onRemoveItem: _handleRemoveItem,
            onAddMoreClicked: () {
              widget.onAddMoreItems();
              showBrewCraftToast(context, 'Browse Bakery & Roastery');
            },
          ),

          // Promotions & Benefits Section (Input & Applied Voucher Banner)
          PromotionsSection(
            voucherCode: _voucherCode,
            voucherApplied: _voucherApplied,
            onVoucherCodeChange: (code) {
              setState(() => _voucherCode = code);
            },
            onApplyVoucher: _handleApplyVoucher,
            onRemoveVoucher: _handleRemoveVoucher,
          ),

          // Price Breakdown Card
          PriceBreakdownCard(
            totalItems: _totalItemCount,
            formattedSubtotal: _formattedSubtotal,
            fulfillmentMode: _fulfillmentMode,
            formattedFee: _formattedFee,
            voucherApplied: _voucherApplied,
            discount: _discount,
            formattedDiscount: _formattedDiscount,
            formattedTax: _formattedTax,
            formattedTotal: _formattedTotal,
          ),

          // Payment Method Selector
          PaymentMethodSection(
            selectedPayment: _selectedPayment,
            onPaymentSelected: (pay) {
              setState(() => _selectedPayment = pay);
            },
            onAddNewClicked: () {
              showBrewCraftToast(context, 'Add new payment card');
            },
          ),

          // Extra Coffee Roaster Promise & Delight Note
          const FreshlyGroundNote(),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
