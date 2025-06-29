// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:fruits_hub/features/on_boarding/views/on_boarding_view.dart';

void executeNavigation(BuildContext context) {
  Future.delayed(const Duration(seconds: 3), () {
    Navigator.pushReplacementNamed(context, OnBoardingView.routName);
  });
}
