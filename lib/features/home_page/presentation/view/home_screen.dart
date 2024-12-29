import 'package:coin_app/features/home_page/presentation/widgets/home_screen_widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeScreenWidgets(),
    );
  }
}
