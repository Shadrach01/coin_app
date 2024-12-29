import 'package:coin_app/core/commons/widgets/app_container.dart';
import 'package:coin_app/core/commons/widgets/app_text_fields.dart';
import 'package:coin_app/core/commons/widgets/custom_app_bar.dart';
import 'package:coin_app/core/utils/color_res.dart';
import 'package:coin_app/core/utils/image_res.dart';
import 'package:coin_app/core/utils/text_res.dart';
import 'package:coin_app/features/auth/check_email/presentation/view/check_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreenWidgets extends StatelessWidget {
  const ForgotPasswordScreenWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: height * .03,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15,
                children: [
                  CustomAppBar(
                    leadingContainerColor: ColorRes.appTransparent,
                    onLeadTapped: (() => Get.back()),
                    leadIcon: Icon(
                      Icons.arrow_back_ios,
                      color: ColorRes.appWhite,
                    ),
                    title: Image.asset(
                      ImageRes.appLogo,
                      width: width * .07,
                    ),
                  ),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: ColorRes.appWhite,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    TextRes.forgotPasswordText2,
                    style: TextStyle(
                      color: ColorRes.appGrey,
                      fontSize: 15,
                    ),
                  ),
                  AppTextField(
                    hintText: TextRes.enterYourEmail,
                    inputBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(1.0),
                      borderSide: BorderSide(
                        color: ColorRes.appWhite,
                        width: 2,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors
                            .blue, // Color when the field is focused
                        width: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Reset password Button
            GestureDetector(
              onTap: () => Get.to(
                () => CheckEmailScreen(),
              ),
              child: AppContainer(
                  radius: 0,
                  child: Text(
                    "Reset Password",
                    style: TextStyle(
                      color: ColorRes.appWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
