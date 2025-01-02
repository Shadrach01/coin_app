import 'package:coin_app/core/utils/color_res.dart';
import 'package:flutter/material.dart';

class CoinTile extends StatelessWidget {
  const CoinTile({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: height * .1,
              width: width * .1,
              decoration: BoxDecoration(
                color: ColorRes.appWhite,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.currency_bitcoin,
              ),
            ),
            SizedBox(
              width: width * .04,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bitcoin",
                  style: TextStyle(
                    color: ColorRes.appWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "0.1000000 BTC (\$654.64)",
                  style: TextStyle(
                    color: ColorRes.appGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "\$14,634.06",
              style: TextStyle(
                color: ColorRes.appWhite,
                fontSize: 14,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: height * .008),
            Text(
              "+\$248.3(+0.35)",
              style: TextStyle(
                color: Colors.green,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
