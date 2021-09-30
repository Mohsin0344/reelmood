import 'dart:convert';

class BNBXpub {
  BNBXpub({
    required this.address,
    required this.privateKey,
  });

  String address;
  String privateKey;

  factory BNBXpub.fromRawJson(String str) => BNBXpub.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BNBXpub.fromJson(Map<String, dynamic> json) => BNBXpub(
    address: json["address"],
    privateKey: json["privateKey"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "privateKey": privateKey,
  };
}