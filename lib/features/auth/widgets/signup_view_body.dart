import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/core/widgets/have_an_account.dart';
import 'package:fruits_hub/core/widgets/password_field.dart';
import 'package:fruits_hub/core/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String? email, userName, password;
  late bool isTermsAccepted = false;
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
                  userName = value;
                },
                hint: ' الاسم كامل',
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  email = value;
                },
                hint: 'البريد الإلكترونى',
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordField(
                onSaved: (value) {
                  password = value;
                },
              ),
              const SizedBox(height: 16),
              TermsAndConditions(
                onChecked: (value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(height: 30),
              GeneralButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    if (isTermsAccepted) {
                      formKey.currentState!.save();
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email!,
                            password!,
                            userName!,
                          );
                    } else {
                      buildErrorBar(
                        context,
                        'يرجى الموافقة على الشروط والاحكام',
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: ' إنشاء حساب جديد',
              ),
              const SizedBox(height: 26),
              const HaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
