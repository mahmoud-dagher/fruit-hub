import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/styles/text_style.dart';
import 'package:fruits_hub/features/auth/views/signup_view.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'لا تمتلك حساب؟',
        style: TextStyles.semiBold16.copyWith(color: const Color(0xff949D9E)),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, SignupView.reoutName);
              },
            text: 'قم بإنشاء حساب ',
            style: TextStyles.semiBold16.copyWith(
              color: const Color(0xff1B5E37),
            ),
          ),
        ],
      ),
    );
  }
}
