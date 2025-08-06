import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      final user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log('Exception in createUserWithEmailAndPassword: ${e.message}');
      return left(ServerFailure('  حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user == null) {
        return left(ServerFailure('فشل تسجيل الدخول. المستخدم غير موجود.'));
      }
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log('Exception in signInWithEmailAndPassword: ${e.message}');
      return left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user.user!));
    } catch (e) {
      log('Exception in signInWithGoogle: ${e.toString()}');
      return left(ServerFailure('حد ث خطاءما يرجى المحاولة مرة اخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user.user!));
    } catch (e) {
      log('Exception in signInWithFacebook: ${e.toString()}');
      return left(ServerFailure('حد ث خطاءما يرجى المحاولة مرة اخرى'));
    }
  }
}
