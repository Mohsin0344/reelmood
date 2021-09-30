import 'dart:async';
import 'package:flutter/material.dart';
import 'package:realmood/screens/onboardings.dart';
import 'package:realmood/screens/signin.dart';
import 'package:realmood/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class Splash1 extends StatefulWidget {
  static String id = "Splash1";
  @override
  _Splash1State createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  startTime() async {
    var _duration = new Duration(minutes: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async{

    SharedPreferences pref=  await SharedPreferences.getInstance();
    bool value= pref.containsKey('key');

    if(value==true)
    {
      // send the user to the home page
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (BuildContext context) {
          return SignIn(); //Login()
        },
      ),
            (r) => false,
      );
    }
    else
    {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return Onbording();
          },
        ),
            (r) => false,
      );
    }

//  Navigator.pushNamed(context, SignInPage.id);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryColor,
      body:Center(
          child: WidgetCircularAnimator(
            outerColor: tertiaryColor,
            innerColor: fourthColor,
            outerAnimationSeconds: 5,
            innerAnimation:Curves.bounceIn,
            outerAnimation: Curves.linear,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(image: AssetImage('assets/logo2.png'),height: 150,),
            ),
          )),
      bottomNavigationBar: Container(
          height: 30,width: double.infinity,
          child: Center(child:
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text('MUSIC . STREAM . WATCH . CRYPTO',style: style2.copyWith(fontSize: 12,color: tertiaryColor,fontWeight: FontWeight.bold),),
          ))),
    );
  }
}

