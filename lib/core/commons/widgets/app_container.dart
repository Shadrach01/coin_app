import 'package:coin_app/core/utils/color_res.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final double? height, width, radius;
  final Color? containerColor;
  final Widget child;
  const AppContainer({
    super.key,
    this.height = 60,
    this.width,
    this.radius = 20,
    this.containerColor = ColorRes.appBlue,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(radius!),
      ),
      child: Center(child: child),
    );
  }
}
