import 'package:coin_app/features/home_page/presentation/view/home_screen.dart';
import 'package:coin_app/features/onboarding/presentation/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _currentScreen = OnboardingScreen();
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    Supabase.instance.client.auth.onAuthStateChange.listen((event) {
      final AuthChangeEvent type = event.event;
      final session = event.session;

      // Dynamically update the current screen based on the auth state
      setState(() {});
      if (type == AuthChangeEvent.signedIn && session != null) {
        _currentScreen =
            const HomeScreen(); //Navigate to home screen;
      } else if (type == AuthChangeEvent.signedOut) {
        _currentScreen = const OnboardingScreen();
      }
    });

    // Check if there's an existing session
    final session = Supabase.instance.client.auth.currentSession;

    if (session != null) {
      _currentScreen = const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: _currentScreen, // Dynamically determined screen
    );
  }
}
