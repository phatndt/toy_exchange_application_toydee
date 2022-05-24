import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/widgets/Toast.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/routing/route_paths.dart';
import '../models/user_model.dart';

final authRepoProvider = Provider<AuthRepo>((ref) => AuthRepo());

class AuthRepo {
  Future<UserCredential?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential? userCredential;
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then(((value) {
        userCredential = value;
      }));

      return userCredential;
    } on FirebaseAuthException catch (e) {
      final _errorMessage = Exceptions.firebaseAuthErrorMessage(e);
      CustomToast.fToast.showToast(
          gravity: ToastGravity.TOP,
          child: CustomToastBuilder(
              msg: _errorMessage, icon: FontAwesomeIcons.exclamation));
    } catch (e) {
      log(e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      CustomToast.fToast.showToast(
          gravity: ToastGravity.TOP,
          child: CustomToastBuilder(
              msg: _errorMessage, icon: FontAwesomeIcons.exclamation));
    }
    return null;
  }

  Future<bool> sendEmailVerification(UserCredential value) async {
    bool _result = false;
    try {
      await value.user!.sendEmailVerification().then((value) {
        _result = true;
      });
      return _result;
    } catch (e) {
      log(e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      CustomToast.fToast.showToast(
          gravity: ToastGravity.TOP,
          child: CustomToastBuilder(
              msg: _errorMessage, icon: FontAwesomeIcons.exclamation));
    }
    return _result;
  }

  Future<UserModel?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    UserModel? userModel;
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async => {
                userModel = UserModel.fromUserCredential(value.user!),
              });
    } on FirebaseAuthException catch (e) {
      final _errorMessage = Exceptions.firebaseAuthErrorMessage(e);
      CustomToast.fToast.showToast(
          gravity: ToastGravity.TOP,
          child: CustomToastBuilder(
              msg: _errorMessage, icon: FontAwesomeIcons.exclamation));
    } catch (e) {
      log(e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      CustomToast.fToast.showToast(
          gravity: ToastGravity.TOP,
          child: CustomToastBuilder(
              msg: _errorMessage, icon: FontAwesomeIcons.exclamation));
    }
    return userModel;
  }

  Future<bool> uploadUserProfileToFirestore({
    required String email,
    required String userName,
    required String uuid,
  }) async {
    bool _result = false;
    try {
      await FirebaseFirestore.instance.collection("users").doc(uuid).set(
        {
          'userName': userName,
          'email': email,
          'isActived': true,
          'isEmailVerified': false,
          'phone': "",
          'firstName': "",
          'lastName': "",
          'birthday': "",
          'gender': "",
          'address': "",
          'imageUrl': "",
          'createDate':
              DateFormat("dd-MM-yyyy HH:mm:ss").format(DateTime.now()),
          'lastUpdateDate': "",
        },
      ).then((value) => _result = true);
      return _result;
    } catch (e) {
      final _errorMessage = Exceptions.errorMessage(e);
      CustomToast.fToast.showToast(
          gravity: ToastGravity.TOP,
          child: CustomToastBuilder(
              msg: _errorMessage, icon: FontAwesomeIcons.exclamation));
    }
    return _result;
  }

  Future<bool?> checkExistUsername(String username) async {
    bool? _result;
    try {
      await FirebaseFirestore.instance.collection('users').get().then(
        (QuerySnapshot querySnapshot) {
          for (var doc in querySnapshot.docs) {
            if (doc["userName"].toString() == username) {
              _result = true;
            }
          }
        },
      );
      _result ??= false;
      return _result;
    } catch (e) {
      final _errorMessage = Exceptions.errorMessage(e);
      CustomToast.fToast.showToast(
          gravity: ToastGravity.TOP,
          child: CustomToastBuilder(
              msg: _errorMessage, icon: FontAwesomeIcons.exclamation));
    }
    return null;
  }

  // Future<bool?> checkExistPhoneNumber(String phone) async {
  //   try {
  //     bool _result = false;
  //     await FirebaseFirestore.instance.collection('users').get().then(
  //       (QuerySnapshot querySnapshot) {
  //         for (var doc in querySnapshot.docs) {
  //           if (doc["phone"].toString() == phone) {
  //             _result = true;
  //           }
  //         }
  //       },
  //     );
  //     return _result;
  //   } on FirebaseAuthException catch (e) {
  //     log(e.toString());
  //     final _errorMessage = Exceptions.firebaseAuthErrorMessage(e);
  //     Fluttertoast.showToast(msg: _errorMessage);
  //   } catch (e) {
  //     log(e.toString());
  //     final _errorMessage = Exceptions.errorMessage(e);
  //     Fluttertoast.showToast(msg: _errorMessage);
  //   }
  //   return null;
  // }

  Future<bool?> checkExistEmail(String email) async {
    bool? _result;
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          if (doc["email"].toString() == email.toString()) {
            _result = true;
          }
        }
      });
      _result ??= false;
      return _result;
    } catch (e) {
      final _errorMessage = Exceptions.errorMessage(e);
      CustomToast.fToast.showToast(
          gravity: ToastGravity.TOP,
          child: CustomToastBuilder(
              msg: _errorMessage, icon: FontAwesomeIcons.exclamation));
    }
    return null;
  }

  Future<bool?> checkExistUserInformation(String email, String userName) async {
    bool? _result;
    final _checkExistEmail = await checkExistEmail(email);
    final _checkExistUsername = await checkExistUsername(userName);

    if (_checkExistEmail != null && _checkExistUsername != null) {
      if (_checkExistEmail) {
        CustomToast.fToast.showToast(
            gravity: ToastGravity.TOP,
            child: const CustomToastBuilder(
                msg: "Email already exists",
                icon: FontAwesomeIcons.exclamation));
        _result = true;
      } else if (_checkExistUsername) {
        CustomToast.fToast.showToast(
            gravity: ToastGravity.TOP,
            child: const CustomToastBuilder(
                msg: "Username already exists",
                icon: FontAwesomeIcons.exclamation));
        _result = true;
      } else {
        _result = false;
      }
    } else {
      _result = true;
    }

    return _result;
  }

  Future<bool> sendPasswordResetEmail({
    required String email,
  }) async {
    bool _result = false;
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .then((value) async => {
                _result = true,
              });
      return _result;
    } catch (e) {
      log(e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      CustomToast.fToast.showToast(
          gravity: ToastGravity.TOP,
          child: CustomToastBuilder(
              msg: _errorMessage, icon: FontAwesomeIcons.exclamation));
    }
    return _result;
  }

  Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      log(e.toString());
    }
  }
}
