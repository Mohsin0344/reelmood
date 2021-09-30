// To parse this JSON data, do
//
//     final MATICPrivate = MATICPrivateFromJson(jsonString);

import 'dart:convert';

class MATICPrivate {
  MATICPrivate({
    required this.key,
  });

  String key;

  factory MATICPrivate.fromRawJson(String str) => MATICPrivate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MATICPrivate.fromJson(Map<String, dynamic> json) => MATICPrivate(
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
  };
}
