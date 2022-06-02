import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toy_exchange_application_toydee/modules/swap/models/swap_toy.dart';

import '../../../core/errors/exceptions.dart';
import '../../swap/models/toy.dart';

final homeRepoRepoProvider = Provider<HomeRepo>((ref) => HomeRepo());

class HomeRepo {
  Future<List<SwapToy>> getSwapToyListFromFirestore() async {
    List<SwapToy> swapToys = [];
    try {
      await FirebaseFirestore.instance.collection('swapToy').get().then(
        (value) {
          for (var doc in value.docs) {
            log("getSwapToyListFromFirestore" + doc.id);
            swapToys.add(SwapToy.fromMap(doc.data()));
          }
        },
      );
    } catch (e) {
      log("getSwapToyListFromFirestore" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return swapToys;
  }
}
