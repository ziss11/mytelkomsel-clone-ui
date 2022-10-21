import 'package:flutter/material.dart';
import 'package:mytelkomsel_clone_ui/utilities/colors.dart';
import 'package:mytelkomsel_clone_ui/utilities/router.dart';
import 'package:mytelkomsel_clone_ui/utilities/typography.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: AppColors.lightColorScheme,
        useMaterial3: true,
        textTheme: typography,
      ),
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}
