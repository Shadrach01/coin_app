import 'package:coin_app/core/commons/widgets/app_container.dart';
import 'package:coin_app/core/commons/widgets/app_text_fields.dart';
import 'package:coin_app/core/commons/widgets/custom_app_bar.dart';
import 'package:coin_app/core/utils/color_res.dart';
import 'package:coin_app/core/utils/image_res.dart';
import 'package:coin_app/core/utils/text_res.dart';
import 'package:coin_app/features/auth/forgot_password/presentation/view/forgot_password_screen.dart';
import 'package:coin_app/features/auth/sign_up/presentation/view/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInScreenWidgets extends StatefulWidget {
  const LogInScreenWidgets({super.key});

  @override
  State<LogInScreenWidgets> createState() =>
      _LogInScreenWidgetsState();
}

class _LogInScreenWidgetsState extends State<LogInScreenWidgets> {
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
                  CustomAppBar(
                    leadingContainerColor: ColorRes.appTransparent,
                    onLeadTapped: () => Get.to(
                      () => SignUpScreen(),
                      transition: Transition.cupertino,
                      duration: const Duration(milliseconds: 1500),
                    ),
                    leadIcon: Text(
                      "Sign Up",
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
                      right: width * .02,
                    ),
                    child: Text(
                      TextRes.loginText,
                      style: TextStyle(
                        color: ColorRes.appWhite,
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  // Email Text field
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

                  // Password text field
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
                  GestureDetector(
                    onTap: () => Get.to(
                      () => ForgotPasswordScreen(),
                      transition: Transition.zoom,
                      duration: const Duration(milliseconds: 300),
                    ),
                    child: Text(
                      TextRes.forgotPassword,
                      style: TextStyle(
                        color: ColorRes.appWhite,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Column(
              children: [
                AppContainer(
                  radius: 0,
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: ColorRes.appWhite,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
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
