import 'package:flutter/material.dart';
import 'package:todo_app/view/dash_board/dash_board_view.dart';
import 'package:todo_app/view/onboarding/onboarding_view.dart';
import 'package:todo_app/view/profile/profile_view.dart';

import '../view/login/login_view.dart';
import '../view/main/main_app.dart';
import '../view/register/register_view.dart';
import '../view/splash/splash_view.dart';
import 'strings_manager.dart';

class Routes {
  static const splashRoute = "/";
  static const loginRoute = "/login";
  static const onboardingRoute = "/onboarding";
  static const registerRoute = "/register";
  static const mainRoute = "/main";
  static const profileRoute = "/profile";
  static const dashBoardRoute = "/dashboard";
}

class RouteGenerator {
  static Route<dynamic> getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.onboardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) =>  LoginView(),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
        );

      case Routes.mainRoute:
        return MaterialPageRoute(
          builder: (_) => const MainView(),
        );
      case Routes.profileRoute:
        return MaterialPageRoute(
          builder: (_) =>  ProfileView(),
        );
      case Routes.dashBoardRoute:
        return MaterialPageRoute(
          builder: (_) => const DashBoardView(),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
