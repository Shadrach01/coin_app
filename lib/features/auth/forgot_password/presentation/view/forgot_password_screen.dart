import 'package:coin_app/core/utils/color_res.dart';
import 'package:coin_app/features/auth/forgot_password/presentation/widget/forgot_password_screen_widgets.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      body: ForgotPasswordScreenWidgets(),
    );
  }
}
