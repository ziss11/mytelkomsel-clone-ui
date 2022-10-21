import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  static const route = "/";
  static const routeName = "main-page";

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("This is main page"),
      ),
    );
  }
}
