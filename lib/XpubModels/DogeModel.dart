import 'dart:convert';

class DogeXpub {
  DogeXpub({
    required this.mnemonic,
    required this.xpub,
  });

  String mnemonic;
  String xpub;

  factory DogeXpub.fromRawJson(String str) => DogeXpub.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DogeXpub.fromJson(Map<String, dynamic> json) => DogeXpub(
    mnemonic: json["mnemonic"],
    xpub: json["xpub"],
  );

  Map<String, dynamic> toJson() => {
    "mnemonic": mnemonic,
    "xpub": xpub,
  };
}