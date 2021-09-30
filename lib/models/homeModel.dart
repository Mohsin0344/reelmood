import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class HomeModel {
  final String img;
  final String name, percent, price;
  HomeModel({
    required this.img,
    required this.name,
    required this.percent,
    required this.price,
  });
}

class HomeList {
  static List<HomeModel> list = [
    HomeModel(
      img: 'assets/Logo1.png',
      name: 'RMD',
      price: '\$8.04',
      percent: '+124 %',
    ),
    HomeModel(
      img: 'assets/bitcoin.png',
      name: 'BTC',
      price: '\$8.04',
      percent: '+124 %',
    ),
    HomeModel(
      img: 'assets/ethere.png',
      name: 'ETH',
      price: '\$8.04',
      percent: '+124 %',
    ),
    HomeModel(
      img: 'assets/lite.png',
      name: 'LITE',
      price: '\$8.04',
      percent: '+124 %',
    ),
  ];
}
