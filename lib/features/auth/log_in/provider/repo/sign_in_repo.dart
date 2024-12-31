/*

SIGN IN REPOSITORY TO BE IMPLEMENTED
 */

import 'package:supabase_flutter/supabase_flutter.dart';

class SignInRepo {
  SignInRepo();

  static Future<AuthResponse> signInUser(
      String email, String pw) async {
    final credential = await Supabase.instance.client.auth
        .signInWithPassword(email: email, password: pw);

    return credential;
  }
}
