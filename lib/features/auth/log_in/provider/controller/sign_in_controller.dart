import 'package:coin_app/core/commons/global_loader/global_loader.dart';
import 'package:coin_app/features/auth/log_in/provider/repo/sign_in_repo.dart';
import 'package:coin_app/features/auth/log_in/provider/state_notifier/sign_in_state_notifier.dart';
import 'package:coin_app/features/home_page/presentation/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class SignInController {
  SignInController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  // All fields has been field
  bool allFieldsFilled(WidgetRef ref) {
    // Call the state
    var state = ref.watch(signInStateNotifierProvider);
    if (state.email.isNotEmpty && state.pw.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> signInUser(WidgetRef ref) async {
    // Call the state
    var state = ref.read(signInStateNotifierProvider);
    String email = state.email;
    String pw = state.pw;

    emailController.text = email;
    pwController.text = pw;

    // Set loading to true
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    try {
      final credential = await SignInRepo.signInUser(email, pw);

      if (credential.user == null) {
        print('User does not exist');
        return;
      }

      if (credential.user != null) {
        Get.to(() => HomeScreen());
      }
    } catch (e) {
      print("error: ${e.toString()}");
    }
  }
}
