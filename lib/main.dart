import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper_functions/on_generate_route.dart';
import 'package:fruits_hub/features/splash/presentations/views/splash_view.dart';

void main() {
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routName,
    );
  }
}
