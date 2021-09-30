import 'dart:convert';

class BSCXpub {
  BSCXpub({
    required this.mnemonic,
    required this.xpub,
  });

  String mnemonic;
  String xpub;

  factory BSCXpub.fromRawJson(String str) => BSCXpub.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BSCXpub.fromJson(Map<String, dynamic> json) => BSCXpub(
    mnemonic: json["mnemonic"],
    xpub: json["xpub"],
  );

  Map<String, dynamic> toJson() => {
    "mnemonic": mnemonic,
    "xpub": xpub,
  };
}