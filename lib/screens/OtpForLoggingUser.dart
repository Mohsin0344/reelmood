import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:realmood/CreateAccounts/ADACeateAccount.dart';
import 'package:realmood/CreateAccounts/BCHCreateAccount.dart';
import 'package:realmood/CreateAccounts/BNBCreateAccount.dart';
import 'package:realmood/CreateAccounts/BSCCreateAccount.dart';
import 'package:realmood/CreateAccounts/BTCCreateAccount.dart';
import 'package:realmood/CreateAccounts/DOGECreateAccount.dart';
import 'package:realmood/CreateAccounts/ETHCreateAccount.dart';
import 'package:realmood/CreateAccounts/LTCCreateAccount.dart';
import 'package:realmood/CreateAccounts/MATICCreateAccount.dart';
import 'package:realmood/CreateAccounts/XLMCreateAccount.dart';
import 'package:realmood/CreateAccounts/XRPCreateAccount.dart';
import 'package:realmood/PrivateModel/ADAPrivate.dart';
import 'package:realmood/PrivateModel/BCHPrivate.dart';
import 'package:realmood/PrivateModel/BSCPrivate.dart';
import 'package:realmood/PrivateModel/BTCPrivate.dart';
import 'package:realmood/PrivateModel/DOGEPrivate.dart';
import 'package:realmood/PrivateModel/ETHPrivate.dart';
import 'package:realmood/PrivateModel/LTCPrivate.dart';
import 'package:realmood/PrivateModel/MATICPrivate.dart';
import 'package:realmood/Strings.dart';
import 'package:realmood/XpubModels/ADAModel.dart';
import 'package:realmood/XpubModels/BCHModel.dart';
import 'package:realmood/XpubModels/BNBModel.dart';
import 'package:realmood/XpubModels/BSCModel.dart';
import 'package:realmood/XpubModels/BTCModel.dart';
import 'package:realmood/XpubModels/DogeModel.dart';
import 'package:realmood/XpubModels/ETHModel.dart';
import 'package:realmood/XpubModels/LTCModel.dart';
import 'package:realmood/XpubModels/MaticModel.dart';
import 'package:realmood/XpubModels/XLMModel.dart';
import 'package:realmood/XpubModels/XRPModel.dart';
import 'package:realmood/screens/navigationbar.dart';
import 'package:realmood/screens/splash.dart';
import 'package:realmood/utils/constant.dart';
import 'package:realmood/widgets/pressedwidget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bip39/bip39.dart' as bip39;

class OtpForLogginUserScreen extends StatefulWidget {
  var userId;
  OtpForLogginUserScreen({Key? key, this.userId
  }) : super(key: key);

  @override
  _OtpForLogginUserScreenState createState() => _OtpForLogginUserScreenState();
}

class _OtpForLogginUserScreenState extends State<OtpForLogginUserScreen> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  var auth = FirebaseAuth.instance;
  var _verificationCode;
  var userId;
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: secondaryColor.withOpacity(0.5)),
      borderRadius: BorderRadius.circular(15.0),
    );
  }
  bool isLoading = false;

  bool dataLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    phoneSignIn();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: primaryColor,
        body: isLoading == false ? ListView(
          children: [
            SizedBox(
              height: Get.height * 0.10,
            ),
            Image.asset('assets/logo2.png',
              height: Get.height * 0.15,
            ),

            SizedBox(
              height: Get.height * 0.18,
            ),
            Center(
              child: Container(
                height: Get.height * 0.10,
                margin: const EdgeInsets.all(20.0),
                padding: const EdgeInsets.all(20.0),
                child: PinPut(
                  fieldsCount: 6,
                  onSubmit: (String pin) async{
                    // setState(() {
                    //   isLoading = true;
                    // });
                    // var userData = await auth.signInWithCredential(
                    //     PhoneAuthProvider.credential(
                    //         verificationId: _verificationCode,
                    //         smsCode: _pinPutController.text)
                    // );
                    // if(userData!= null){
                    //   Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(builder: (context) =>
                    //         NavBar()),
                    //   );
                    // }
                  },
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  selectedFieldDecoration: _pinPutDecoration,
                  followingFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: secondaryColor.withOpacity(.5),
                    ),
                  ),
                  textStyle: TextStyle(
                      color: secondaryColor.withOpacity(0.5)
                  ),
                ),
              ),
            )
          ],
        ) : Center(
          child: CircularProgressIndicator(),
        ),
        bottomNavigationBar: Visibility(
          visible: isLoading == false?true:false,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10
            ),
            child: customButton('Verify OTP', () async{
              setState(() {
                isLoading = true;
              });
              var userData = await auth.signInWithCredential(
                  PhoneAuthProvider.credential(
                      verificationId: _verificationCode,
                      smsCode: _pinPutController.text)
              );
              if(userData!= null){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      NavBar()),
                );
              }
            }),
          ),
        )
    );
  }

  Future<void> phoneSignIn() async {
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users")
        .doc(firebaseUser!.uid).get();
    var phoneNumber = userDetails.data()?['phoneNumber'];
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async{
        auth.signInWithCredential(credential).then((value) async{
          if(value.user != null){
            print('xxxxxxxxxxxxxxxxxxx ${credential.smsCode}');
          }
        });
      },
      verificationFailed: _onVerificationFailed,
      codeSent: _onCodeSent,
      codeAutoRetrievalTimeout: _onCodeTimeout,
      timeout: Duration(seconds: 120),

    );
  }


  _onVerificationFailed(FirebaseAuthException exception) {
    if (exception.code == 'invalid-phone-number') {
      showMessage("The phone number entered is invalid!");
    }
  }

  _onCodeSent(String verificationId, int? forceResendingToken) async{
    // this.verificationId = verificationId;
    print(forceResendingToken);
    print("code sent");
    setState(() {
      _verificationCode = verificationId;
    });
  }

  _onCodeTimeout(String verificationId) {
    setState(() {
      _verificationCode = verificationId;
    });
    return null;
  }

  showMessage(var message){
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}