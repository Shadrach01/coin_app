import 'package:coin_app/core/utils/color_res.dart';
import 'package:coin_app/features/auth/sign_up/provider/state_and_notifier/sign_up_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PinEntryWidget extends ConsumerStatefulWidget {
  final PageController pageController;
  const PinEntryWidget({
    super.key,
    required this.pageController,
  });

  @override
  ConsumerState<PinEntryWidget> createState() =>
      _PinEntryWidgetState();
}

class _PinEntryWidgetState extends ConsumerState<PinEntryWidget> {
  // String enteredPin = ""; // Holds the entered PIN
  // List<String> enteredPinList = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final pin = ref.watch(signUpNotifierProvider).uiPin;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // PIN Boxes
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            4,
            (index) {
              return Container(
                width: width * .17,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: ColorRes.appWhite,
                      width: 2,
                    ),
                  ),
                  color: ColorRes.appTransparent,
                ),
                child: Center(
                  child: Text(
                    index < pin.length ? pin[index] : "",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: ColorRes.appWhite,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: height * .12,
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: _numberRows(
            ref: ref,
            context: context,
            onTap: (number) {
              ref
                  .read(signUpNotifierProvider.notifier)
                  .addDigitToPin(number.toString());
            },
            onCancel: () {
              ref
                  .read(signUpNotifierProvider.notifier)
                  .removeLastDigitFromPin();
            },
          ),
        ),
      ],
    );
  }
}

Widget _numberRows({
  required WidgetRef ref,
  required void Function(int) onTap,
  required void Function()? onCancel,
  required BuildContext context,
}) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: width * .04,
        children: [
          Expanded(
            child: NumberButton(
              ref: ref,
              number: 1,
              onTap: () => onTap(1),
            ),
          ),
          Expanded(
            child: NumberButton(
              ref: ref,
              number: 2,
              onTap: () => onTap(2),
            ),
          ),
          Expanded(
            child: NumberButton(
              ref: ref,
              number: 3,
              onTap: () => onTap(3),
            ),
          ),
        ],
      ),
      SizedBox(height: height * .015),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: width * .04,
        children: [
          Expanded(
            child: NumberButton(
              ref: ref,
              number: 4,
              onTap: () => onTap(4),
            ),
          ),
          Expanded(
            child: NumberButton(
              ref: ref,
              number: 5,
              onTap: () => onTap(5),
            ),
          ),
          Expanded(
            child: NumberButton(
              ref: ref,
              number: 6,
              onTap: () => onTap(6),
            ),
          ),
        ],
      ),
      SizedBox(height: height * .015),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: width * .04,
        children: [
          Expanded(
            child: NumberButton(
              ref: ref,
              number: 7,
              onTap: () => onTap(7),
            ),
          ),
          Expanded(
            child: NumberButton(
              ref: ref,
              number: 8,
              onTap: () => onTap(8),
            ),
          ),
          Expanded(
            child: NumberButton(
              ref: ref,
              number: 9,
              onTap: () => onTap(9),
            ),
          ),
        ],
      ),
      SizedBox(height: height * .015),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: width * .04,
        children: [
          SizedBox(width: width * .28),
          Expanded(
            child: NumberButton(
              ref: ref,
              number: 0,
              onTap: () => onTap(0),
            ),
          ),
          Expanded(
            child: IconButton(
              icon: const Icon(
                Icons.backspace_outlined,
                color: ColorRes.appWhite,
              ),
              onPressed: onCancel,
            ),
          ),
        ],
      ),
    ],
  );
}

class NumberButton extends StatelessWidget {
  final WidgetRef ref;
  final int number;

  final void Function()? onTap;
  const NumberButton({
    super.key,
    required this.ref,
    required this.number,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * .07,
        padding: EdgeInsets.symmetric(vertical: height * .015),
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorRes.appWhite,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: ColorRes.appGrey,
              blurRadius: 1,
              offset: const Offset(0, 1.6),
              blurStyle: BlurStyle.inner,
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              number.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
