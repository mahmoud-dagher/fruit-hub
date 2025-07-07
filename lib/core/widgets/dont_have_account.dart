import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/styles/text_style.dart';

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
