import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/signup_cubit/signup_states.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class SignupCubit extends Cubit<SignupStates> {
  final AuthRepo authRepo;
  SignupCubit(this.authRepo) : super(SignupInitial());

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    emit(SignupLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      email,
      password,
      name,
    );
    result.fold(
      (failure) => emit(SignupFailure(message: failure.message)),
      (userEntity) => emit(SignupSuccess(userEntity: userEntity)),
    );
  }
}
