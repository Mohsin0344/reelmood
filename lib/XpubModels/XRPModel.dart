import 'dart:convert';

class XRPXpub {
  XRPXpub({
    required this.address,
    required this.secret,
  });

  String address;
  String secret;

  factory XRPXpub.fromRawJson(String str) => XRPXpub.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory XRPXpub.fromJson(Map<String, dynamic> json) => XRPXpub(
    address: json["address"],
    secret: json["secret"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "secret": secret,
  };
}