import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/exceptions.dart';
import '../models/user_model.dart';

final authRepoProvider = Provider<AuthRepo>((ref) => AuthRepo());

class AuthRepo {
  Future<UserModel?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      log(userCredential.toString());
      return UserModel.fromUserCredential(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      final _errorMessage = Exceptions.firebaseAuthErrorMessage(e);
      
    } catch (e) {
      log(e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
    }
  }

  Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      log(e.toString());
    }
  }
}
