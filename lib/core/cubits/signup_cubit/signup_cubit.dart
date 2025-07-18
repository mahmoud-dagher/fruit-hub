import 'package:bloc/bloc.dart';
import 'package:fruits_hub/core/cubits/signup_cubit/signup_states.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit(super.initialState, this.authRepo);
  final AuthRepo authRepo;
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
