import 'package:supabase_flutter/supabase_flutter.dart';

/*

REPOSITORY FOR THE SUPABASE USER SIGN UP

 */
class SignUpRepo {
  static Future<AuthResponse> signUp(
    String email,
    String password,
  ) async {
    final credential = await Supabase.instance.client.auth.signUp(
      email: email,
      password: password,
    );

    return credential;
  }
}
