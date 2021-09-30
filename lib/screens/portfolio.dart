import 'package:flutter/material.dart';
import 'package:realmood/models/portfolioModel.dart';
import 'package:realmood/utils/constant.dart';
import 'package:realmood/widgets/portfolioWidget.dart';
import 'package:realmood/widgets/pressedwidget.dart';

class PortFolio extends StatelessWidget {
  const PortFolio({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 15, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Portfolio Balance',
                        style: style2.copyWith(
                            color: secondaryColor.withOpacity(0.6),
                            fontSize: 10),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('48,350.02', style: style1),
                          Padding(
                            padding: const EdgeInsets.only(top: 11, left: 5),
                            child: Text(
                              'USD',
                              style: style2.copyWith(fontSize: 11),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: PortfolioList.list.length,
                      itemBuilder: (BuildContext context, int index) =>
                          buildPortfolioCard(context, index),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(left: 100,right: 100,bottom: 100, child: buyCustomButton(() {}),),
        ],
      ),

    );
  }
}
