import 'dart:convert';

class ADAXpub {
  ADAXpub({
    required this.mnemonic,
    required this.xpub,
  });

  String mnemonic;
  String xpub;

  factory ADAXpub.fromRawJson(String str) => ADAXpub.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ADAXpub.fromJson(Map<String, dynamic> json) => ADAXpub(
    mnemonic: json["mnemonic"],
    xpub: json["xpub"],
  );

  Map<String, dynamic> toJson() => {
    "mnemonic": mnemonic,
    "xpub": xpub,
  };
}