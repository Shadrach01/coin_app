import 'package:coin_app/core/utils/color_res.dart';
import 'package:coin_app/features/auth/log_in/presentation/widgets/log_in_screen_widgets.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      body: LogInScreenWidgets(),
    );
  }
}
