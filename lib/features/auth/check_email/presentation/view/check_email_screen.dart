import 'package:coin_app/core/utils/color_res.dart';
import 'package:coin_app/features/auth/check_email/presentation/widgets/check_email_screen_widgets.dart';
import 'package:flutter/material.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      body: CheckEmailScreenWidgets(),
    );
  }
}
