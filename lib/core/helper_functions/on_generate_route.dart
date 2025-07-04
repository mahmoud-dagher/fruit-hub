import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/views/login_view.dart';
import 'package:fruits_hub/features/on_boarding/views/on_boarding_view.dart';
import 'package:fruits_hub/features/splash/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case LoginView.routName:
      return MaterialPageRoute(builder: (context) => const LoginView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
