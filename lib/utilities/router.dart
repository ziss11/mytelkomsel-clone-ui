import 'package:go_router/go_router.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/main_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/splash_screen.dart';

final router = GoRouter(
  initialLocation: SplashScreen.route,
  routes: [
    GoRoute(
      path: SplashScreen.route,
      name: SplashScreen.routeName,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: MainPage.route,
      name: MainPage.routeName,
      builder: (context, state) => const MainPage(),
    ),
  ],
);
