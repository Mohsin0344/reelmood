// To parse this JSON data, do
//
//     final ETHPrivate = ETHPrivateFromJson(jsonString);

import 'dart:convert';

class ETHPrivate {
  ETHPrivate({
    required this.key,
  });

  String key;

  factory ETHPrivate.fromRawJson(String str) => ETHPrivate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ETHPrivate.fromJson(Map<String, dynamic> json) => ETHPrivate(
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
  };
}
