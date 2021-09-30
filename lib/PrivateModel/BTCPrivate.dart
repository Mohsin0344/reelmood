// To parse this JSON data, do
//
//     final BTCPrivate = BTCPrivateFromJson(jsonString);

import 'dart:convert';

class BTCPrivate {
  BTCPrivate({
    required this.key,
  });

  String key;

  factory BTCPrivate.fromRawJson(String str) => BTCPrivate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BTCPrivate.fromJson(Map<String, dynamic> json) => BTCPrivate(
    key: json["key"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
  };
}
