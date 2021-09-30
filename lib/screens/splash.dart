import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:realmood/screens/onboardings.dart';
import 'package:realmood/utils/constant.dart';

class Splash extends StatelessWidget {
  static String id='Splash';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: SplashScreen());
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            home: Scaffold(body: Onbording(),),
          );
        }
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: AnimatedSplashScreen(
        duration: 4000,
        splash:'assets/logo2.png',
        splashIconSize: 150,
        nextScreen: Onbording(),
        splashTransition: SplashTransition.rotationTransition,
        pageTransitionType: PageTransitionType.scale,
        backgroundColor: primaryColor,
      ),
      bottomNavigationBar: Container(
        color: primaryColor,
          height: 30,width: double.infinity,
          child: Center(child:
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text('MUSIC . STREAM . WATCH . CRYPTO',style: style2.copyWith(fontSize: 12,color: fourthColor,fontWeight: FontWeight.bold),),
          ))),
    );
  }
}
