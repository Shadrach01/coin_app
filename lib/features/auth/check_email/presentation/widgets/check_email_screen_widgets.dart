import 'package:coin_app/core/commons/widgets/app_container.dart';
import 'package:coin_app/core/commons/widgets/custom_app_bar.dart';
import 'package:coin_app/core/utils/color_res.dart';
import 'package:coin_app/core/utils/text_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/image_res.dart';

class CheckEmailScreenWidgets extends StatelessWidget {
  const CheckEmailScreenWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * .08),
        height: height,
        width: width,
        child: Column(
          children: [
            CustomAppBar(
              leadIcon: null,
              title: Image.asset(
                ImageRes.appLogo,
                width: width * .07,
              ),
              trailingIcon: Icon(
                Icons.cancel_outlined,
                color: ColorRes.appWhite,
              ),
              onTrailingTapped: () => Get.back(),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email_outlined,
                    color: ColorRes.appWhite,
                    size: height * .25,
                  ),
                  Text(
                    TextRes.checkEmail,
                    style: TextStyle(
                      color: ColorRes.appWhite,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    TextRes.checkEmailInstructions,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorRes.appGrey,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  AppContainer(
                    width: width * .4,
                    radius: 30,
                    child: Text(
                      "Go to Email",
                      style: TextStyle(
                        color: ColorRes.appWhite,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
