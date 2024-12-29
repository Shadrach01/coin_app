import 'package:coin_app/core/commons/widgets/app_container.dart';
import 'package:coin_app/core/utils/color_res.dart';
import 'package:coin_app/core/utils/image_res.dart';
import 'package:coin_app/core/utils/text_res.dart';
import 'package:coin_app/features/auth/log_in/presentation/view/log_in_screen.dart';
import 'package:coin_app/features/auth/sign_up/presentation/view/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreenWidgets extends StatelessWidget {
  const OnboardingScreenWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * .05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 15,
          children: [
            Image.asset(
              ImageRes.appLogo,
            ),
            Text(
              TextRes.welcome,
              style: TextStyle(
                color: ColorRes.appWhite,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              TextRes.welcomeText2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorRes.appGrey,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: height * .03,
            ),
            GestureDetector(
              onTap: () => Get.to(() => LogInScreen()),
              child: AppContainer(
                height: height * .05,
                width: width * .4,
                radius: 40,
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: ColorRes.appWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Get.to(() => SignUpScreen()),
              child: AppContainer(
                height: height * .05,
                width: width * .4,
                containerColor: ColorRes.appTransparent,
                radius: 40,
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: ColorRes.appWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
