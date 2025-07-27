import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/views/signin-view.dart';
import 'package:fruits_hub/features/auth/views/signup_view.dart';
import 'package:fruits_hub/features/on_boarding/views/on_boarding_view.dart';
import 'package:fruits_hub/features/splash/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case SignInView.routName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case SignupView.reoutName:
      return MaterialPageRoute(builder: (context) => const SignupView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
