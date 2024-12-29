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

  void onPinChanged(String pin) {
    state = state.copyWith(pin: pin);
  }
}

// This is the provider exposing the state
final signUpNotifierProvider =
    StateNotifierProvider<SignUpNotifier, SignUpState>(
        (ref) => SignUpNotifier());
