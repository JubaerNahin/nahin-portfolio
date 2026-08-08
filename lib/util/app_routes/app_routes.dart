import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../features/auth/view/screens/login_forgot/login_screen.dart';
import '../../features/splash/view/screens/splash_screen.dart';
import '../../features/portfolio/view/screens/portfolio_home_screen.dart';






class AppRoutes {
  static int duration = 300;

  static final appRoutes = [

    ///======================== Argument if needed ===============
    // dynamicArgumentPage(
    //   name: LoginScreen.routeName,
    //   pageBuilder: (args) {
    //     final data = args as Map<String, dynamic>?;
    //     return LoginScreen(id: data?['id'] ?? '', name: data?['name'] ?? '',);
    //   },
    // ),

    /// ========================= Auth and Splash ===================
    defaultTransitionPage(name: SplashScreen.routeName, page: () => SplashScreen()),
    defaultTransitionPage(name: LoginScreen.routeName, page: () => LoginScreen()),
    defaultTransitionPage(name: PortfolioHomeScreen.routeName, page: () => PortfolioHomeScreen()),


  ];
}




//
GetPage defaultTransitionPage({
  required String name,
  required GetPageBuilder page,
}) {
  return GetPage(
    name: name,
    page: page,
    transition: Transition.noTransition,
    transitionDuration: Duration(milliseconds: AppRoutes.duration),
  );
}

// for argument pass route
GetPage dynamicArgumentPage({
  required String name,
  required Widget Function(dynamic args) pageBuilder,
}) {
  return GetPage(
    name: name,
    page: () => pageBuilder(Get.arguments),
    transition: Transition.noTransition,
    transitionDuration: Duration(milliseconds: AppRoutes.duration),
  );
}
