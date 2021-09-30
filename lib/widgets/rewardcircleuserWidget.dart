import 'package:flutter/material.dart';
import 'package:realmood/models/rewardCircledUsersModel.dart';

Widget buildRewardCard(BuildContext context, int index) {
  final data = RewardCardList.list[index];
  return Container(
    margin: EdgeInsets.all(5.5),
    height: 40,
    width: 40,
    decoration: BoxDecoration(
      color: data.color,
      image: DecorationImage(
        image: AssetImage(
          data.imagePath,
        ),
        fit: BoxFit.fitWidth,
      ),
      shape: BoxShape.circle,
    ),
  );
}
