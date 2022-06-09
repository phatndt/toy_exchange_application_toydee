import 'package:intl/intl.dart';

class Message {
  final String messageText;
  final DateTime sentAt;
  final String sentBy;

  Message({
    required this.messageText,
    required this.sentAt,
    required this.sentBy,
  });

  Map<String, dynamic> toMap() {
    return {
      'messageText': messageText,
      'sentAt': sentAt,
      'sentBy': sentBy,
    }..removeWhere((key, value) => value == null);
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      messageText: map['messageText'] ?? '',
      sentAt: map['sentAt'] != ""
          ? DateFormat("dd-MM-yyyy HH:mm:ss").parse(map['sentAt'])
          : DateTime.now(),
      sentBy: map['sentBy'] ?? '',
    );
  }
}
