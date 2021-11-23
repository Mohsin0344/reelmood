import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:realmood/screens/setting.dart';
import 'package:realmood/utils/constant.dart';

class RMDtv extends StatelessWidget {
  const RMDtv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: Image.asset('assets/cms.png',
          fit: BoxFit.cover,
          ),
        ),
      ),
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
        'RMD TV',
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
}
