import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? leadIcon;
  final Widget? title;
  final Widget? trailingIcon;

  final Color? leadingContainerColor;
  final Color? leadIconColor;
  final void Function()? onLeadTapped;
  final void Function()? onTitleTapped;
  final void Function()? onTrailingTapped;

  const CustomAppBar({
    super.key,
    this.leadIcon,
    this.title,
    this.leadingContainerColor,
    this.leadIconColor,
    this.trailingIcon,
    this.onLeadTapped,
    this.onTitleTapped,
    this.onTrailingTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            if (onLeadTapped != null) {
              onLeadTapped!.call();
            } else {
              Get.back();
            }
          },
          child: leadIcon ?? SizedBox(),
        ),

        // APP BAR TITLE
        GestureDetector(
          onTap: onTitleTapped,
          child: title,
        ),

        // APP BAR TRAILING WIDGET
        GestureDetector(
          onTap: onTrailingTapped,
          child: trailingIcon ??
              const SizedBox(
                width: 50,
                height: 50,
              ),
        ),
      ],
    );
  }
}
