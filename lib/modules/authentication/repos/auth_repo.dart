import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';

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
      // await FirebaseAuth.instance
      //     .signInWithEmailAndPassword(email: email, password: password)
      //     .then((value) async => {
      //           if (value.user != null && !value.user!.emailVerified)
      //             {
      //               await value.user!.sendEmailVerification(),
      //               Fluttertoast.showToast(msg: "Please verify your mail!"),
      //             }
      //           else
      //             {
      //               NavigationService.push(
      //                   isNamed: true, page: RoutePaths.mainScreen)
      //             }
      //         });
      // log(userCredential.toString());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
            (value) => userCredential = value,
          );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      log("message");
      final _errorMessage = Exceptions.firebaseAuthErrorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    } catch (e) {
      log(e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
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
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return _result;
  }

  Future<UserModel?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserModel? userModel;
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async => {
                userModel = UserModel.fromUserCredential(value.user!),
              });
      return userModel;
    } on FirebaseAuthException catch (e) {
      final _errorMessage = Exceptions.firebaseAuthErrorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    } catch (e) {
      log(e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return null;
  }

  Future<bool?> uploadUserProfileToFirestore({
    required String email,
    required String userName,
    required String uuid,
  }) async {
    try {
      bool result = false;
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
      ).then((value) => result = !result);
      return result;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      final _errorMessage = Exceptions.firebaseAuthErrorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    } catch (e) {
      log(e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return null;
  }

  Future<bool?> checkExistUsername(String username) async {
    try {
      bool _result = false;
      await FirebaseFirestore.instance.collection('users').get().then(
        (QuerySnapshot querySnapshot) {
          for (var doc in querySnapshot.docs) {
            if (doc["userName"].toString() == username) {
              _result = true;
            }
          }
        },
      );
      return _result;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      final _errorMessage = Exceptions.firebaseAuthErrorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    } catch (e) {
      log("1" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return null;
  }

  Future<bool?> checkExistPhoneNumber(String phone) async {
    try {
      bool _result = false;
      await FirebaseFirestore.instance.collection('users').get().then(
        (QuerySnapshot querySnapshot) {
          for (var doc in querySnapshot.docs) {
            if (doc["phone"].toString() == phone) {
              _result = true;
            }
          }
        },
      );
      return _result;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      final _errorMessage = Exceptions.firebaseAuthErrorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    } catch (e) {
      log(e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return null;
  }

  Future<bool?> checkExistEmail(String email) async {
    try {
      bool _result = false;
      await FirebaseFirestore.instance.collection('users').get().then(
        (QuerySnapshot querySnapshot) {
          for (var doc in querySnapshot.docs) {
            if (doc["email"].toString() == email.toString()) {
              _result = true;
            }
          }
        },
      );
      return _result;
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      final _errorMessage = Exceptions.firebaseAuthErrorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    } catch (e) {
      log("2" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return null;
  }

  Future<bool> checkExistUserInformation(String email, String userName) async {
    //final _checkExistPhone = await checkExistPhoneNumber(phoneNumber);
    final _checkExistEmail = await checkExistEmail(email);
    final _checkExistUsername = await checkExistUsername(userName);

    // if (_checkExistEmail != null) {
    //   log(_checkExistEmail.toString());
    //   if (_checkExistEmail) {
    //     log("d1");
    //     Fluttertoast.showToast(msg: "Email already exists");
    //     return false;
    //   } else if (_checkExistPhone != null) {
    //     if (_checkExistPhone) {
    //       log("d2");
    //       Fluttertoast.showToast(msg: "Phone number already exists");
    //       return false;
    //     }
    //   } else if (_checkExistUsername != null) {
    //     if (_checkExistUsername) {
    //       log("d3");
    //       Fluttertoast.showToast(msg: "Username already exists");
    //       return false;
    //     }
    //   } else {
    //     log("d4");
    //     return true;
    //   }
    // } else {
    //   log("false");
    //   return false;
    // }
    // return false;

    if (_checkExistEmail != null && _checkExistUsername != null) {
      if (_checkExistEmail) {
        Fluttertoast.showToast(msg: "Email already exists");
        return true;
      } else if (_checkExistUsername) {
        Fluttertoast.showToast(msg: "Username already exists");
        return true;
        // } else if (_checkExistPhone) {
        //   Fluttertoast.showToast(msg: "Phone number already exists");
        //   return false;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  Future<bool?> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      bool _result = false;
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .then((value) async => {
                _result = true,
              });
      return _result;
    } on FirebaseAuthException catch (e) {
      final _errorMessage = Exceptions.firebaseAuthErrorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    } catch (e) {
      log(e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return null;
  }

  Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      log(e.toString());
    }
  }
}
