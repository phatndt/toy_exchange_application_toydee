import 'package:firebase_auth/firebase_auth.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/models/address.dart';

class UserModel {
  final String id;
  final String username;
  final String email;
  final String phone;
  final String? firstName;
  final String? lastName;
  final DateTime? birthday;
  final bool? gender;
  final Address? address;
  final String? imageUrl;
  final DateTime? createDate;
  final DateTime? lastUpdateDate;
  final bool? isActived;
  final bool? isEmailVerified;

  UserModel({
    required this.id,
    required this.email,
    required this.phone,
    required this.username,
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
      username: map['username'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      birthday: map['birthday'] ?? '',
      gender: map['gender'] ?? '',
      address: Address.fromMap(map['address'] ?? ''),
      imageUrl: map['imageUrl'] ?? '',
      createDate: map['createDate'] ?? '',
      lastUpdateDate: map['lastUpdateDate'] ?? '',
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
}
