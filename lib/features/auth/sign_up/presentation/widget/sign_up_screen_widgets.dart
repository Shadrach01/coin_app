import 'package:coin_app/core/commons/global_loader/global_loader.dart';
import 'package:coin_app/core/commons/widgets/app_container.dart';
import 'package:coin_app/core/commons/widgets/app_text_fields.dart';
import 'package:coin_app/core/commons/widgets/custom_app_bar.dart';
import 'package:coin_app/core/utils/color_res.dart';
import 'package:coin_app/core/utils/image_res.dart';
import 'package:coin_app/core/utils/text_res.dart';
import 'package:coin_app/features/auth/log_in/presentation/view/log_in_screen.dart';
import 'package:coin_app/features/auth/sign_up/provider/controller/sign_up_controller.dart';
import 'package:coin_app/features/auth/sign_up/provider/state_and_notifier/sign_up_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class SignUpScreenWidgets extends ConsumerStatefulWidget {
  const SignUpScreenWidgets({super.key});

  @override
  ConsumerState<SignUpScreenWidgets> createState() =>
      _SignUpScreenWidgetsState();
}

class _SignUpScreenWidgetsState
    extends ConsumerState<SignUpScreenWidgets> {
  // Call the controller
  final SignUpController _controller = SignUpController();

  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final bool allFieldsFilled = _controller.allFieldsFilled(ref);
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
                    controller: _controller.emailController,
                    onChanged: (value) {
                      ref
                          .read(signUpNotifierProvider.notifier)
                          .onEmailChanged(value);
                    },
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
                    controller: _controller.passwordController,
                    onChanged: (value) {
                      ref
                          .read(signUpNotifierProvider.notifier)
                          .onPasswordChanged(value);
                    },
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
                  onTap: () {
                    allFieldsFilled
                        ? _controller.handleSignUp(ref)
                        : print("Please fill all forms");
                  },
                  child: AppContainer(
                    radius: 0,
                    isEnabled: allFieldsFilled,
                    child: ref.watch(appLoaderProvider)
                        ? CircularProgressIndicator(
                            backgroundColor: ColorRes.appWhite,
                          )
                        : Text(
                            "Sign Up",
                            style: TextStyle(
                              color: allFieldsFilled
                                  ? ColorRes.appWhite
                                  : ColorRes.appWhite
                                      .withOpacity(.12),
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
