// To parse this JSON data, do
//
//     final BSCPrivate = BSCPrivateFromJson(jsonString);

import 'dart:convert';

class BSCPrivate {
  BSCPrivate({
    required this.key,
  });

  String key;

  factory BSCPrivate.fromRawJson(String str) => BSCPrivate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BSCPrivate.fromJson(Map<String, dynamic> json) => BSCPrivate(
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
  };
}
