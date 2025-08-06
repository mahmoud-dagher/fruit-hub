import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user == null) {
        throw CustomException(message: 'فشل إنشاء المستخدم.');
      }
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuth Exception (create): ${e.code}');
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'البريد الإلكتروني مستخدم بالفعل');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تأكد من الاتصال بالانترنت');
      }
      throw CustomException(message: 'حدث خطأ غير متوقع');
    } catch (e) {
      log('Unknown exception (create): $e');
      throw CustomException(
        message: 'لقد حدث خطأ ما . يرجى المحاولة مرة أخرى',
      );
    }
  }

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuth Exception (signIn): ${e.code}');
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw CustomException(
          message: 'البريد الالكترونى او كلمة المرور غير صحيحة',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تأكد من الاتصال بالإنترنت');
      }
      throw CustomException(message: 'حدث خطأ غير متوقع');
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn.instance;

    await googleSignIn.initialize(
      clientId: 'YOUR_WEB_CLIENT_ID',
      serverClientId: 'YOUR_SERVER_CLIENT_ID',
    );

    try {
      final account = await googleSignIn.authenticate();

      final idToken = account.authentication.idToken;

      // Optionally request accessToken for scopes like contacts
      final authz = await account.authorizationClient.authorizationForScopes([
        'email',
        // other scopes...
      ]);

      final accessToken = authz?.accessToken;

      final credential = GoogleAuthProvider.credential(
        idToken: idToken,
        accessToken: accessToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on GoogleSignInException catch (e) {
      if (e.code.name == 'canceled') {
        throw FirebaseAuthException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'User cancelled Google Sign-In',
        );
      } else {
        throw FirebaseAuthException(code: 'GOOGLE_SIGN_IN_FAILED');
      }
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    ));
  }
}
