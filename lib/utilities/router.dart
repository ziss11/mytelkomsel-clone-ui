import 'package:go_router/go_router.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/internet_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/login_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/main_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/splash_screen.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/verification_page.dart';

final router = GoRouter(
  initialLocation: SplashScreen.path,
  routerNeglect: false,
  routes: [
    GoRoute(
      path: SplashScreen.path,
      name: SplashScreen.routeName,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: MainPage.path,
      name: MainPage.routeName,
      builder: (context, state) => const MainPage(),
      routes: [
        GoRoute(
          path: InternetPage.path,
          name: InternetPage.routeName,
          builder: (context, state) => const InternetPage(),
        ),
      ],
    ),
    GoRoute(
      path: LoginPage.path,
      name: LoginPage.routeName,
      builder: (context, state) => const LoginPage(),
      routes: [
        GoRoute(
          path: VerificationPage.path,
          name: VerificationPage.routeName,
          builder: (context, state) => const VerificationPage(),
        ),
      ],
    ),
  ],
);
