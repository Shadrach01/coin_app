import 'package:coin_app/core/commons/widgets/custom_app_bar.dart';
import 'package:coin_app/core/utils/color_res.dart';
import 'package:flutter/material.dart';

class MarketOverviewScreenWidgets extends StatelessWidget {
  const MarketOverviewScreenWidgets({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom App Bar
            CustomAppBar(
              leadIcon: Icon(
                Icons.arrow_back_sharp,
                color: ColorRes.appGrey,
              ),
              title: Text(
                'Market Overview',
                style: TextStyle(
                  color: ColorRes.appWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: height * .015),

            // Current Coin market price
            Text(
              "\$209.182.356.841",
              style: TextStyle(
                color: ColorRes.appWhite,
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: height * .003),
            // The current date and time
            Text(
              "20 October 2025.18:30:29",
              style: TextStyle(
                color: ColorRes.appGrey,
                fontSize: 13,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
