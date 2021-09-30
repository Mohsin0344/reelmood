import 'dart:convert';

class BCHXpub {
  BCHXpub({
    required this.mnemonic,
    required this.xpub,
  });

  String mnemonic;
  String xpub;

  factory BCHXpub.fromRawJson(String str) => BCHXpub.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BCHXpub.fromJson(Map<String, dynamic> json) => BCHXpub(
    mnemonic: json["mnemonic"],
    xpub: json["xpub"],
  );

  Map<String, dynamic> toJson() => {
    "mnemonic": mnemonic,
    "xpub": xpub,
  };
}