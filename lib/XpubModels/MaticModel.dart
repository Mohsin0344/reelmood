import 'dart:convert';

class MATICXpub {
  MATICXpub({
    required this.mnemonic,
    required this.xpub,
  });

  String mnemonic;
  String xpub;

  factory MATICXpub.fromRawJson(String str) => MATICXpub.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MATICXpub.fromJson(Map<String, dynamic> json) => MATICXpub(
    mnemonic: json["mnemonic"],
    xpub: json["xpub"],
  );

  Map<String, dynamic> toJson() => {
    "mnemonic": mnemonic,
    "xpub": xpub,
  };
}