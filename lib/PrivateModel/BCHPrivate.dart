// To parse this JSON data, do
//
//     final BCHPrivate = BCHPrivateFromJson(jsonString);

import 'dart:convert';

class BCHPrivate {
  BCHPrivate({
    required this.key,
  });

  String key;

  factory BCHPrivate.fromRawJson(String str) => BCHPrivate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BCHPrivate.fromJson(Map<String, dynamic> json) => BCHPrivate(
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
  };
}
