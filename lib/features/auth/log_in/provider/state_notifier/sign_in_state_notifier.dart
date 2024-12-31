/*

NOTIFY AND UPDATE THE
SIGN IN STATE

 */

import 'package:coin_app/features/auth/log_in/provider/state_notifier/sign_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInStateNotifier extends StateNotifier<SignInState> {
  SignInStateNotifier() : super(SignInState());

  void onEmailEntered(String email) {
    state = state.copyWith(email: email);
  }

  void pwEntered(String pw) {
    state = state.copyWith(pw: pw);
  }
}

final signInStateNotifierProvider =
    StateNotifierProvider<SignInStateNotifier, SignInState>(
        (ref) => SignInStateNotifier());
