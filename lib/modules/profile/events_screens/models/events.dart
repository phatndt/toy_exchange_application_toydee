import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/models/address.dart';

class EventModel {
  final String id;
  final String userId;
  final String name;
  final String? description;
  final String startDate;
  final String endDate;
  final bool finished;

  EventModel({
    required this.id,
    required this.userId,
    required this.name,
    this.description,
    required this.startDate,
    required this.endDate,
    required this.finished,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
      'finished': finished,
    }..removeWhere((key, value) => value == null);
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      startDate: map['startDate'] ?? '',
      endDate: map['endDate'] ?? '',
      finished: map['finished'] ?? false,
    );
  }
}
