class Address {
  String address;
  String detailAddress;
  String latitude;
  String longitude;

  Address({
    required this.address,
    required this.detailAddress,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'detailAddress': detailAddress,
      'latitude': latitude,
      'longitude': longitude,
    }..removeWhere((key, value) => value == null);
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      address: map['address'] ?? '',
      detailAddress: map['detailAddress'] ?? '',
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
    );
  }
}
