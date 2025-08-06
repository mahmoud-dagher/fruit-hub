import 'package:flutter/material.dart';
import 'package:fruits_hub/core/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/core/widgets/signup_view_body_bloc_consumer.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
