import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_formField.dart';
import 'package:fruits_hub/core/widgets/have_an_account.dart';
import 'package:fruits_hub/core/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CustomTextFormField(
              hint: ' الاسم كامل',
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),
            const CustomTextFormField(
              hint: 'البريد الإلكترونى',
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              suffixIcon: Icons.remove_red_eye,
              hint: 'كلمة المرور',
              inputType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 16),
            const TermsAndConditions(),
            const SizedBox(height: 30),
            GeneralButton(onTap: () {}, text: ' إنشاء حساب جديد'),
            const SizedBox(height: 26),
            const HaveAnAccount(),
          ],
        ),
      ),
    );
  }
}
