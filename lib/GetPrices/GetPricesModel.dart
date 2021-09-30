// To parse this JSON data, do
//
//     final getPricesModel = getPricesModelFromJson(jsonString);

import 'dart:convert';

class GetPricesModel {
  GetPricesModel({
    required this.assetId,
    required this.name,
    required this.typeIsCrypto,
    required this.dataQuoteStart,
    required this.dataQuoteEnd,
    required this.dataOrderbookStart,
    required this.dataOrderbookEnd,
    required this.dataTradeStart,
    required this.dataTradeEnd,
    required this.dataSymbolsCount,
    required this.volume1HrsUsd,
    required this.volume1DayUsd,
    required this.volume1MthUsd,
    required this.priceUsd,
    required this.idIcon,
    required this.dataStart,
    required this.dataEnd,
  });

  String assetId;
  String name;
  int typeIsCrypto;
  DateTime dataQuoteStart;
  DateTime dataQuoteEnd;
  DateTime dataOrderbookStart;
  DateTime dataOrderbookEnd;
  DateTime dataTradeStart;
  DateTime dataTradeEnd;
  int dataSymbolsCount;
  double volume1HrsUsd;
  int volume1DayUsd;
  int volume1MthUsd;
  double priceUsd;
  String idIcon;
  DateTime dataStart;
  DateTime dataEnd;

  factory GetPricesModel.fromRawJson(String str) => GetPricesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetPricesModel.fromJson(Map<String, dynamic> json) => GetPricesModel(
    assetId: json["asset_id"],
    name: json["name"],
    typeIsCrypto: json["type_is_crypto"],
    dataQuoteStart: DateTime.parse(json["data_quote_start"]),
    dataQuoteEnd: DateTime.parse(json["data_quote_end"]),
    dataOrderbookStart: DateTime.parse(json["data_orderbook_start"]),
    dataOrderbookEnd: DateTime.parse(json["data_orderbook_end"]),
    dataTradeStart: DateTime.parse(json["data_trade_start"]),
    dataTradeEnd: DateTime.parse(json["data_trade_end"]),
    dataSymbolsCount: json["data_symbols_count"],
    volume1HrsUsd: json["volume_1hrs_usd"].toDouble(),
    volume1DayUsd: json["volume_1day_usd"],
    volume1MthUsd: json["volume_1mth_usd"],
    priceUsd: json["price_usd"].toDouble(),
    idIcon: json["id_icon"],
    dataStart: DateTime.parse(json["data_start"]),
    dataEnd: DateTime.parse(json["data_end"]),
  );

  Map<String, dynamic> toJson() => {
    "asset_id": assetId,
    "name": name,
    "type_is_crypto": typeIsCrypto,
    "data_quote_start": dataQuoteStart.toIso8601String(),
    "data_quote_end": dataQuoteEnd.toIso8601String(),
    "data_orderbook_start": dataOrderbookStart.toIso8601String(),
    "data_orderbook_end": dataOrderbookEnd.toIso8601String(),
    "data_trade_start": dataTradeStart.toIso8601String(),
    "data_trade_end": dataTradeEnd.toIso8601String(),
    "data_symbols_count": dataSymbolsCount,
    "volume_1hrs_usd": volume1HrsUsd,
    "volume_1day_usd": volume1DayUsd,
    "volume_1mth_usd": volume1MthUsd,
    "price_usd": priceUsd,
    "id_icon": idIcon,
    "data_start": "${dataStart.year.toString().padLeft(4, '0')}-${dataStart.month.toString().padLeft(2, '0')}-${dataStart.day.toString().padLeft(2, '0')}",
    "data_end": "${dataEnd.year.toString().padLeft(4, '0')}-${dataEnd.month.toString().padLeft(2, '0')}-${dataEnd.day.toString().padLeft(2, '0')}",
  };
}
