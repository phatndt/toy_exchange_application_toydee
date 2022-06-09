import 'package:intl/intl.dart';

class Chatting {
  final List<Chatting> chattings;
  final String requestedUserId;
  final String requestingUserId;

  Chatting({
    required this.chattings,
    required this.requestedUserId,
    required this.requestingUserId,
  });

      Map<String, dynamic> toMap() {
    return {
      'chattings': chattings,
      'requestedUserId': requestedUserId,
      'requestingUserId': requestingUserId,
    }..removeWhere((key, value) => value == null);
  }

  factory Chatting.fromMap(Map<String, dynamic> map) {
    return Chatting(
      chattings: map['requestedUserId'],
      requestedUserId: map['requestedUserId'] ?? '',
      requestingUserId: map['requestingUserId'] ?? '',
    );
  }
}
