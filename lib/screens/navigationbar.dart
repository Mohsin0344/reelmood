import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:realmood/screens/RMDtv.dart';
import 'package:realmood/screens/home.dart';
import 'package:realmood/screens/portfolio.dart';
import 'package:realmood/screens/profile.dart';
import 'package:realmood/screens/setting.dart';
import 'package:realmood/screens/track.dart';
import 'package:realmood/utils/constant.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  int _page = 0;
  String title = 'Home';
  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  final List<Widget> _children = [
    Home(),
    PortFolio(),
    Track(),
    Profile(),
  ];

  final iconList = <IconData>[
    LineIcons.home,
    Icons.cases_outlined,
    LineIcons.signal,
    LineIcons.userAlt,
  ];
  final name = [
    'Home',
    'Wallet',
    'Prices',
    'Profile',
  ];

  @override
  void initState() {
    super.initState();
    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.2,
        0.5,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);
    Future.delayed(
      Duration(seconds: 1),
          () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        extendBody: true,
        backgroundColor: const Color(0xff191926),
        appBar: getAppBar(),
        body: Container(
          child: _children[_page],
        ),
        floatingActionButton: ScaleTransition(
          scale: animation,
          child: FloatingActionButton(
            elevation: 8,
            backgroundColor: fifthColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage('assets/Logo1.png'),
                height: 30,
              ),
            ),
            onPressed: () {
              _animationController.reset();
              _animationController.forward();
              Get.to(RMDtv());
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? tertiaryColor : Colors.white;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconList[index],
                  size: 24,
                  color: color,
                ),
                const SizedBox(height: 2),
                Text(
                  name[index],
                  style: style2.copyWith(color: color, fontSize: 8),
                ),
              ],
            );
          },
          backgroundColor: fifthColor,
          activeIndex: _page,
          splashColor: tertiaryColor,
          notchAndCornersAnimation: animation,
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          gapLocation: GapLocation.center,
          leftCornerRadius: 2,
          rightCornerRadius: 2,
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
      ),
    );
  }

  getAppBar() {
    // if (_page == 0) {
    //   setState(() {
    //     title = 'Home';
    //   });
    // } else if (_page == 1) {
    //   setState(() {
    //     title = 'Portfolio';
    //   });
    // } else if (_page == 2) {
    //   setState(() {
    //     title = 'Track';
    //   });
    // } else if (_page == 3) {
    //   setState(() {
    //     title = 'Profile';
    //   });
    // }
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 0.0,
      leading: InkWell(
          onTap: (){
            Get.to(Setting());
          },
          child: Padding(
              padding: EdgeInsets.all(16),
              child: Image.asset('assets/settings.png'))
      ),
      actions: [
        Padding(
            padding: EdgeInsets.all(18),
            child: Image.asset('assets/arrow.png')),
        Padding(
            padding: EdgeInsets.all(18),
            child: Image.asset('assets/mesg.png')),
      ],
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
