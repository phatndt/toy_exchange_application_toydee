import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/models/address.dart';

class UserModel {
  final String id;
  final String? username;
  final String email;
  final String? phone;
  final String? firstName;
  final String? lastName;
  final String? birthday;
  final String? gender;
  final Address? address;
  final String? imageUrl;
  final DateTime? createDate;
  final DateTime? lastUpdateDate;
  final bool? isActived;
  final bool? isEmailVerified;

  UserModel({
    required this.id,
    required this.email,
    this.phone,
    this.username,
    this.firstName,
    this.lastName,
    this.birthday,
    this.gender,
    this.address,
    this.imageUrl,
    this.createDate,
    this.lastUpdateDate,
    this.isActived,
    this.isEmailVerified,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'username': username,
      'firstName': firstName ?? '',
      'lastName': lastName,
      'birthday': birthday ?? '',
      'gender': gender ?? '',
      'address': address ?? '',
      'imageUrl': imageUrl,
      'createDate': createDate ?? '',
      'lastUpdateDate': lastUpdateDate ?? '',
      'isActived': isActived ?? '',
      'isEmailVerified': isEmailVerified ?? '',
    }..removeWhere((key, value) => value == null);
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserModel(
      id: documentId,
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      username: map['userName'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      birthday: map['birthday'] != "" ? map['birthday'] : DateTime.now(),
      gender: map['gender'] != "" ? map['gender'] : null,
      address: map['address'] != ""
          ? Address.fromMap(map['address'])
          : Address(
              address: "", detailAddress: "", latitude: "", longitude: ""),
      imageUrl: map['imageUrl'] != "" ? map['imageUrl'] : '',
      createDate: map['createDate'] != ""
          ? DateFormat("dd-MM-yyyy HH:mm:ss").parse(map['createDate'])
          : DateTime.now(),
      lastUpdateDate:
          map['lastUpdateDate'] != "" ? map['createDate'] : DateTime.now(),
      isActived: map['isActived'] ?? '',
      isEmailVerified: map['isEmailVerified'] ?? '',
    );
  }

  /// Google Factory
  factory UserModel.fromUserCredential(User user) {
    return UserModel(
      id: user.uid,
      email: user.email ?? '',
      phone: user.phoneNumber ?? '',
      username: user.displayName?.split(' ').first ?? '',
    );
  }

  // UserModel copyWith({
  //   String? id,
  //   String? name,
  //   String? email,
  //   String? image,
  //   String? phone,
  // }) {
  //   return UserModel(
  //     id: id ?? this.id,
  //     name: name ?? this.name,
  //     email: email ?? this.email,
  //     image: image ?? this.image,
  //     phone: phone ?? this.phone,
  //   );
  // }

  @override
  String toString() {
    // TODO: implement toString
    return createDate.toString();
  }
}
