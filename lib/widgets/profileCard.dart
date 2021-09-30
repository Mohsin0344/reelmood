import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:realmood/screens/reward.dart';
import 'package:realmood/utils/constant.dart';

upperProfileCard() {
  return InkWell(
    onTap: () {},
    borderRadius: BorderRadius.circular(30),
    child: Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            InkWell(
              onTap: (){
                // _showPicker(context);
              },
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/user.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jhon Doe',
                    style: style1.copyWith(
                        fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '+1213-269-6858',
                    style: style2.copyWith(
                        fontSize: 13, color: secondaryColor.withOpacity(0.8)),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    '${FirebaseAuth.instance.currentUser!.email}',
                    style: style2.copyWith(
                      fontSize: 13,
                      color: secondaryColor.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

middleLanguageAndCurrencyCard() {
  return Container(
    decoration: BoxDecoration(
      color: fifthColor,
      borderRadius: BorderRadius.circular(20),
    ),
    width: double.infinity,
    height: 110,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment Currency',
                  style: style2.copyWith(fontSize: 13),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\$USD',
                  style: style2.copyWith(
                      fontSize: 12, color: secondaryColor.withOpacity(0.7)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Language',
                  style: style2.copyWith(fontSize: 13),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'English',
                  style: style2.copyWith(
                      fontSize: 12, color: secondaryColor.withOpacity(0.7)),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

bottomSecurityAndGeneralCard() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: fifthColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            height: 40,
            child: ListTile(
              onTap: () {},
              title: Text(
                'Enable Face ID/Touch ID',
                style: style2.copyWith(fontSize: 13),
              ),
            ),
          ),
          Container(
            height: 40,
            child: ListTile(
              onTap: () {},
              title: Text(
                'Passcode Setting',
                style: style2.copyWith(fontSize: 13),
              ),
            ),
          ),
          Container(
            height: 40,
            child: ListTile(
              onTap: () {},
              title: Text(
                'Change Passcode',
                style: style2.copyWith(fontSize: 13),
              ),
            ),
          ),
          Container(
            height: 40,
            child: ListTile(
              onTap: () {},
              title: Text(
                '2-Factor Authentification',
                style: style2.copyWith(fontSize: 13),
              ),
            ),
          ),
          Container(
            height: 40,
            child: ListTile(
              onTap: () {},
              title: Text(
                'Notification Setting',
                style: style2.copyWith(fontSize: 13),
              ),
            ),
          ),
          Container(
            height: 40,
            child: ListTile(
              onTap: () {
                Get.to(RewardsScreen());
              },
              title: Text(
                'Your Rewards',
                style: style2.copyWith(fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

