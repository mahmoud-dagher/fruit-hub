import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/signup_cubit/signin_cubit/signin_cubit.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/styles/app_colors.dart';
import 'package:fruits_hub/core/utils/styles/text_style.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/core/widgets/dont_have_account.dart';
import 'package:fruits_hub/core/widgets/or_divider.dart';
import 'package:fruits_hub/core/widgets/password_field.dart';
import 'package:fruits_hub/core/widgets/social_login_button.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hint: 'البريد الإلكترونى',
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'نسيت كلمة المرور؟',
                      style: TextStyles.semiBold13.copyWith(
                        color: AppColors.lightPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 33),
              GeneralButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubit>().signIn(email, password);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'تسجيل الدخول',
              ),
              const SizedBox(height: 33),

              const DontHaveAccount(),
              const SizedBox(height: 16),
              const OrDivider(),
              const SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
                image: Assets.imagesGoogle,
                title: 'تسجيل بواسطة جوجل',
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.imagesApple,
                title: 'تسجيل بواسطة أبل',
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.imagesFacebook,
                title: 'تسجيل بواسطة فيسبوك',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
