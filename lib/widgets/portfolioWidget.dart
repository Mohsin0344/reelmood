import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:realmood/models/portfolioModel.dart';
import 'package:realmood/utils/constant.dart';

Widget buildPortfolioCard(BuildContext context, int index) {
  final data = PortfolioList.list[index];
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: fifthColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  imageCard(data.img),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    data.name,
                    style: style2.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                data.price,
                style: style2.copyWith(
                  fontSize: 12,
                  color: secondaryColor.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget imageCard(String img) {
  return Container(
    height: 40,
    width: 40,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey.withOpacity(0.1),
    ),
    child: Center(
        child: Image(
      image: AssetImage(img),
      height: 30,
      width: 20,
    )),
  );
}
