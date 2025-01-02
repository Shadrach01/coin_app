import 'package:coin_app/core/commons/widgets/custom_app_bar.dart';
import 'package:coin_app/core/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowPortfolios extends StatelessWidget {
  const ShowPortfolios({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Dialog(
      alignment: Alignment.topCenter,
      insetPadding: EdgeInsets.zero,
      child: Container(
        height: height * .6,
        padding: EdgeInsets.symmetric(
          horizontal: width * .04,
          vertical: height * .015,
        ),
        color: ColorRes.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              leadIcon: null,
              title: Text(
                "My Portfolio",
                style: TextStyle(
                  color: ColorRes.appWhite,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              trailingIcon: Icon(
                Icons.cancel_outlined,
                color: ColorRes.appGrey,
              ),
              onTrailingTapped: () => Get.back(),
            ),
            SizedBox(height: height * .03),
            Text(
              "Total Balance",
              style: TextStyle(
                color: ColorRes.appGrey,
              ),
            ),
            Text(
              "\$44,634.06",
              style: TextStyle(
                color: ColorRes.appWhite,
                fontSize: 35,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: height * .02),
            Portfolios(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Icon(
                  Icons.copy_outlined,
                  color: ColorRes.appGrey,
                  size: 18,
                ),
                Text(
                  "Create new portfolio",
                  style: TextStyle(
                    color: ColorRes.appGrey,
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * .02,
            )
          ],
        ),
      ),
    );
  }
}

// Three radio buttons
class Portfolios extends StatefulWidget {
  const Portfolios({super.key});

  @override
  State<Portfolios> createState() => _PortfoliosState();
}

class _PortfoliosState extends State<Portfolios> {
  String _selectedOption = '1';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _radioButton(
          "Default Portfolio",
          "Coins added manually",
          '1',
        ),
        _radioButton("Binance Portfolio", "API Address", '2'),
        _radioButton("Kraken Portfolio", "API Address", '3'),
      ],
    );
  }

  Widget _radioButton(
    String title,
    String subTitle,
    String value,
  ) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            activeColor: ColorRes.appBlue,
            toggleable: false,
            title: Text(
              title,
              style: TextStyle(
                color: ColorRes.appWhite,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            subtitle: Text(
              subTitle,
              style: TextStyle(
                color: ColorRes.appGrey,
                fontSize: 13,
              ),
            ),
            value: value,
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value!;
              });
            },
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "\$14,634.06",
              style: TextStyle(
                color: ColorRes.appWhite,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "+\$74.36(+1.15%)",
              style: TextStyle(
                color: Colors.green,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
