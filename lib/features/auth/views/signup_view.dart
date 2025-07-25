import 'package:flutter/material.dart';
import 'package:fruits_hub/core/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_hub/core/cubits/signup_cubit/signup_states.dart';
import 'package:fruits_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/widgets/signup_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const reoutName = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(title: 'تسجيل دخول'),
        body: const SignupViewBodyBlocConsumer(),
      ),
    );
  }
}

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupStates>(
      listener: (context, state) {
        if (state is SignupSuccess) {}
        if (state is SignupFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading ? true : false,
          child: const SignupViewBody(),
        );
      },
    );
  }
}
