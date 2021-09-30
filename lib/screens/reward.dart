import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:realmood/models/rewardCircledUsersModel.dart';
import 'package:realmood/utils/constant.dart';
import 'package:realmood/widgets/pressedwidget.dart';
import 'package:realmood/widgets/rewardcircleuserWidget.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  getAppBar() {
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 0.0,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: secondaryColor,
            size: 20,
          )),
      title: Text(
        'Rewards Hub',
        style: style2,
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              LineIcons.share,
              color: secondaryColor,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              LineIcons.facebookMessenger,
              color: secondaryColor,
            )),
      ],
    );
  }

  getBody() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            totalEarnedCard(),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Total Reffered',
                style: style2,
              ),
            ),
            totalReffered(),
            SizedBox(
              height: 35,
            ),
            bottomRMDTokenCard(),
            SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }

  Widget rewardUserCircle() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: RewardCardList.list.length,
      itemBuilder: (BuildContext context, int index) =>
          buildRewardCard(context, index),
    );
  }

  totalReffered() {
    return Container(
      decoration: BoxDecoration(
        color: fifthColor,
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: secondaryColor.withOpacity(0.4),
                  size: 15,
                ),
              ),
            ),
            Expanded(
              child: Container(height: 65, child: rewardUserCircle()),
            ),
            Container(
              margin: EdgeInsets.all(5),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: Text(
                '60+',
                style: style2.copyWith(
                    color: secondaryColor.withOpacity(0.6), fontSize: 9),
              )),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: secondaryColor.withOpacity(0.4),
                  size: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  totalEarnedCard() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: fifthColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(45.0),
        child: CircularPercentIndicator(
          radius: 200.0,
          lineWidth: 15.0,
          percent: 0.7,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Earned',
                style: style2.copyWith(
                    fontSize: 10, color: secondaryColor.withOpacity(0.5)),
              ),
              Text(
                '\$300.00',
                style: style1,
              ),
            ],
          ),
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: Colors.grey.withOpacity(0.1),
          progressColor: tertiaryColor,
        ),
      ),
    );
  }

  bottomRMDTokenCard() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        gradient: gradient1,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 140,
                      decoration: BoxDecoration(
                        color: fourthColor.withOpacity(0.7),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      child: Container(
                          width: double.infinity,
                          child: Center(
                              child: Image(
                            image: AssetImage('assets/chandcoin.png'),
                            height: 100,
                          )))),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 60,
                      child: Center(
                          child: Text(
                        'Your Refferel Code',
                        style: style2.copyWith(
                            fontSize: 9,
                            color: secondaryColor.withOpacity(0.7)),
                      ))),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 40,
                      child: Center(
                          child: Text(
                        '9nfdk06415iklg',
                        style: style2.copyWith(fontWeight: FontWeight.bold),
                      ))),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Refer & Get',
                    style: style1.copyWith(fontSize: 17),
                  ),
                  Text(
                    '\$RMD Tokens',
                    style: style1.copyWith(fontSize: 16),
                  ),
                  Text(
                    'Unlimited bonus for you',
                    style: style2.copyWith(
                        fontSize: 11, color: secondaryColor.withOpacity(0.7)),
                  ),
                  Text(
                    'and your friends',
                    style: style2.copyWith(
                        fontSize: 11, color: secondaryColor.withOpacity(0.7)),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  shareButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
