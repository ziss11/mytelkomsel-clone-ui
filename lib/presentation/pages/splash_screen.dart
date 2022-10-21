import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/main_page.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';

class SplashScreen extends StatefulWidget {
  static const route = "/splash";
  static const routeName = "splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () => context.goNamed(MainPage.routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.red,
      body: Center(
        child: Image.asset(
          "images/logo.png",
        ),
      ),
    );
  }
}
