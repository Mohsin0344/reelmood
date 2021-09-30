import 'package:flutter/material.dart';
import 'package:realmood/utils/constant.dart';

class RewardCard {
  String imagePath;
  Color color;

  RewardCard({required this.imagePath, required this.color});
}

class RewardCardList {
  static List<RewardCard> list = [
    RewardCard(
      imagePath: 'assets/u9.png',
      color: tertiaryColor,
    ),
    RewardCard(
      imagePath: 'assets/u11.png',
      color: Colors.green,
    ),
    RewardCard(
      imagePath: 'assets/u15.png',
      color: Colors.red,
    ),
    RewardCard(
      imagePath: 'assets/u16.png',
      color: Colors.yellow,
    ),
    RewardCard(
      imagePath: 'assets/u17.png',
      color: Colors.pink,
    ),
  ];
}
