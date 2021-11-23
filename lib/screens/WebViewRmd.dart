import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realmood/utils/constant.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RmdNews extends StatefulWidget {
  const RmdNews({Key? key}) : super(key: key);

  @override
  _RmdNewsState createState() => _RmdNewsState();
}

class _RmdNewsState extends State<RmdNews> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Get.width * 0.15
            ),
            child: Text(
                'Purchase Crypto from our\nOfficial Partners below',
                style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: 19,
                  color: Color(0xffa93bfd),
                  height: 1.2000000602320622,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
          ),
          SizedBox(
            height: Get.height * 0.08,
          ),
          Center(
            child: Container(
              width: Get.width * 0.55,
              height: Get.height * 0.10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.74),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
              child: Center(
                child: Image.asset('assets/changelly.png',
                width: Get.width * 0.35,
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Center(
            child: Container(
              width: Get.width * 0.56,
              child: Text(
                'Receive \$5 and earn Free Bitcoin from your first trade on the Changelly exchange.',
                style: TextStyle(
                  fontFamily: 'Poppins-Regular',
                  fontSize: 12,
                  color: const Color(0xffffffff),
                  height: 1.1666666666666667,
                ),
                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          Center(
            child: Container(
              width: Get.width * 0.55,
              height: Get.height * 0.10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.74),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
              child: Center(
                child: Image.asset('assets/coinbase.png',
                  width: Get.width * 0.35,
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Center(
            child: Container(
              width: Get.width * 0.56,
              child: Text(
                'You’ll get \$10 in free Bitcoin when you buy or sell \$100 or more in crypto.',
                style: TextStyle(
                  fontFamily: 'Poppins-Regular',
                  fontSize: 12,
                  color: const Color(0xffffffff),
                  height: 1.1666666666666667,
                ),
                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          Center(
            child: Container(
              width: Get.width * 0.55,
              height: Get.height * 0.10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.74),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
              child: Center(
                child: Image.asset('assets/paxful.png',
                  width: Get.width * 0.35,
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Center(
            child: Container(
              width: Get.width * 0.56,
              child: Text(
                'Get 50% cashback when you buy bitcoin for the first time on Paxful',
                style: TextStyle(
                  fontFamily: 'Poppins-Regular',
                  fontSize: 12,
                  color: const Color(0xffffffff),
                  height: 1.1666666666666667,
                ),
                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      )
    );
  }
}
