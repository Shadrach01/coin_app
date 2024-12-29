import 'package:coin_app/core/constants/secrets/secret_keys.dart';
import 'package:coin_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // Initialize all widgets and dependencies
  WidgetsFlutterBinding.ensureInitialized();

  // Supabase set up and initialise
  await Supabase.initialize(
    url: PROJECT_URL,
    anonKey: PROJECT_API_KEY,
  );
  runApp(ProviderScope(child: const MyApp()));
}
