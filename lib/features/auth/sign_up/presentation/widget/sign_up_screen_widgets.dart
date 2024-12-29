import 'package:coin_app/core/commons/widgets/app_container.dart';
import 'package:coin_app/core/commons/widgets/app_text_fields.dart';
import 'package:coin_app/core/commons/widgets/custom_app_bar.dart';
import 'package:coin_app/core/utils/color_res.dart';
import 'package:coin_app/core/utils/image_res.dart';
import 'package:coin_app/core/utils/text_res.dart';
import 'package:coin_app/features/auth/log_in/presentation/view/log_in_screen.dart';
import 'package:coin_app/features/auth/sign_up/presentation/add_pin/presentation/view/add_pin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreenWidgets extends StatefulWidget {
  const SignUpScreenWidgets({super.key});

  @override
  State<SignUpScreenWidgets> createState() =>
      _SignUpScreenWidgetsState();
}

class _SignUpScreenWidgetsState extends State<SignUpScreenWidgets> {
  bool obscureText = true;
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
                spacing: MediaQuery.of(context).size.height * .03,
                children: [
                  // App Bar
                  CustomAppBar(
                    leadingContainerColor: ColorRes.appTransparent,
                    onLeadTapped: () => Get.to(
                      () => LogInScreen(),
                      transition: Transition.cupertino,
                      duration: const Duration(milliseconds: 1500),
                    ),
                    leadIcon: Text(
                      "Sign In",
                      style: TextStyle(
                        color: ColorRes.appWhite,
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
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
                  Padding(
                    padding: EdgeInsets.only(
                      right: width * .25,
                    ),
                    child: Text(
                      TextRes.letsCreateAccount,
                      style: TextStyle(
                        color: ColorRes.appWhite,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
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
                  AppTextField(
                    hintText: TextRes.enterYourPassword,
                    obscureText: obscureText,
                    onSuffixIconPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    suffixIcon: obscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    inputBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(1.0),
                      borderSide: BorderSide(
                        color: ColorRes.appWhite,
                        width: 2,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorRes
                            .appBlue, // Color when the field is focused
                        width: 2.0,
                      ),
                    ),
                  ),
                  Text(
                    TextRes.signUpAgreement,
                    style: TextStyle(
                      color: ColorRes.appGrey,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Column(
              children: [
                GestureDetector(
                  onTap: () => Get.to(
                    () => AddPinScreen(),
                    transition: Transition.leftToRightWithFade,
                    duration: const Duration(milliseconds: 1500),
                  ),
                  child: AppContainer(
                    radius: 0,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: ColorRes.appWhite,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
