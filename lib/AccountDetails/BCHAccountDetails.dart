// To parse this JSON data, do
//
//     final BCHAccountDetails = BCHAccountDetailsFromJson(jsonString);

import 'dart:convert';

class BCHAccountDetails {
  BCHAccountDetails({
    required this.currency,
    required this.active,
    required this.balance,
    required this.accountCode,
    required this.accountNumber,
    required this.frozen,
    required this.xpub,
    required this.accountingCurrency,
    required this.customerId,
    required this.id,
  });

  String currency;
  bool active;
  Balance balance;
  String accountCode;
  String accountNumber;
  bool frozen;
  String xpub;
  String accountingCurrency;
  String customerId;
  String id;

  factory BCHAccountDetails.fromRawJson(String str) => BCHAccountDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BCHAccountDetails.fromJson(Map<String, dynamic> json) => BCHAccountDetails(
    currency: json["currency"],
    active: json["active"],
    balance: Balance.fromJson(json["balance"]),
    accountCode: json["accountCode"],
    accountNumber: json["accountNumber"],
    frozen: json["frozen"],
    xpub: json["xpub"],
    accountingCurrency: json["accountingCurrency"],
    customerId: json["customerId"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "currency": currency,
    "active": active,
    "balance": balance.toJson(),
    "accountCode": accountCode,
    "accountNumber": accountNumber,
    "frozen": frozen,
    "xpub": xpub,
    "accountingCurrency": accountingCurrency,
    "customerId": customerId,
    "id": id,
  };
}

class Balance {
  Balance({
    required this.accountBalance,
    required this.availableBalance,
  });

  String accountBalance;
  String availableBalance;

  factory Balance.fromRawJson(String str) => Balance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Balance.fromJson(Map<String, dynamic> json) => Balance(
    accountBalance: json["accountBalance"],
    availableBalance: json["availableBalance"],
  );

  Map<String, dynamic> toJson() => {
    "accountBalance": accountBalance,
    "availableBalance": availableBalance,
  };
}
