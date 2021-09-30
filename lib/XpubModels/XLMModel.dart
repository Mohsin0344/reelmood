import 'dart:convert';

class XLMXpub {
  XLMXpub({
    required this.address,
    required this.secret,
  });

  String address;
  String secret;

  factory XLMXpub.fromRawJson(String str) => XLMXpub.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory XLMXpub.fromJson(Map<String, dynamic> json) => XLMXpub(
    address: json["address"],
    secret: json["secret"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "secret": secret,
  };
}