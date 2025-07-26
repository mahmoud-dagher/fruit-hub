// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in firebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}',
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'البريد الإلكتروني مستخدم بالفعل');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تاكد من الاتصال بالانترنت');
      }
    } catch (e) {
      log(
        'Exception in firebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}and code is ${e.hashCode}',
      );
      throw CustomException(
        message: 'لقد حدث خطأ ما . يرجى المحاولة مرة أخرى',
      );
    }
    throw CustomException(message: 'لقد حدث خطأ ما . يرجى المحاولة مرة أخرى');
  }
}
