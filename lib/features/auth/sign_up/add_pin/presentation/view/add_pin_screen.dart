import 'package:coin_app/core/utils/color_res.dart';
import 'package:coin_app/features/auth/sign_up/add_pin/presentation/widgets/add_pin_screen_widgets.dart';
import 'package:flutter/material.dart';

class AddPinScreen extends StatelessWidget {
  const AddPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      body: AddPinScreenWidgets(),
    );
  }
}
