import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realmood/screens/LocalAuth.dart';
import 'package:realmood/screens/navigationbar.dart';
import 'package:realmood/screens/onboardings.dart';
import 'package:realmood/screens/phoneNumberScreen.dart';
import 'package:realmood/screens/signin.dart';
import 'package:realmood/screens/splash.dart';
import 'package:realmood/screens/splash1.dart';
import 'package:realmood/session.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await App.init();
  var status=  App.localStorage!.getString("id");
  if(App.localStorage!.getString('id')== null){
    await App.init();
    await App.localStorage!.setString("id", "0");
  }
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(new MyApp(id: status));
  });
}

class MyApp extends StatelessWidget {
  var id;
  MyApp({this.id});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Reel Mood',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: id == '0' ? Splash() : LocalAuthScreen(),
      // home: PhoneNumberScreen(
      //   email: 'mk@gmail.com',
      //   password: '123456',
      //   fullName: 'Mohsin Khan',
      // ),
    );
  }
}
