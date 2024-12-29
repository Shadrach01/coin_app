import 'package:coin_app/core/utils/color_res.dart';
import 'package:coin_app/features/onboarding/presentation/widgets/onboarding_screen_widgets.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      body: OnboardingScreenWidgets(),
    );
  }
}
