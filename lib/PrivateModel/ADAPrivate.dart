// To parse this JSON data, do
//
//     final private = privateFromJson(jsonString);

import 'dart:convert';

class ADAPrivate {
  ADAPrivate({
    required this.key,
  });

  String key;

  factory ADAPrivate.fromRawJson(String str) => ADAPrivate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ADAPrivate.fromJson(Map<String, dynamic> json) => ADAPrivate(
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
  };
}
