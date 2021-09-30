import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realmood/models/onboardingslist.dart';
import 'package:realmood/screens/signin.dart';
import 'package:realmood/utils/constant.dart';
import 'package:realmood/widgets/pressedwidget.dart';

class Onbording extends StatefulWidget {
  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          children: [
            SizedBox(height: size.height*0.04,),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.topCenter,
                child: Image(
                  image: AssetImage('assets/logo2.png'),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: PageView.builder(
                controller: _controller,
                physics: BouncingScrollPhysics(),
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex:5,
                          child: Image.asset(
                            contents[i].image,
                          ),
                        ),
                        SizedBox(height: size.height*0.01,),
                        Expanded(
                          child: Text(
                            contents[i].title,
                            style: style1,
                  ),
                        ),
                        Expanded(
                          child: Text(
                            contents[i].discription,
                            textAlign: TextAlign.center,
                            style: style2.copyWith(color: secondaryColor.withOpacity(0.5),fontSize: 11),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    contents.length,
                        (index) => buildDot(index, context),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: ElevatedButton(
                onPressed: (){
                  if (currentIndex == contents.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SignIn(),
                      ),
                    );
                  }
                  _controller!.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 16),
                  child: Text(
                    currentIndex == contents.length - 1 ? "Continue" : "Next",
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: fifthColor,
                  onPrimary: tertiaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 3.5,
      width: currentIndex == index ? 30 : 15,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: currentIndex == index? secondaryColor:Colors.grey.withOpacity(0.2),
      ),
    );
  }
}
