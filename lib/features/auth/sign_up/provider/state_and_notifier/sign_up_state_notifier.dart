/*

  SIGN UP NOTIFIER CLASS USING THE SIGN UP STATE
  WITH THE RIVERPOD STATE NOTIFIER

 */

import 'package:coin_app/features/auth/sign_up/provider/state_and_notifier/sign_up_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpNotifier extends StateNotifier<SignUpState> {
  SignUpNotifier() : super(SignUpState());

  void onEmailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChanged(String password) {
    state = state.copyWith(password: password);
  }

  // Add digit to PIN
  void addDigitToPin(String digit) {
    if (state.pin.length < 4) {
      String newPin = state.pin + digit;

      print("New pin: $newPin");

      // Update the UI
      String newUiPin =
          state.uiPin + digit; // Temporarily show the number
      state = state.copyWith(
        pin: newPin,
        uiPin: newUiPin,
      );
      // Print the actual PIN for backend purposes
      print("Actual PIN: $newPin");

      print("Ui pin: $newUiPin");

      // Delay to replace the last digit with a dot in the UI
      Future.delayed(const Duration(milliseconds: 300), () {
        String obscuredPin = newUiPin.replaceRange(
          newUiPin.length - 1,
          newUiPin.length,
          '.',
        );

        state = state.copyWith(uiPin: obscuredPin);
      });
    }
  }

  // Remove the last digit from PIN
  void removeLastDigitFromPin() {
    if (state.pin.isNotEmpty) {
      String newActualPin =
          state.pin.substring(0, state.pin.length - 1);
      String newUiPin =
          state.uiPin.substring(0, state.uiPin.length - 1);

      state = state.copyWith(
        pin: newActualPin,
        uiPin: newUiPin,
      );

      print("Actual PIN after removal: $newActualPin");
    }
  }
}

// This is the provider exposing the state
final signUpNotifierProvider =
    StateNotifierProvider<SignUpNotifier, SignUpState>(
        (ref) => SignUpNotifier());
