import 'dart:convert';

class ETHXpub {
  ETHXpub({
    required this.mnemonic,
    required this.xpub,
  });

  String mnemonic;
  String xpub;

  factory ETHXpub.fromRawJson(String str) => ETHXpub.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ETHXpub.fromJson(Map<String, dynamic> json) => ETHXpub(
    mnemonic: json["mnemonic"],
    xpub: json["xpub"],
  );

  Map<String, dynamic> toJson() => {
    "mnemonic": mnemonic,
    "xpub": xpub,
  };
}