import 'dart:convert';

class BtcXpub {
  BtcXpub({
    required this.mnemonic,
    required this.xpub,
  });

  String mnemonic;
  String xpub;

  factory BtcXpub.fromRawJson(String str) => BtcXpub.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BtcXpub.fromJson(Map<String, dynamic> json) => BtcXpub(
    mnemonic: json["mnemonic"],
    xpub: json["xpub"],
  );

  Map<String, dynamic> toJson() => {
    "mnemonic": mnemonic,
    "xpub": xpub,
  };
}