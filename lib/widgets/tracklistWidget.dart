import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realmood/models/tracklistModel.dart';
import 'package:realmood/utils/constant.dart';

Widget buildTrackCard(BuildContext context, int index) {
  final data = TrackList.list[index];
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(30),
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
            SizedBox(
              width: 5,
            ),
            Text(
              data.price1,
              style: style2.copyWith(
                fontSize: 11,
                color: secondaryColor.withOpacity(0.8),
              ),
            ),
            Text(
              data.price2,
              style: style2.copyWith(
                fontSize: 11,
                color: secondaryColor.withOpacity(0.8),
              ),
            ),
          ],
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
