import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/models/user_model.dart';

final profileConfigurationRepoProvider =
    Provider<ProfileConfigurationRepo>((ref) => ProfileConfigurationRepo());

class ProfileConfigurationRepo {
  String? uid;
  UserModel? userModel;

  Future<bool> updateUserProfileToFireStore(
    UserModel userData,
    String email,
    String phoneNumber,
    String userName,
  ) async {
    bool check = false;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userData.id)
        .set(
          {
            'userName': userName,
            'email': email,
            'isActived': true,
            'isEmailVerified': false,
            'phone': phoneNumber,
            'firstName': "",
            'lastName': "",
            'birthday': "",
            'gender': "",
            'address': "",
            'imageUrl': "",
            'createDate': DateTime.now(),
            'lastUpdateDate': "",
          },
        )
        .then((value) => check = !check)
        .catchError((onError) {
          Fluttertoast.showToast(msg: onError);
          return check;
        });
    return check;
  }

  Future<bool> getUserProfileToFireStore() async {
    bool _result = false;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (value) {
        if (value.data() != null) {
          log(value.data().toString());
          userModel = UserModel.fromMap(
              value.data()!, FirebaseAuth.instance.currentUser!.uid);
          _result = true;
        } else {
          _result = false;
        }
      },
    ).catchError((onError) {
      Fluttertoast.showToast(msg: onError);
    });
    return _result;
  }
}
