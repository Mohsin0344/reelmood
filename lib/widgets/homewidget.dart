import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:line_icons/line_icons.dart';
import 'package:realmood/models/homeModel.dart';
import 'package:realmood/utils/constant.dart';

Widget buildHomeCard(BuildContext context, int index) {
  final data = HomeList.list[index];
  return Padding(
    padding: const EdgeInsets.only(bottom: 9),
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
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name,
                        style: style2.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        'Watchlist',
                        style: style2.copyWith(
                            color: secondaryColor.withOpacity(0.6),
                            fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    data.price,
                    style: style2.copyWith(
                        color: secondaryColor.withOpacity(0.6), fontSize: 10),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    data.percent,
                    style: style2.copyWith(
                        color: secondaryColor.withOpacity(0.6), fontSize: 10),
                  ),
                ],
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
