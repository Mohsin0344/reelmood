import 'dart:convert';

class LTCXpub {
  LTCXpub({
    required this.mnemonic,
    required this.xpub,
  });

  String mnemonic;
  String xpub;

  factory LTCXpub.fromRawJson(String str) => LTCXpub.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LTCXpub.fromJson(Map<String, dynamic> json) => LTCXpub(
    mnemonic: json["mnemonic"],
    xpub: json["xpub"],
  );

  Map<String, dynamic> toJson() => {
    "mnemonic": mnemonic,
    "xpub": xpub,
  };
}