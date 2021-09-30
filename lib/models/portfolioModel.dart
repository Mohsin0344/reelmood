import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class PortfolioModel {
  final String img;
  final String name, price;
  PortfolioModel({
    required this.img,
    required this.name,
    required this.price,
  });
}

class PortfolioList {
  static List<PortfolioModel> list = [
    PortfolioModel(
      img: 'assets/Logo1.png',
      name: 'RMD',
      price: '\$8,200.04',
    ),
    PortfolioModel(
      img: 'assets/bitcoin.png',
      name: 'BTC',
      price: '\$8.0014',
    ),
    PortfolioModel(
      img: 'assets/ethere.png',
      name: 'ETH',
      price: '\$77,00.04',
    ),
    PortfolioModel(
      img: 'assets/lite.png',
      name: 'LITE',
      price: '\$318.046',
    ),
  ];
}
