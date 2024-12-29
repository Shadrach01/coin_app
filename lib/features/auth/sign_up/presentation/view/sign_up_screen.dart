import 'package:coin_app/core/utils/color_res.dart';
import 'package:coin_app/features/auth/sign_up/presentation/widget/sign_up_screen_widgets.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      body: SignUpScreenWidgets(),
    );
  }
}
