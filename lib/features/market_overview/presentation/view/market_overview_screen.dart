import 'package:coin_app/core/utils/color_res.dart';
import 'package:coin_app/features/market_overview/presentation/widgets/market_overview_screen_widgets.dart';
import 'package:flutter/material.dart';

class MarketOverviewScreen extends StatelessWidget {
  const MarketOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      body: MarketOverviewScreenWidgets(),
    );
  }
}
