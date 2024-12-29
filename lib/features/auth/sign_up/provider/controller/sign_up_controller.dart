/*

THIS HOLDS AND CONNECT THE REPOS AND
STATE TO TOGETHER AND CONNECTS TO THE SCREEN

 */

import 'package:coin_app/core/commons/global_loader/global_loader.dart';
import 'package:coin_app/core/models/user_model.dart';
import 'package:coin_app/features/auth/sign_up/provider/repo/sign_up_repo.dart';
import 'package:coin_app/features/auth/sign_up/provider/state_and_notifier/sign_up_state_notifier.dart';
import 'package:coin_app/features/home_page/presentation/view/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpController {
  SignUpController();

  // name controller for the name input
  TextEditingController emailController = TextEditingController();

  // password controller for the password input
  TextEditingController passwordController = TextEditingController();

  bool allFieldsField(WidgetRef ref) {
    // Call the state
    var state = ref.read(signUpNotifierProvider);

    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> handleSignUp(WidgetRef ref) async {
    // Call the state
    var state = ref.read(signUpNotifierProvider);

    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    // Set loading to true
    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    try {
      final credential = await SignUpRepo.signUp(email, password);

      final user = credential.user;

      if (user != null) {
        final String userId = user.id;

        final UserModel userModel = UserModel(
          uid: userId,
          email: email,
        );

        if (kDebugMode) {
          print('Data sent to database: ${userModel.toMap()}');
        }

        final database = Supabase.instance.client.from('users');

        await database.insert(userModel.toMap());
      }

      if (credential.user == null) {
        if (kDebugMode) {
          print('User not found');
        }
        return;
      }

      if (kDebugMode) {
        print('User added successfully');
      }
      Get.to(() => HomeScreen());
      emailController.clear();
      passwordController.clear();
    } on AuthException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
