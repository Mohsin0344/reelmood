import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:realmood/screens/OtpForLoggingUser.dart';
import 'package:realmood/screens/home.dart';
import 'package:realmood/screens/navigationbar.dart';
import 'package:realmood/screens/signup.dart';
import 'package:realmood/session.dart';
import 'package:realmood/utils/constant.dart';
import 'package:realmood/widgets/inputWidget.dart';
import 'package:realmood/widgets/pressedwidget.dart';
import 'package:realmood/widgets/socialloginButtons.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: isLoading == false ? getBody(context) :
        Center(
          child: CircularProgressIndicator(),
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }

  getBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          upperImageContainer(),
          Expanded(
              flex: 5,
              child: Container(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Form(
                    key: _formKey,
                    child: Column(children: [
                      upperSignInSinUpButton(context),
                      SizedBox(height: size.height * 0.05),
                      input('Email Address', emailController,
                          (email){
                            if(EmailValidator.validate(email) == true){
                              return null;
                            } else return 'Enter correct email';
                          }),
                      SizedBox(height: size.height * 0.01),
                      takeInput(true,'Password', passwordController,
                          isObscure == true ? LineIcons.eyeSlash : Icons.visibility,
                              (password){
                            if(password.toString().length < 6){
                              return "Enter strong password";
                            }else return null;
                          }),
                      SizedBox(height: size.height * 0.05),
                      customButton('Login', () async{
                        print('tapped');
                        if(_formKey.currentState!.validate()){
                          _formKey.currentState!.save();
                          setState(() {
                            isLoading = true;
                          });
                          await userLogin(emailController.text,
                            passwordController.text, context
                          );
                          if(isLoading == false){
                            await App.init();
                            await App.localStorage!.setString("id", '${FirebaseAuth.instance.currentUser!.uid}');
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  NavBar()),
                            );
                          }
                        }
                      }),
                      SizedBox(height: size.height * 0.03),
                      // forgetPasswordButton('Forget Password?', (){}),
                    ]),
                  ),
                ),
              )),
          // bottomSocialLoginContainer(context),
        ],
      ),
    );
  }

  upperImageContainer() {
    return Expanded(
      flex: 2,
        child: Container(
          margin: EdgeInsets.only(top: 40,bottom: 20),
          child: Image(
            image: AssetImage('assets/logo2.png'),
          ),
        ));
  }

  bottomSocialLoginContainer(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
        child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Or use a social account to login',
            style: style2.copyWith(
                fontSize: 10, color: secondaryColor.withOpacity(0.4)),
          ),
          SizedBox(
            height: size.height*0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              facebookButton(() {}),
              SizedBox(width: 14,),
              googleButton(() {}),
              SizedBox(width: 14,),
              appleButton(() {}),
            ],
          ),
        ],
      ),
    ));
  }

  upperSignInSinUpButton(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(child: Column(
          children: [
            TextButton(onPressed: (){}, child: Text('Sign In',style:style1.copyWith(fontSize: 17)),),
            Container(
              height: 2,
              width: 90,
              color: secondaryColor,
            ),
          ],
        )),
        Container(child: Column(
          children: [
            TextButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUp()),
              );
            }, child: Text('Sign Up',style:style1.copyWith(fontSize: 17,color: secondaryColor.withOpacity(0.5))),),
            Container(
              height: 2,
              width: 90,
              color: tertiaryColor,
            ),
          ],
        )),
      ],
    );
  }

  Future<dynamic> userLogin(var email, var password, BuildContext context) async{
    try {
      await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {

      if (e.code == 'user-not-found') {
        // return 'User not Found';
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('User not found')));
      }
      else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('The password you entered was not correct')));
        return 'Password you entered was not correct';
      }
    }
    catch (e) {
      return e.toString();
    }
  }

  Widget takeInput(
      obscureText,
      hintText, TextEditingController controller, IconData suffixIcon,
      var validator) {
    return Container(
      child: TextFormField(
        validator: validator != null ? validator : null,
        controller: controller,
        cursorColor: tertiaryColor,
        obscureText: isObscure,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
          TextStyle(fontSize: 14, color: secondaryColor.withOpacity(0.5)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: fifthColor,
          contentPadding: EdgeInsets.only(left: 30, top: 18, bottom: 18),
          suffixIcon: InkWell(
            onTap: (){
              setState(() {
                if(isObscure == true){
                  setState(() {
                    isObscure = false;
                  });
                }else{
                  setState(() {
                    isObscure = true;
                  });
                }
              });
            },
            child: Padding(
              padding: EdgeInsets.only(right: 24.0, left: 16.0),
              child: Icon(
                suffixIcon,
                color: secondaryColor.withOpacity(0.7),
                size: 20,
              ),
            ),
          ),
        ),
        style: style2,
      ),
    );
  }
}
