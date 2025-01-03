import 'package:coin_app/core/utils/color_res.dart';
import 'package:coin_app/features/coin_market/presentation/widgets/coin_market_screen_widgets.dart';
import 'package:flutter/material.dart';

class CoinMarketScreen extends StatelessWidget {
  const CoinMarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      body: CoinMarketScreenWidgets(),
    );
  }
}
