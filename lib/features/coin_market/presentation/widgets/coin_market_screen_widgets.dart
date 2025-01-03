import 'package:coin_app/core/commons/widgets/coin_tile.dart';
import 'package:coin_app/core/commons/widgets/custom_app_bar.dart';
import 'package:coin_app/core/utils/color_res.dart';
import 'package:coin_app/features/market_overview/presentation/view/market_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoinMarketScreenWidgets extends StatelessWidget {
  const CoinMarketScreenWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * .05,
          vertical: height * .01,
        ),
        child: Column(
          spacing: height * .03,
          children: [
            // App bar
            CustomAppBar(
              leadIcon: Icon(
                Icons.search,
                color: ColorRes.appGrey,
                size: height * .025,
              ),
              title: Text(
                "Coin Market",
                style: TextStyle(
                  color: ColorRes.appWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailingIcon: Icon(
                Icons.bar_chart,
                color: ColorRes.appGrey,
                size: height * .023,
              ),
            ),

            // Rank, Volume, and time differences
            Row(
              spacing: width * .05,
              children: [
                Container(
                  height: height * .032,
                  width: width * .14,
                  color: ColorRes.appWhite.withOpacity(.05),
                  child: Center(
                    child: Text(
                      "Rank",
                      style: TextStyle(
                        color: ColorRes.appWhite,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height * .032,
                  width: width * .18,
                  color: ColorRes.appWhite.withOpacity(.05),
                  child: Center(
                    child: Text(
                      "Volume",
                      style: TextStyle(
                        color: ColorRes.appWhite,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: height * .032,
                  width: width * .19,
                  color: ColorRes.appWhite.withOpacity(.05),
                  child: Center(
                    child: Text(
                      "24 Hours",
                      style: TextStyle(
                        color: ColorRes.appWhite,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // List of coins
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return CoinTile(
                    onTap: () => Get.to(
                      () => MarketOverviewScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
