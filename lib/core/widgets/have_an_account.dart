import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/styles/text_style.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: ' تمتلك حساب بالفعل؟',
        style: TextStyles.semiBold16.copyWith(color: const Color(0xff949D9E)),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
            text: ' تسجيل الدخول',
            style: TextStyles.semiBold16.copyWith(
              color: const Color(0xff1B5E37),
            ),
          ),
        ],
      ),
    );
  }
}
