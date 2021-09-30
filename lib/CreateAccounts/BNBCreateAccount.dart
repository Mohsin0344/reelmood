// To parse this JSON data, do
//
//     final BNBCreateAccount = BNBCreateAccountFromJson(jsonString);

import 'dart:convert';

class BNBCreateAccount {
  BNBCreateAccount({
    required this.currency,
    required this.active,
    required this.balance,
    required this.accountCode,
    required this.accountNumber,
    required this.frozen,
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
  String accountingCurrency;
  String customerId;
  String id;

  factory BNBCreateAccount.fromRawJson(String str) => BNBCreateAccount.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BNBCreateAccount.fromJson(Map<String, dynamic> json) => BNBCreateAccount(
    currency: json["currency"],
    active: json["active"],
    balance: Balance.fromJson(json["balance"]),
    accountCode: json["accountCode"],
    accountNumber: json["accountNumber"],
    frozen: json["frozen"],
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
