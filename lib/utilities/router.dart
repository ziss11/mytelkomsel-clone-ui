import 'package:go_router/go_router.dart';
import 'package:mytelkomsel_clone_ui/data/model/paket_model.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/internet_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/login_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/main_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/package_detail.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/search_package_page.dart';
import 'package:mytelkomsel_clone_ui/presentation/pages/search_package_result_page.dart';
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
          routes: [
            GoRoute(
              path: PackageDetail.path,
              name: PackageDetail.routeName,
              builder: (context, state) {
                final paket = state.extra as PaketModel;
                return PackageDetail(paket: paket);
              },
            ),
            GoRoute(
              path: SearchPackagePage.path,
              name: SearchPackagePage.routeName,
              builder: (context, state) {
                final query = state.extra as String;
                return SearchPackagePage(query: query);
              },
            ),
            GoRoute(
              path: SearchPackageResultPage.path,
              name: SearchPackageResultPage.routeName,
              builder: (context, state) {
                final query = state.params["query"] ?? "";
                return SearchPackageResultPage(query: query);
              },
            ),
          ],
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
