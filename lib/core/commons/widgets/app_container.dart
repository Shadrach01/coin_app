import 'package:coin_app/core/utils/color_res.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final double? height, width, radius;
  final Color? enabledColor, disabledColor;
  final bool isEnabled;

  final Widget? child;

  const AppContainer({
    super.key,
    this.height = 60,
    this.width,
    this.radius = 20,
    this.enabledColor = ColorRes.appBlue,
    this.disabledColor = ColorRes.appBlue,
    this.child,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: isEnabled
            ? enabledColor
            : disabledColor?.withOpacity(.12),
        borderRadius: BorderRadius.circular(radius!),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
