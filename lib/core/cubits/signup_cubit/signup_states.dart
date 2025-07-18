import 'package:flutter/foundation.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

@immutable
sealed class SignupStates {}

final class SignupInitial extends SignupStates {}

final class SignupLoading extends SignupStates {}

final class SignupSuccess extends SignupStates {
  final UserEntity userEntity;

  SignupSuccess({required this.userEntity});
}

final class SignupFailure extends SignupStates {
  final String message;

  SignupFailure({required this.message});
}
