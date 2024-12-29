import 'package:coin_app/core/commons/widgets/app_container.dart';
import 'package:coin_app/core/commons/widgets/custom_app_bar.dart';
import 'package:coin_app/core/utils/color_res.dart';
import 'package:coin_app/core/utils/image_res.dart';
import 'package:coin_app/core/utils/text_res.dart';
import 'package:coin_app/features/auth/sign_up/presentation/add_pin/presentation/widgets/pin_entry_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPinScreenWidgets extends StatelessWidget {
  AddPinScreenWidgets({super.key});
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.only(bottom: height * .03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * .04,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: height * .01,
                  children: [
                    CustomAppBar(
                      onLeadTapped: () => Get.back(),
                      leadIcon: Icon(
                        Icons.arrow_back_ios,
                        color: ColorRes.appWhite,
                      ),
                      title: Image.asset(
                        ImageRes.appLogo,
                        width: width * .07,
                      ),
                    ),
                    Text(
                      TextRes.addPin,
                      style: TextStyle(
                        color: ColorRes.appWhite,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      TextRes.addPinText2,
                      style: TextStyle(
                        color: ColorRes.appGrey,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: height * .02),
                    PinEntryWidget(
                      pageController: controller,
                    ),
                  ],
                ),
              ),
              AppContainer(
                radius: 0,
                child: Text(
                  "Save Pin",
                  style: TextStyle(
                    color: ColorRes.appWhite,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
