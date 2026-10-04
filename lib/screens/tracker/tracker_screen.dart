import 'package:flutter/material.dart';
import '../../models/tracker_models.dart';
import '../../theme/colors.dart';
import '../../widgets/custom_toast.dart';
import 'components/active_order_status_card.dart';
import 'components/atmosphere_visual_card.dart';
import 'components/digital_pickup_pass_card.dart';
import 'components/loyalty_rewards_card.dart';
import 'components/tracker_action_buttons.dart';
import 'components/tracker_header_banner.dart';
import 'components/tracker_top_app_bar.dart';

class TrackerScreen extends StatefulWidget {
  final VoidCallback onNavigateBack;

  const TrackerScreen({
    super.key,
    required this.onNavigateBack,
  });

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  final String _orderNumber = '#BC-8924';
  final String _pickupBar = 'Pickup Bar 2';
  final int _estimatedMinutesRemaining = 6;
  final String _baristaName = 'Barista Liam';
  final String _baristaNote =
      'Foaming your velvety oat milk & pulling fresh double origin shots.';
  final String _productName = '1x Iced Oat Honey Latte';
  final String _productDetails = 'Large (20oz) • Extra espresso shot • Light ice';
  final String _storeName = 'Downtown Roastery';
  final String _storeAddress = '412 5th Ave, New York • 0.3 mi away';
  final String _memberName = 'Alex';
  int _memberBeans = 148;
  final int _beansBrewing = 12;
  final int _beansToNextTier = 52;
  final int _goldTierTarget = 200;
  final double _progressPercent = 0.74;

  final List<RedeemableReward> _rewards = const [
    RedeemableReward(
      id: 'flavor',
      title: 'Free Flavor Shot',
      description: 'Vanilla, Caramel or Hazelnut',
      costBeans: 30,
    ),
    RedeemableReward(
      id: 'pastry',
      title: 'Artisan Pastry',
      description: 'Butter Croissant or Almond Danish',
      costBeans: 80,
    ),
  ];

  bool _isGeneratingReceipt = false;
  bool _receiptSaved = false;

  void _handleDownloadReceipt() async {
    setState(() => _isGeneratingReceipt = true);
    showBrewCraftToast(context, 'Generating PDF Receipt...');
    await Future.delayed(const Duration(milliseconds: 1200));
    if (!mounted) return;
    setState(() {
      _isGeneratingReceipt = false;
      _receiptSaved = true;
    });
    showBrewCraftToast(context, 'Order Receipt Saved! (BC-8924.pdf)');
  }

  void _handleRedeemReward(String rewardId) {
    final reward = _rewards.firstWhere((r) => r.id == rewardId);
    if (_memberBeans >= reward.costBeans) {
      setState(() {
        _memberBeans -= reward.costBeans;
      });
      showBrewCraftToast(context, 'Redeemed ${reward.title} for ${reward.costBeans} beans!');
    } else {
      showBrewCraftToast(context, 'Not enough beans to redeem this reward yet.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSandSurface,
      appBar: TrackerTopAppBar(
        title: 'Live Order Tracker',
        onBackClick: widget.onNavigateBack,
        onMoreClick: () {
          showBrewCraftToast(context, 'Tracker settings & share order link');
        },
        onProfileClick: () {
          showBrewCraftToast(context, 'Signed in as Alex');
        },
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24.0),
        children: [
          // Live Pickup Tracker Banner
          const TrackerHeaderBanner(),

          // Active Order Status Card with Stepper & Barista Note
          ActiveOrderStatusCard(
            orderNumber: _orderNumber,
            pickupBar: _pickupBar,
            remainingMinutes: _estimatedMinutesRemaining,
            baristaName: _baristaName,
            baristaNote: _baristaNote,
          ),

          // Digital Pickup Pass & Store QR Card
          DigitalPickupPassCard(
            productName: _productName,
            productDetails: _productDetails,
            storeName: _storeName,
            storeAddress: _storeAddress,
            onGetDirections: () {
              showBrewCraftToast(context, 'Opening directions to $_storeAddress in Maps...');
            },
            onCallStore: () {
              showBrewCraftToast(context, 'Calling $_storeName at (212) 555-0194...');
            },
          ),

          // Loyalty & Rewards Progress Card
          LoyaltyRewardsCard(
            memberName: _memberName,
            memberBeans: _memberBeans,
            beansBrewing: _beansBrewing,
            beansToNextTier: _beansToNextTier,
            goldTierTarget: _goldTierTarget,
            progressPercent: _progressPercent,
            rewards: _rewards,
            onRedeemReward: _handleRedeemReward,
          ),

          // Store Atmosphere Sensory Visual Card
          const AtmosphereVisualCard(),

          // Bottom Action Buttons (Download Receipt & Help)
          TrackerActionButtons(
            isGeneratingReceipt: _isGeneratingReceipt,
            receiptSaved: _receiptSaved,
            onDownloadReceipt: _handleDownloadReceipt,
            onNeedHelp: () {
              showBrewCraftToast(context, 'BrewCraft Concierge: Contacting barista team for $_orderNumber...');
            },
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
