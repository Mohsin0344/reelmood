// To parse this JSON data, do
//
//     final getDepositAddress = getDepositAddressFromJson(jsonString);

import 'dart:convert';

class GetDepositAddress {
  GetDepositAddress({
    required this.xpub,
    required this.derivationKey,
    required this.address,
    required this.currency,
  });

  String xpub;
  int derivationKey;
  String address;
  String currency;

  factory GetDepositAddress.fromRawJson(String str) => GetDepositAddress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetDepositAddress.fromJson(Map<String, dynamic> json) => GetDepositAddress(
    xpub: json["xpub"],
    derivationKey: json["derivationKey"],
    address: json["address"],
    currency: json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "xpub": xpub,
    "derivationKey": derivationKey,
    "address": address,
    "currency": currency,
  };
}
