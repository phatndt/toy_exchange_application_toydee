import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toy_exchange_application_toydee/modules/swap/models/swap_toy.dart';
import 'package:toy_exchange_application_toydee/modules/swap/models/toy_type.dart';

import '../../../core/errors/exceptions.dart';
import '../../swap/models/toy.dart';

final homeRepoRepoProvider = Provider<HomeRepo>((ref) => HomeRepo());

class HomeRepo {
  Future<List<SwapToy>> getLatestSwapToyListLimitFromFirestore() async {
    List<SwapToy> swapToys = [];
    try {
      await FirebaseFirestore.instance
          .collection('swapToy')
          .orderBy('createDate', descending: false)
          .limit(4)
          .get()
          .then(
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

  Future<List<SwapToy>> getSwapToyListLimitFromFirestore() async {
    List<SwapToy> swapToys = [];
    try {
      await FirebaseFirestore.instance
          .collection('swapToy')
          .limit(4)
          .get()
          .then(
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

  Future<List<SwapToy>> getSwapToyListByFilterFromFirestore(
      ToyType toyType) async {
    List<SwapToy> swapToys = [];
    try {
      log(toyType.categories.toString() +
          "" +
          toyType.ageGroup.toString() +
          "" +
          toyType.condition.toString() +
          "" +
          toyType.genderType.toString());
      if (toyType.categories.isNotEmpty) {
        if (toyType.ageGroup == -1 &&
            toyType.condition == -1 &&
            toyType.genderType == -1) {
          log("categories");
          await FirebaseFirestore.instance
              .collection('swapToy')
              .where('toyType.categories', arrayContainsAny: toyType.categories)
              .get()
              .then(
            (value) {
              log(value.size.toString());
              for (var doc in value.docs) {
                log("categories" + doc.id);
                swapToys.add(SwapToy.fromMap(doc.data()));
              }
            },
          );
        } else if (toyType.ageGroup == -1 &&
            toyType.condition != -1 &&
            toyType.genderType == -1) {
          await FirebaseFirestore.instance
              .collection('swapToy')
              .where('toyType.categories', arrayContainsAny: toyType.categories)
              .where('toyType.condition', isEqualTo: toyType.condition)
              .get()
              .then(
            (value) {
              for (var doc in value.docs) {
                log("getSwapToyListFromFirestore" + doc.id);
                swapToys.add(SwapToy.fromMap(doc.data()));
              }
            },
          );
        } else if (toyType.ageGroup == -1 &&
            toyType.condition == -1 &&
            toyType.genderType != -1) {
          await FirebaseFirestore.instance
              .collection('swapToy')
              .where('toyType.categories', arrayContainsAny: toyType.categories)
              .where('toyType.genderType', isEqualTo: toyType.genderType)
              .get()
              .then(
            (value) {
              for (var doc in value.docs) {
                log("getSwapToyListFromFirestore" + doc.id);
                swapToys.add(SwapToy.fromMap(doc.data()));
              }
            },
          );
        } else if (toyType.ageGroup == -1 &&
            toyType.condition != -1 &&
            toyType.genderType != -1) {
          await FirebaseFirestore.instance
              .collection('swapToy')
              .where('toyType.categories', arrayContainsAny: toyType.categories)
              .where('toyType.condition', isEqualTo: toyType.condition)
              .where('toyType.genderType', isEqualTo: toyType.genderType)
              .get()
              .then(
            (value) {
              for (var doc in value.docs) {
                log("getSwapToyListFromFirestore" + doc.id);
                swapToys.add(SwapToy.fromMap(doc.data()));
              }
            },
          );
        } else if (toyType.ageGroup != -1 &&
            toyType.condition == -1 &&
            toyType.genderType == -1) {
          await FirebaseFirestore.instance
              .collection('swapToy')
              .where('toyType.categories', arrayContainsAny: toyType.categories)
              .where('toyType.ageGroup', isEqualTo: toyType.ageGroup)
              .get()
              .then(
            (value) {
              for (var doc in value.docs) {
                log("getSwapToyListFromFirestore" + doc.id);
                swapToys.add(SwapToy.fromMap(doc.data()));
              }
            },
          );
        } else if (toyType.ageGroup != -1 &&
            toyType.condition != -1 &&
            toyType.genderType == -1) {
          await FirebaseFirestore.instance
              .collection('swapToy')
              .where('toyType.categories', arrayContainsAny: toyType.categories)
              .where('toyType.ageGroup', isEqualTo: toyType.ageGroup)
              .where('toyType.condition', isEqualTo: toyType.condition)
              .get()
              .then(
            (value) {
              for (var doc in value.docs) {
                log("getSwapToyListFromFirestore" + doc.id);
                swapToys.add(SwapToy.fromMap(doc.data()));
              }
            },
          );
        } else if (toyType.ageGroup != -1 &&
            toyType.condition == -1 &&
            toyType.genderType != -1) {
          await FirebaseFirestore.instance
              .collection('swapToy')
              .where('toyType.categories', arrayContainsAny: toyType.categories)
              .where('toyType.ageGroup', isEqualTo: toyType.ageGroup)
              .where('toyType.genderType', isEqualTo: toyType.genderType)
              .get()
              .then(
            (value) {
              for (var doc in value.docs) {
                log("getSwapToyListFromFirestore" + doc.id);
                swapToys.add(SwapToy.fromMap(doc.data()));
              }
            },
          );
        } else if (toyType.ageGroup != -1 &&
            toyType.condition != -1 &&
            toyType.genderType != -1) {
          await FirebaseFirestore.instance
              .collection('swapToy')
              .where('toyType.categories', arrayContainsAny: toyType.categories)
              .where('toyType.ageGroup', isEqualTo: toyType.ageGroup)
              .where('toyType.genderType', isEqualTo: toyType.genderType)
              .where('toyType.condition', isEqualTo: toyType.condition)
              .get()
              .then(
            (value) {
              for (var doc in value.docs) {
                log("getSwapToyListFromFirestore" + doc.id);
                swapToys.add(SwapToy.fromMap(doc.data()));
              }
            },
          );
        }
      } else {
        if (toyType.ageGroup == -1 &&
            toyType.condition == -1 &&
            toyType.genderType == -1) {
          await FirebaseFirestore.instance.collection('swapToy').get().then(
            (value) {
              for (var doc in value.docs) {
                log("getSwapToyListFromFirestore" + doc.id);
                swapToys.add(SwapToy.fromMap(doc.data()));
              }
            },
          );
        } else if (toyType.ageGroup == -1 &&
            toyType.condition != -1 &&
            toyType.genderType == -1) {
          await FirebaseFirestore.instance
              .collection('swapToy')
              .where('toyType.condition', isEqualTo: toyType.condition)
              .get()
              .then(
            (value) {
              for (var doc in value.docs) {
                log("getSwapToyListFromFirestore" + doc.id);
                swapToys.add(SwapToy.fromMap(doc.data()));
              }
            },
          );
        } else if (toyType.ageGroup == -1 &&
            toyType.condition == -1 &&
            toyType.genderType != -1) {
          await FirebaseFirestore.instance
              .collection('swapToy')
              .where('toyType.genderType', isEqualTo: toyType.genderType)
              .get()
              .then(
            (value) {
              for (var doc in value.docs) {
                log("getSwapToyListFromFirestore" + doc.id);
                swapToys.add(SwapToy.fromMap(doc.data()));
              }
            },
          );
        } else if (toyType.ageGroup == -1 &&
            toyType.condition != -1 &&
            toyType.genderType != -1) {
          await FirebaseFirestore.instance
              .collection('swapToy')
              .where('toyType.condition', isEqualTo: toyType.condition)
              .where('toyType.genderType', isEqualTo: toyType.genderType)
              .get()
              .then(
            (value) {
              for (var doc in value.docs) {
                log("getSwapToyListFromFirestore" + doc.id);
                swapToys.add(SwapToy.fromMap(doc.data()));
              }
            },
          );
        } else if (toyType.ageGroup != -1 &&
            toyType.condition == -1 &&
            toyType.genderType == -1) {
          await FirebaseFirestore.instance
              .collection('swapToy')
              .where('toyType.ageGroup', isEqualTo: toyType.ageGroup)
              .get()
              .then(
            (value) {
              for (var doc in value.docs) {
                log("getSwapToyListFromFirestore" + doc.id);
                swapToys.add(SwapToy.fromMap(doc.data()));
              }
            },
          );
        } else if (toyType.ageGroup != -1 &&
            toyType.condition != -1 &&
            toyType.genderType == -1) {
          await FirebaseFirestore.instance
              .collection('swapToy')
              .where('toyType.ageGroup', isEqualTo: toyType.ageGroup)
              .where('toyType.condition', isEqualTo: toyType.condition)
              .get()
              .then(
            (value) {
              for (var doc in value.docs) {
                log("getSwapToyListFromFirestore" + doc.id);
                swapToys.add(SwapToy.fromMap(doc.data()));
              }
            },
          );
        } else if (toyType.ageGroup != -1 &&
            toyType.condition == -1 &&
            toyType.genderType != -1) {
          await FirebaseFirestore.instance
              .collection('swapToy')
              .where('toyType.ageGroup', isEqualTo: toyType.ageGroup)
              .where('toyType.genderType', isEqualTo: toyType.genderType)
              .get()
              .then(
            (value) {
              for (var doc in value.docs) {
                log("getSwapToyListFromFirestore" + doc.id);
                swapToys.add(SwapToy.fromMap(doc.data()));
              }
            },
          );
        } else if (toyType.ageGroup != -1 &&
            toyType.condition != -1 &&
            toyType.genderType != -1) {
          await FirebaseFirestore.instance
              .collection('swapToy')
              .where('toyType.ageGroup', isEqualTo: toyType.ageGroup)
              .where('toyType.genderType', isEqualTo: toyType.genderType)
              .where('toyType.condition', isEqualTo: toyType.condition)
              .get()
              .then(
            (value) {
              for (var doc in value.docs) {
                log("getSwapToyListFromFirestore" + doc.id);
                swapToys.add(SwapToy.fromMap(doc.data()));
              }
            },
          );
        }
      }
    } catch (e) {
      log("getSwapToyListFromFirestore" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return swapToys;
  }

  Future<SwapToy?> getSwapToyByUid(String uid) async {
    SwapToy? swapToy;
    try {
      await FirebaseFirestore.instance
          .collection('swapToy')
          .doc(uid)
          .get()
          .then(
        (value) {
          swapToy = SwapToy.fromMap(value.data()!);
        },
      );
    } catch (e) {
      log("getSwapToyByUid" + e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      Fluttertoast.showToast(msg: _errorMessage);
    }
    return swapToy;
  }
}
