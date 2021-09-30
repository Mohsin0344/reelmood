// To parse this JSON data, do
//
//     final LTCPrivate = LTCPrivateFromJson(jsonString);

import 'dart:convert';

class LTCPrivate {
  LTCPrivate({
    required this.key,
  });

  String key;

  factory LTCPrivate.fromRawJson(String str) => LTCPrivate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LTCPrivate.fromJson(Map<String, dynamic> json) => LTCPrivate(
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
  };
}
