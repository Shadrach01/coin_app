import 'package:coin_app/core/commons/widgets/app_container.dart';
import 'package:coin_app/core/commons/widgets/custom_app_bar.dart';
import 'package:coin_app/core/utils/color_res.dart';
import 'package:coin_app/features/home_page/presentation/widgets/coin_tile.dart';
import 'package:coin_app/features/home_page/show_portfolios/show_portfolios.dart';
import 'package:flutter/material.dart';

class HomeScreenWidgets extends StatelessWidget {
  const HomeScreenWidgets({super.key});

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
            CustomAppBar(
              leadIcon: Icon(
                Icons.bar_chart,
                color: ColorRes.appGrey,
                size: 20,
              ),
              title: Text(
                "Default Portfolio",
                style: TextStyle(
                  color: ColorRes.appWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              trailingIcon: Icon(
                Icons.more_horiz_outlined,
                color: ColorRes.appWhite,
              ),
              onTrailingTapped: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return ShowPortfolios();
                    });
              },
            ),
            SizedBox(height: height * .025),
            Text(
              "\$14,634.06",
              style: TextStyle(
                color: ColorRes.appWhite,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: height * .008),
            Text(
              "+\$248.3(+0.35)",
              style: TextStyle(
                color: Colors.green,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: height * .03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppContainer(
                  width: width * .35,
                  height: height * .04,
                  radius: 10,
                  enabledColor: ColorRes.appWhite.withOpacity(.13),
                  child: Text(
                    "Highest holdings",
                    style: TextStyle(
                      color: ColorRes.appWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                AppContainer(
                  width: width * .2,
                  height: height * .04,
                  radius: 10,
                  enabledColor: ColorRes.appWhite.withOpacity(.13),
                  child: Text(
                    "24 hours",
                    style: TextStyle(
                      color: ColorRes.appWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * .03),
            Expanded(
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  return CoinTile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
