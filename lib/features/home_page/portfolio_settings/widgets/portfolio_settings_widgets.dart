import 'package:coin_app/core/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class PortfolioSettingsWidgets extends StatefulWidget {
  const PortfolioSettingsWidgets({super.key});

  @override
  State<PortfolioSettingsWidgets> createState() =>
      _PortfolioSettingsWidgetsState();
}

class _PortfolioSettingsWidgetsState
    extends State<PortfolioSettingsWidgets> {
  bool switch1 = false;
  bool switch2 = false;
  bool switch3 = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: height * .113),
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        alignment: Alignment.bottomCenter,
        child: Container(
          height: height * .6,
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: width * .05,
            vertical: height * .02,
          ),
          color: ColorRes.backgroundColor,
          child: Column(
            spacing: height * .05,
            children: [
              Text(
                "Portfolio Settings",
                style: TextStyle(
                  color: ColorRes.appWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.add,
                    color: ColorRes.appGrey,
                  ),
                  SizedBox(width: width * .03),
                  Text(
                    "Add new transaction",
                    style: TextStyle(
                      color: ColorRes.appGrey,
                      fontSize: 19,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.copy_sharp,
                    color: ColorRes.appGrey,
                  ),
                  SizedBox(width: width * .03),
                  Text(
                    "Create new portfolio",
                    style: TextStyle(
                      color: ColorRes.appGrey,
                      fontSize: 19,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Make this Default Portfolio',
                    style: TextStyle(
                      color: ColorRes.appGrey,
                      fontSize: 18,
                    ),
                  ),
                  FlutterSwitch(
                    width: width * .14,
                    height: height * .035,
                    value: switch1,
                    activeColor: ColorRes.appBlue,
                    inactiveColor: ColorRes.appGrey,
                    onToggle: (value) {
                      setState(() {
                        switch1 = value;
                      });
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Percentage Holdings',
                    style: TextStyle(
                      color: ColorRes.appGrey,
                      fontSize: 18,
                    ),
                  ),
                  FlutterSwitch(
                    width: width * .14,
                    height: height * .035,
                    value: switch2,
                    activeColor: ColorRes.appBlue,
                    inactiveColor: ColorRes.appGrey,
                    onToggle: (value) {
                      setState(() {
                        switch2 = value;
                      });
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hide Small Holdings',
                    style: TextStyle(
                      color: ColorRes.appGrey,
                      fontSize: 18,
                    ),
                  ),
                  FlutterSwitch(
                    width: width * .14,
                    height: height * .035,
                    value: switch3,
                    activeColor: ColorRes.appBlue,
                    inactiveColor: ColorRes.appGrey,
                    onToggle: (value) {
                      setState(() {
                        switch3 = value;
                      });
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
