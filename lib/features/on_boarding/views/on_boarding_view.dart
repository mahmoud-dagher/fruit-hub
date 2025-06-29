import 'package:flutter/material.dart';
import 'package:fruits_hub/features/on_boarding/views/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const String routName = 'onBoardingView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: OnBoardingViewBody()));
  }
}
