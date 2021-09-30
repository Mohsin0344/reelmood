import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:realmood/utils/constant.dart';
import 'package:realmood/widgets/profileCard.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: getAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  'Support',
                  style: style2.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: fifthColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 18, left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        child: ListTile(
                          onTap: () {},
                          title: Text(
                            'Help Center',
                            style: style2.copyWith(fontSize: 13),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        child: ListTile(
                          onTap: () {},
                          title: Text(
                            'Contact Support',
                            style: style2.copyWith(fontSize: 13),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  'About ReelMood',
                  style: style2.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: fifthColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 18, left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        child: ListTile(
                          onTap: () {},
                          title: Text(
                            'Fees & Limits',
                            style: style2.copyWith(fontSize: 13),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        child: ListTile(
                          onTap: () {},
                          title: Text(
                            'Terms & Conditions',
                            style: style2.copyWith(fontSize: 13),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        child: ListTile(
                          onTap: () {},
                          title: Text(
                            'Privacy Notice',
                            style: style2.copyWith(fontSize: 13),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        child: ListTile(
                          onTap: () {},
                          title: Text(
                            'System Status',
                            style: style2.copyWith(fontSize: 13),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        child: ListTile(
                          onTap: () {},
                          title: Text(
                            'Visit Our Website',
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
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  'ReelMood Wallet App Version 1.0',
                  style: style2.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: fifthColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 18, left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        child: ListTile(
                          onTap: () {},
                          title: Text(
                            'Log Out',
                            style: style2.copyWith(fontSize: 13),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
            size: 20,
            color: secondaryColor,
          )),
      title: Text(
        'Setting',
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
