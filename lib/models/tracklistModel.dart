import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class TrackModel {
  final String img;
  final String name, price1, price2;
  TrackModel({
    required this.img,
    required this.name,
    required this.price1,
    required this.price2,
  });
}

class TrackList {
  static List<TrackModel> list = [
    TrackModel(
      img: 'assets/Logo1.png',
      name: 'RMD',
      price1: '\$11,200.15',
      price2: '\$11,200.15',
    ),
    TrackModel(
      img: 'assets/bitcoin.png',
      name: 'BTC',
      price1: '\$25,900.04',
      price2: '\$25,900.04',
    ),
    TrackModel(
      img: 'assets/ethere.png',
      name: 'ETH',
      price1: '\$700.04',
      price2: '\$700.04',
    ),
    TrackModel(
      img: 'assets/lite.png',
      name: 'LITE',
      price1: '\$250.04',
      price2: '\$250.04',
    ),
  ];
}
