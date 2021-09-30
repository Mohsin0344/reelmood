// To parse this JSON data, do
//
//     final DOGEPrivate = DOGEPrivateFromJson(jsonString);

import 'dart:convert';

class DOGEPrivate {
  DOGEPrivate({
    required this.key,
  });

  String key;

  factory DOGEPrivate.fromRawJson(String str) => DOGEPrivate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DOGEPrivate.fromJson(Map<String, dynamic> json) => DOGEPrivate(
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
  };
}
