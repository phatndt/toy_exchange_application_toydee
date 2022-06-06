class Request {
  final String id;
  final String requestedSwapToyId;
  final String requestedUserId;
  final String requestingSwapToyId;
  final String requestingUserId;
  final String status;

  Request({
    required this.id,
    required this.requestedSwapToyId,
    required this.requestedUserId,
    required this.requestingSwapToyId,
    required this.requestingUserId,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'requestedSwapToyId': requestedSwapToyId,
      'requestedUserId': requestedUserId,
      'requestingSwapToyId': requestingSwapToyId,
      'requestingUserId': requestingUserId,
      'status': status,
    }..removeWhere((key, value) => value == null);
  }

  factory Request.fromMap(Map<String, dynamic> map) {
    return Request(
      id: map['id'] ?? '',
      requestedSwapToyId: map['requestedSwapToyId'] ?? '',
      requestedUserId: map['requestedUserId'] ?? '',
      requestingSwapToyId: map['requestingSwapToyId'] ?? '',
      requestingUserId: map['requestingUserId'] ?? '',
      status: map['status'] ?? '',
    );
  }
}
