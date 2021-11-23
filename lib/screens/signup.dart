import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:realmood/Constants/Screens.dart';
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
import 'package:realmood/screens/phoneNumberScreen.dart';
import 'package:realmood/utils/constant.dart';
import 'package:realmood/widgets/inputWidget.dart';
import 'package:realmood/widgets/pressedwidget.dart';
import 'package:realmood/widgets/socialloginButtons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bip39/bip39.dart' as bip39;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  ///****************  XPUBS **************////
  late BtcXpub _btcXpub;
  late ETHXpub _ethXpub;
  late LTCXpub _ltcXpub;
  late BCHXpub _bchXpub;
  late ADAXpub _adaXpub;
  late BNBXpub _bnbXpub;
  late BSCXpub _bscXpub;
  late BSCXpub _bscXpub2;
  late DogeXpub _dogeXpub;
  late MATICXpub _maticXpub;
  late XRPXpub _xrpXpub;
  late XLMXpub _xlmXpub;

  ///****************  Private **************////
  late BTCPrivate _btcPrivate;
  late ETHPrivate _ethPrivate;
  late LTCPrivate _ltcPrivate;
  late BCHPrivate _bchPrivate;
  late ADAPrivate _adaPrivate;
  late BSCPrivate _bscPrivate;
  late BSCPrivate _bscPrivate2;
  late DOGEPrivate _dogePrivate;
  late MATICPrivate _maticPrivate;

  ///************ Create Account **********//
  late BTCCreateAccount _btcCreateAccount;
  late ADACreateAccount _adaCreateAccount;
  late BCHCreateAccount _bchCreateAccount;
  late BNBCreateAccount _bnbCreateAccount;
  late BSCCreateAccount _bscCreateAccount;
  late BSCCreateAccount _bscCreateAccount2;
  late DOGECreateAccount _dogeCreateAccount;
  late ETHCreateAccount _ethCreateAccount;
  late LTCCreateAccount _ltcCreateAccount;
  late MATICCreateAccount _maticCreateAccount;
  late XLMCreateAccount _xlmCreateAccount;
  late XRPCreateAccount _xrpCreateAccount;

  bool isLoading = false;

  bool isObscure = true;

  var userId;

  String? _chosenValue;

  String? US;

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          appBar: getAppBar(),
          body: isLoading == false? getBody(context) :
          Center(
            child: CircularProgressIndicator(),
          ),
          // resizeToAvoidBottomInset: false,
        ),
      ),
    );
  }

  getAppBar() {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: secondaryColor,
          )),
      elevation: 0.0,
      backgroundColor: primaryColor,
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
              flex: 8,
              child: Container(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Form(
                    key: _formKey,
                    child: Column(children: [
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(height: size.height * 0.02,),
                      input('Full Name', nameController,
                          (name){
                        if(name.toString().isEmpty){
                          return 'Enter username';
                        } else return null;
                          }),
                      SizedBox(height: size.height * 0.01),
                      input('Email Address', emailController,
                          (email){
                            if(EmailValidator.validate(email) == true){
                              return null;
                            } else return 'Enter correct email';
                          }
                      ),
                      SizedBox(height: size.height * 0.01),
                      takeInput(
                          true, 'Password',
                          passwordController,
                          isObscure == true ? LineIcons.eyeSlash : Icons.visibility,
                          (password){
                            if(password.toString().length < 6){
                              return "Enter strong password";
                            }else return null;
                          }
                      ),
                      SizedBox(height: size.height * 0.01),
                      takeInput(true, 'Confirm Password',
                          confirmPasswordController,
                          isObscure == true ? LineIcons.eyeSlash : Icons.visibility,
                          (confirmPassword){
                              if(confirmPassword.toString() !=
                                  passwordController.text){
                                return 'Confirm password and password should be same';
                              }else return null;
                          }
                      ),
                      SizedBox(height: size.height * 0.05),
                    ]),
                  ),
                ),
              )),
          customButton('Create Account', () async{
            print('tapped');
            if(_formKey.currentState!.validate()){
              _formKey.currentState!.save();
              // setState(() {
              //   isLoading = true;
              // });
              // await userSignUp(emailController.text, passwordController.text,
              //      nameController.text);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PhoneNumberScreen(
                    email: emailController.text,
                    password: passwordController.text,
                    fullName: nameController.text)),
              );
            }
            // else if(US == null
            //     && _chosenValue == null){
            //   ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(content: Text('Please select currency, country and'
            //           ' picture')));
            // }
          }),
          // bottomSocialLoginContainer(context),
        ],
      ),
    );
  }

  upperImageContainer() {
    return Expanded(
      flex: 2,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        alignment: Alignment.topCenter,
        child: Image(
          image: AssetImage('assets/logo2.png'),
        ),
      ),
    );
  }




  userSignUp(var email, var password,
      var fullName) async{
    try {
      print('im here');
      var user =  await auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      if(user != null){
        setState(() {
          userId = auth.currentUser!.uid;
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('weak password')));
      }
      else if (e.code == 'email-already-in-use') {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Email already in use')));
      }
    }
    catch (e) {
      print(e.toString());
    }

    if(userId != null){
      ///************* XPUB GENERATOR ********///
      await getBTCXPUB();
      await getETHXPUB();
      await getLTCXPUB();
      await getBCHXPUB();
      await getADAXPUB();
      await getBSCXPUB2();
      await getBSCXPUB();
      await getDOGEXPUB();
      await getMATICXPUB();
      await getXRPXPUB();
      await getXLMXPUB();

      ///********** PRIVATE GENERATOR ********/////
      await getBTCPrivate();
      await getETHPrivate();
      await getLTCPrivate();
      await getBCHPrivate();
      await getADAPrivate();
      await getBSCPrivate();
      await getBSCPrivate2();
      await getDOGEPrivate();
      await getMATICPrivate();

      ///*********** Create Account *********///
      await BTCCreateAccounts();
      await ADACreateAccounts();
      await BCHCreateAccounts();
      await BSCCreateAccounts2();
      await BSCCreateAccounts();
      await DOGECreateAccounts();
      await ETHCreateAccounts();
      await LTCCreateAccounts();
      await MATICCreateAccounts();
      await XLMCreateAccounts();
      await XRPCreateAccounts();
      try{
        print('firestore');
        var userId = auth.currentUser!.uid;
        await FirebaseFirestore.instance
            .collection("Users")
            .doc('$userId')
            .set({
          'Name': fullName,
          'imageUrl': 'null',
          'currency': 'USD',
          'country': 'US',
          'accountNumber': '${_btcCreateAccount.accountCode}',
          'btcXpub': '${_btcXpub.xpub}',
          'btcMnemonic': '${_btcXpub.mnemonic}',
          'btcPrivateKey': '${_btcPrivate.key}',
          'btcAccountId': '${_btcCreateAccount.id}',
          'ethXpub': '${_ethXpub.xpub}',
          'ethMnemonic': '${_ethXpub.mnemonic}',
          'ethPrivateKey': '${_ethPrivate.key}',
          'ethAccountId': '${_ethCreateAccount.id}',
          'ltcXpub': '${_ltcXpub.xpub}',
          'ltcMnemonic': '${_ltcXpub.mnemonic}',
          'ltcPrivateKey': '${_ltcPrivate.key}',
          'ltcAccountId': '${_ltcCreateAccount.id}',
          'bchXpub': '${_bchXpub.xpub}',
          'bchMnemonic': '${_bchXpub.mnemonic}',
          'bchPrivateKey': '${_bchPrivate.key}',
          'bchAccountId': '${_bchCreateAccount.id}',
          'adaXpub': '${_adaXpub.xpub}',
          'adaMnemonic': '${_adaXpub.mnemonic}',
          'adaPrivateKey': '${_adaPrivate.key}',
          'adaAccountId': '${_adaCreateAccount.id}',
          'bscXpub': '${_bscXpub.xpub}',
          'bscMnemonic': '${_bscXpub.mnemonic}',
          'bscPrivateKey': '${_bscPrivate.key}',
          'bscAccountId': '${_bscCreateAccount.id}',
          'dogeXpub': '${_dogeXpub.xpub}',
          'dogeMnemonic': '${_dogeXpub.mnemonic}',
          'dogePrivateKey': '${_dogePrivate.key}',
          'dogeAccountId': '${_dogeCreateAccount.id}',
          'maticXpub': '${_maticXpub.xpub}',
          'maticMnemonic': '${_maticXpub.mnemonic}',
          'maticPrivateKey': '${_maticPrivate.key}',
          'maticAccountId': '${_maticCreateAccount.id}',
          'bnbXpub': '${_bscXpub2.xpub}',
          'bnbMnemonic': '${_bscXpub2.mnemonic}',
          'bnbPrivateKey': '${_bscCreateAccount2.id}',
          'bnbAccountId': '${_bscCreateAccount2.id}',
          'xrpAddress': '${_xrpXpub.address}',
          'xrpPrivateKeySecret': '${_xrpXpub.secret}',
          'xrpAccountId': '${_xrpCreateAccount.id}',
          'xlmAddress': '${_xlmXpub.address}',
          'xlmPrivateKey': '${_xlmXpub.secret}',
          'xlmAccountId': '${_xlmCreateAccount.id}',
        }).then((_){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Data sent')));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NavBar()),
          );
        });
      }
      catch(e){
        print(e.toString());
      }
    }
  }

  ///******************** BTC *********************//
  Future<dynamic> getBTCXPUB() async{
    var mnemonic = bip39.generateMnemonic();
    var url = Uri.parse('https://api-eu1.tatum.io/v3/bitcoin/wallet?mnemonic=$mnemonic');
    var response = await http.get(url,headers: {
      'x-api-key': Strings.xApiKey
    });
    if(response.statusCode == 200){
      var responseString = response.body;
      setState(() {
        _btcXpub = BtcXpub.fromRawJson(responseString);
      });
      var mnemonic = _btcXpub.mnemonic;
      print('BTC mnemonic is ----->$mnemonic');
      print('BTC XPUB is----->${_btcXpub.xpub}');
      return BtcXpub.fromRawJson(responseString);
    }
    else{
      return "Error";
    }
  }

  ///******************** ETC *********************//
  Future<dynamic> getETHXPUB() async{
    var mnemonic = bip39.generateMnemonic();
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ethereum/wallet?mnemonic=$mnemonic');
    var response = await http.get(url,headers: {
      'x-api-key': Strings.xApiKey,
      'x-testnet-type': 'ETHHHHHHH'
    });
    if(response.statusCode == 200){
      var responseString = response.body;
      setState(() {
        _ethXpub = ETHXpub.fromRawJson(responseString);
      });
      var mnemonic = _ethXpub.mnemonic;
      print('ETH mnemonic is ----->$mnemonic');
      print('ETH XPUB is----->${_ethXpub.xpub}');
      return ETHXpub.fromRawJson(responseString);
    }
    else{
      return "Error";
    }
  }

  ///******************** LTC *********************//
  Future<dynamic> getLTCXPUB() async{
    var mnemonic = bip39.generateMnemonic();
    var url = Uri.parse('https://api-eu1.tatum.io/v3/litecoin/wallet?mnemonic=$mnemonic');
    var response = await http.get(url,headers: {
      'x-api-key': Strings.xApiKey,
    });
    if(response.statusCode == 200){
      var responseString = response.body;
      setState(() {
        _ltcXpub = LTCXpub.fromRawJson(responseString);
      });
      var mnemonic = _ltcXpub.mnemonic;
      print('LTC mnemonic is ----->$mnemonic');
      print('LTC XPUB is----->${_ltcXpub.xpub}');
      return LTCXpub.fromRawJson(responseString);
    }
    else{
      return "Error";
    }
  }

  ///******************** BCH *********************//
  Future<dynamic> getBCHXPUB() async{
    var mnemonic = bip39.generateMnemonic();
    var url = Uri.parse('https://api-eu1.tatum.io/v3/bcash/wallet?mnemonic=$mnemonic');
    var response = await http.get(url,headers: {
      'x-api-key': Strings.xApiKey,
    });
    if(response.statusCode == 200){
      var responseString = response.body;
      setState(() {
        _bchXpub = BCHXpub.fromRawJson(responseString);
      });
      var mnemonic = _bchXpub.mnemonic;
      print('BCH mnemonic is ----->$mnemonic');
      print('BCH XPUB is----->${_bchXpub.xpub}');
      return BCHXpub.fromRawJson(responseString);
    }
    else{
      return "Error";
    }
  }

  ///******************** ADA *********************//
  Future<dynamic> getADAXPUB() async{
    var mnemonic = bip39.generateMnemonic();
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ada/wallet?mnemonic=$mnemonic');
    var response = await http.get(url,headers: {
      'x-api-key': Strings.xApiKey,
    });
    if(response.statusCode == 200){
      var responseString = response.body;
      setState(() {
        _adaXpub = ADAXpub.fromRawJson(responseString);
      });
      var mnemonic = _adaXpub.mnemonic;
      print('ADA mnemonic is ----->$mnemonic');
      print('ADA XPUB is----->${_adaXpub.xpub}');
      return ADAXpub.fromRawJson(responseString);
    }
    else{
      return "Error";
    }
  }

  ///******************** BNB *********************//
  // Future<dynamic> getBNBXPUB() async{
  //   var mnemonic = bip39.generateMnemonic();
  //   var url = Uri.parse('https://api-eu1.tatum.io/v3/bnb/account');
  //   var response = await http.get(url,headers: {
  //     'x-api-key': Strings.xApiKey,
  //   });
  //   if(response.statusCode == 200){
  //     var responseString = response.body;
  //     setState(() {
  //       _bnbXpub = BNBXpub.fromRawJson(responseString);
  //     });
  //     var address = _bnbXpub.address;
  //     print('BNB address is ----->$address');
  //     print('BNB privateKey is----->${_bnbXpub.privateKey}');
  //     return BNBXpub.fromRawJson(responseString);
  //   }
  //   else{
  //     return "Error";
  //   }
  // }

  ///******************** BSC *********************//
  Future<dynamic> getBSCXPUB() async{
    var mnemonic = bip39.generateMnemonic();
    var url = Uri.parse('https://api-eu1.tatum.io/v3/bsc/wallet?mnemonic=$mnemonic');
    var response = await http.get(url,headers: {
      'x-api-key': Strings.xApiKey,
    });
    if(response.statusCode == 200){
      var responseString = response.body;
      setState(() {
        _bscXpub = BSCXpub.fromRawJson(responseString);
      });
      var mnemonic = _bscXpub.mnemonic;
      print('BSC mnemonic is ----->$mnemonic');
      print('BSC XPUB is----->${_bscXpub.xpub}');
      return BSCXpub.fromRawJson(responseString);
    }
    else{
      return "Error";
    }
  }

  ///******************** BSC *********************//
  Future<dynamic> getBSCXPUB2() async{
    var mnemonic = bip39.generateMnemonic();
    var url = Uri.parse('https://api-eu1.tatum.io/v3/bsc/wallet?mnemonic=$mnemonic');
    var response = await http.get(url,headers: {
      'x-api-key': Strings.xApiKey,
    });
    if(response.statusCode == 200){
      var responseString = response.body;
      setState(() {
        _bscXpub2 = BSCXpub.fromRawJson(responseString);
      });
      var mnemonic = _bscXpub2.mnemonic;
      print('BSC2 mnemonic is ----->$mnemonic');
      print('BSC2 XPUB is----->${_bscXpub2.xpub}');
      return BSCXpub.fromRawJson(responseString);
    }
    else{
      return "Error";
    }
  }
  ///******************** DOGE *********************//
  Future<dynamic> getDOGEXPUB() async{
    var mnemonic = bip39.generateMnemonic();
    var url = Uri.parse('https://api-eu1.tatum.io/v3/dogecoin/wallet?mnemonic=$mnemonic');
    var response = await http.get(url,headers: {
      'x-api-key': Strings.xApiKey,
    });
    if(response.statusCode == 200){
      var responseString = response.body;
      setState(() {
        _dogeXpub = DogeXpub.fromRawJson(responseString);
      });
      var mnemonic = _dogeXpub.mnemonic;
      print('DOGE mnemonic is ----->$mnemonic');
      print('DOGE XPUB is----->${_dogeXpub.xpub}');
      return DogeXpub.fromRawJson(responseString);
    }
    else{
      return "Error";
    }
  }

  ///******************** MATIC *********************//
  Future<dynamic> getMATICXPUB() async{
    var mnemonic = bip39.generateMnemonic();
    var url = Uri.parse('https://api-eu1.tatum.io/v3/polygon/wallet?mnemonic=$mnemonic');
    var response = await http.get(url,headers: {
      'x-api-key': Strings.xApiKey,
    });
    if(response.statusCode == 200){
      var responseString = response.body;
      setState(() {
        _maticXpub = MATICXpub.fromRawJson(responseString);
      });
      var mnemonic = _maticXpub.mnemonic;
      print('MATIC mnemonic is ----->$mnemonic');
      print('MATIC XPUB is----->${_maticXpub.xpub}');
      return MATICXpub.fromRawJson(responseString);
    }
    else{
      return "Error";
    }
  }

  ///******************** XRP *********************//
  Future<dynamic> getXRPXPUB() async{
    var mnemonic = bip39.generateMnemonic();
    var url = Uri.parse('https://api-eu1.tatum.io/v3/xrp/account');
    var response = await http.get(url,headers: {
      'x-api-key': Strings.xApiKey,
    });
    if(response.statusCode == 200){
      var responseString = response.body;
      setState(() {
        _xrpXpub = XRPXpub.fromRawJson(responseString);
      });
      var secret = _xrpXpub.secret;
      print('XRP secret is ----->$secret');
      print('XRP address is----->${_xrpXpub.address}');
      return XRPXpub.fromRawJson(responseString);
    }
    else{
      return "Error";
    }
  }

  ///******************** XLM *********************//
  Future<dynamic> getXLMXPUB() async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/xlm/account');
    var response = await http.get(url,headers: {
      'x-api-key': Strings.xApiKey,
    });
    if(response.statusCode == 200){
      var responseString = response.body;
      setState(() {
        _xlmXpub = XLMXpub.fromRawJson(responseString);
      });
      var secret = _xlmXpub.secret;
      print('XLM secret is ----->$secret');
      print('XLM address is----->${_xlmXpub.address}');
      return XLMXpub.fromRawJson(responseString);
    }
    else{
      return "Error";
    }
  }

  ///***************** BTCPrivate ****************//
  Future<dynamic> getBTCPrivate() async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/bitcoin/wallet/priv');
    var bodyData = jsonEncode(
        {
          "index" : 0,
          "mnemonic" : _btcXpub.mnemonic
        }
    );
    var response = await http.post(url,headers: {
      'x-api-key': Strings.xApiKey,
      'content-type': Strings.contentType
    },
        body: bodyData
    );
    if(response.statusCode == 200){
      var responseString = response.body;
      setState(() {
        _btcPrivate = BTCPrivate.fromRawJson(responseString);
      });
      print('BTC privateKey is----->${_btcPrivate.key}');
      return BTCPrivate.fromRawJson(responseString);
    }
    else{
      return "Error";
    }
  }

  ///***************** ETHPrivate ****************//
  Future<dynamic> getETHPrivate() async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ethereum/wallet/priv');
    var bodyData = jsonEncode(
        {
          "index" : 0,
          "mnemonic" : _ethXpub.mnemonic
        }
    );
    var response = await http.post(url,headers: {
      'x-api-key': Strings.xApiKey,
      'content-type': Strings.contentType
    },
        body: bodyData
    );
    if(response.statusCode == 200){
      var responseString = response.body;
      setState(() {
        _ethPrivate = ETHPrivate.fromRawJson(responseString);
      });
      print('ETH privateKey is----->${_ethPrivate.key}');
      return ETHPrivate.fromRawJson(responseString);
    }
    else{
      return "Error";
    }
  }

  ///***************** ETHPrivate ****************//
  Future<dynamic> getLTCPrivate() async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/litecoin/wallet/priv');
    var bodyData = jsonEncode(
        {
          "index" : 0,
          "mnemonic" : _ltcXpub.mnemonic
        }
    );
    var response = await http.post(url,headers: {
      'x-api-key': Strings.xApiKey,
      'content-type': Strings.contentType
    },
        body: bodyData
    );
    if(response.statusCode == 200){
      var responseString = response.body;
      setState(() {
        _ltcPrivate = LTCPrivate.fromRawJson(responseString);
      });
      print('LTC privateKey is----->${_ltcPrivate.key}');
      return LTCPrivate.fromRawJson(responseString);
    }
    else{
      return "Error";
    }
  }

  ///***************** BCHPrivate ****************//
  Future<dynamic> getBCHPrivate() async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/bcash/wallet/priv');
    var bodyData = jsonEncode(
        {
          "index" : 0,
          "mnemonic" : _bchXpub.mnemonic
        }
    );
    var response = await http.post(url,headers: {
      'x-api-key': Strings.xApiKey,
      'content-type': Strings.contentType
    },
        body: bodyData
    );
    if(response.statusCode == 200){
      var responseString = response.body;
      setState(() {
        _bchPrivate = BCHPrivate.fromRawJson(responseString);
      });
      print('BCH privateKey is----->${_bchPrivate.key}');
      return  BCHPrivate.fromRawJson(responseString);
    }
    else{
      return "Error";
    }
  }

  ///***************** ADAPrivate ****************//
  Future<dynamic> getADAPrivate() async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ada/wallet/priv');
    var bodyData = jsonEncode(
        {
          "index" : 0,
          "mnemonic" : _adaXpub.mnemonic
        }
    );
    var response = await http.post(url,headers: {
      'x-api-key': Strings.xApiKey,
      'content-type': Strings.contentType
    },
        body: bodyData
    );
    if(response.statusCode == 201){
      var responseString = response.body;
      setState(() {
        _adaPrivate = ADAPrivate.fromRawJson(responseString);
      });
      print('ADA privateKey is----->${_adaPrivate.key}');
      return  ADAPrivate.fromRawJson(responseString);
    }
    else{
      return "Error";
    }
  }

  ///***************** BSCPrivate ****************//
  Future<dynamic> getBSCPrivate() async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/bsc/wallet/priv');
    var bodyData = jsonEncode(
        {
          "index" : 0,
          "mnemonic" : _bscXpub.mnemonic
        }
    );
    var response = await http.post(url,headers: {
      'x-api-key': Strings.xApiKey,
      'content-type': Strings.contentType
    },
        body: bodyData
    );
    if(response.statusCode == 200){
      var responseString = response.body;
      setState(() {
        _bscPrivate = BSCPrivate.fromRawJson(responseString);
      });
      print('BSC privateKey is----->${_bscPrivate.key}');
      return  BSCPrivate.fromRawJson(responseString);
    }
    else{
      return "Error";
    }
  }
  ///***************** BSC2Private ****************//
  Future<dynamic> getBSCPrivate2() async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/bsc/wallet/priv');
    var bodyData = jsonEncode(
        {
          "index" : 0,
          "mnemonic" : _bscXpub2.mnemonic
        }
    );
    var response = await http.post(url,headers: {
      'x-api-key': Strings.xApiKey,
      'content-type': Strings.contentType
    },
        body: bodyData
    );
    if(response.statusCode == 200){
      var responseString = response.body;
      setState(() {
        _bscPrivate2 = BSCPrivate.fromRawJson(responseString);
      });
      print('BSC2 privateKey is----->${_bscPrivate2.key}');
      return  BSCPrivate.fromRawJson(responseString);
    }
    else{
      return "Error";
    }
  }

  ///***************** DOGEPrivate ****************//
  Future<dynamic> getDOGEPrivate() async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/dogecoin/wallet/priv');
    var bodyData = jsonEncode(
        {
          "index" : 0,
          "mnemonic" : _dogeXpub.mnemonic
        }
    );
    var response = await http.post(url,headers: {
      'x-api-key': Strings.xApiKey,
      'content-type': Strings.contentType
    },
        body: bodyData
    );
    if(response.statusCode == 200){
      var responseString = response.body;
      setState(() {
        _dogePrivate = DOGEPrivate.fromRawJson(responseString);
      });
      print('DOGE privateKey is----->${_dogePrivate.key}');
      return  DOGEPrivate.fromRawJson(responseString);
    }
    else{
      return "Error";
    }
  }

  ///***************** MATIC Private ****************//
  Future<dynamic> getMATICPrivate() async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/polygon/wallet/priv');
    var bodyData = jsonEncode(
        {
          "index" : 0,
          "mnemonic" : _maticXpub.mnemonic
        }
    );
    var response = await http.post(url,headers: {
      'x-api-key': Strings.xApiKey,
      'content-type': Strings.contentType
    },
        body: bodyData
    );
    if(response.statusCode == 200){
      var responseString = response.body;
      setState(() {
        _maticPrivate = MATICPrivate.fromRawJson(responseString);
      });
      print('MATIC privateKey is----->${_maticPrivate.key}');
      return  MATICPrivate.fromRawJson(responseString);
    }
    else{
      return "Error";
    }
  }

  ///************** BTC CREATE ACCOUNT ************//
  Future<dynamic> BTCCreateAccounts() async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account');
    var bodyData = jsonEncode(
        {
          "currency": "BTC",
          "xpub": _btcXpub.xpub,
          "customer":{
            "accountingCurrency":"USD",
            "customerCountry":"US",
            "externalId": "${auth.currentUser!.uid}",
            "providerCountry": "US"
          },"compliant":false,
          "accountCode":"AC_${auth.currentUser!.uid}111_B",
          "accountingCurrency": "USD",
          "accountNumber":"${auth.currentUser!.uid}333"
        });
    var response = await http.post(url, headers: {
      'x-api-key': Strings.xApiKey,
      'content-type': Strings.contentType
    }, body: bodyData);

    if(response.statusCode == 200){
      print('im success');
      setState(() {
        _btcCreateAccount = BTCCreateAccount.fromRawJson(response.body);
      });
      print(_btcCreateAccount.currency);
    }else{
      print('Error hitting${response.statusCode}');
    }
  }

  ///************** ADA CREATE ACCOUNT ************//
  Future<dynamic> ADACreateAccounts() async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account');
    var bodyData = jsonEncode(
        {
          "currency": "ADA",
          "xpub": _adaXpub.xpub,
          "customer":{
            "accountingCurrency":"USD",
            "customerCountry":"US",
            "externalId": "${auth.currentUser!.uid}",
            "providerCountry":"US"
          },"compliant":false,
          "accountCode":"AC_${auth.currentUser!.uid}111_B",
          "accountingCurrency":"USD",
          "accountNumber":"${auth.currentUser!.uid}333"
        });
    var response = await http.post(url, headers: {
      'x-api-key': Strings.xApiKey,
      'content-type': Strings.contentType
    }, body: bodyData);

    if(response.statusCode == 200){
      print('im success');
      setState(() {
        _adaCreateAccount = ADACreateAccount.fromRawJson(response.body);
      });
      print(_adaCreateAccount.currency);
    }else{
      print(response.statusCode);
    }
  }

  ///************** BCH CREATE ACCOUNT ************//
  Future<dynamic> BCHCreateAccounts() async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account');
    var bodyData = jsonEncode(
        {
          "currency": "BCH",
          "xpub": _bchXpub.xpub,
          "customer":{
            "accountingCurrency":"USD",
            "customerCountry":"US",
            "externalId": "${auth.currentUser!.uid}",
            "providerCountry":"US"
          },"compliant":false,
          "accountCode":"AC_${auth.currentUser!.uid}111_B",
          "accountingCurrency":"USD",
          "accountNumber":"${auth.currentUser!.uid}333"
        });
    var response = await http.post(url, headers: {
      'x-api-key': Strings.xApiKey,
      'content-type': Strings.contentType
    }, body: bodyData);

    if(response.statusCode == 200){
      print('im success');
      setState(() {
        _bchCreateAccount = BCHCreateAccount.fromRawJson(response.body);
      });
      print(_bchCreateAccount.currency);
    }else{
      print(response.statusCode);
    }
  }

  ///************** BNB CREATE ACCOUNT ************//
  // Future<dynamic> BNBCreateAccounts() async{
  //   var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account');
  //   var bodyData = jsonEncode(
  //       {
  //         "currency": "BNB",
  //         "customer":{
  //           "accountingCurrency":"USD",
  //           "customerCountry":"$US",
  //           "externalId": "${auth.currentUser!.uid}",
  //           "providerCountry":"$US"
  //         },"compliant":false,
  //         "accountCode":"AC_${auth.currentUser!.uid}111_B",
  //         "accountingCurrency":"USD",
  //         "accountNumber":"${auth.currentUser!.uid}333"
  //       });
  //   var response = await http.post(url, headers: {
  //     'x-api-key': Strings.xApiKey,
  //     'content-type': Strings.contentType
  //   }, body: bodyData);
  //
  //   if(response.statusCode == 200){
  //     print('im success');
  //     setState(() {
  //       _bnbCreateAccount = BNBCreateAccount.fromRawJson(response.body);
  //     });
  //     print(_bnbCreateAccount.currency);
  //   }else{
  //     print(response.statusCode);
  //   }
  // }

  ///************** BSC CREATE ACCOUNT ************//
  Future<dynamic> BSCCreateAccounts() async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account');
    var bodyData = jsonEncode(
        {
          "currency": "BSC",
          "xpub": _bscXpub.xpub,
          "customer":{
            "accountingCurrency":"USD",
            "customerCountry":"US",
            "externalId": "${auth.currentUser!.uid}",
            "providerCountry":"US"
          },"compliant":false,
          "accountCode":"AC_${auth.currentUser!.uid}111_B",
          "accountingCurrency":"USD",
          "accountNumber":"${auth.currentUser!.uid}333"
        });
    var response = await http.post(url, headers: {
      'x-api-key': Strings.xApiKey,
      'content-type': Strings.contentType
    }, body: bodyData);

    if(response.statusCode == 200){
      print('im success');
      setState(() {
        _bscCreateAccount = BSCCreateAccount.fromRawJson(response.body);
      });
      print(_bscCreateAccount.currency);
    }else{
      print(response.statusCode);
    }
  }

  ///************** BSC CREATE ACCOUNT ************//
  Future<dynamic> BSCCreateAccounts2() async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account');
    var bodyData = jsonEncode(
        {
          "currency": "BSC",
          "xpub": _bscXpub2.xpub,
          "customer":{
            "accountingCurrency":"USD",
            "customerCountry":"US",
            "externalId": "${auth.currentUser!.uid}",
            "providerCountry":"US"
          },"compliant":false,
          "accountCode":"AC_${auth.currentUser!.uid}111_B",
          "accountingCurrency":"USD",
          "accountNumber":"${auth.currentUser!.uid}333"
        });
    var response = await http.post(url, headers: {
      'x-api-key': Strings.xApiKey,
      'content-type': Strings.contentType
    }, body: bodyData);

    if(response.statusCode == 200){
      print('im success');
      setState(() {
        _bscCreateAccount2 = BSCCreateAccount.fromRawJson(response.body);
      });
      print(_bscCreateAccount2.currency);
    }else{
      print(response.statusCode);
    }
  }

  ///************** DOGE CREATE ACCOUNT ************//
  Future<dynamic> DOGECreateAccounts() async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account');
    var bodyData = jsonEncode(
        {
          "currency": "DOGE",
          "xpub": _dogeXpub.xpub,
          "customer":{
            "accountingCurrency":"USD",
            "customerCountry":"US",
            "externalId": "${auth.currentUser!.uid}",
            "providerCountry":"US"
          },"compliant":false,
          "accountCode":"AC_${auth.currentUser!.uid}111_B",
          "accountingCurrency":"USD",
          "accountNumber":"${auth.currentUser!.uid}333"
        });
    var response = await http.post(url, headers: {
      'x-api-key': Strings.xApiKey,
      'content-type': Strings.contentType
    }, body: bodyData);

    if(response.statusCode == 200){
      print('im success');
      setState(() {
        _dogeCreateAccount = DOGECreateAccount.fromRawJson(response.body);
      });
      print(_dogeCreateAccount.currency);
    }else{
      print(response.statusCode);
    }
  }

  ///************** ETH CREATE ACCOUNT ************//
  Future<dynamic> ETHCreateAccounts() async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account');
    var bodyData = jsonEncode(
        {
          "currency": "ETH",
          "xpub": _ethXpub.xpub,
          "customer":{
            "accountingCurrency":"USD",
            "customerCountry":"US",
            "externalId": "${auth.currentUser!.uid}",
            "providerCountry":"US"
          },"compliant":false,
          "accountCode":"AC_${auth.currentUser!.uid}111_B",
          "accountingCurrency":"USD",
          "accountNumber":"${auth.currentUser!.uid}333"
        });
    var response = await http.post(url, headers: {
      'x-api-key': Strings.xApiKey,
      'content-type': Strings.contentType
    }, body: bodyData);

    if(response.statusCode == 200){
      print('im success');
      setState(() {
        _ethCreateAccount = ETHCreateAccount.fromRawJson(response.body);
      });
      print(_ethCreateAccount.currency);
    }else{
      print(response.statusCode);
    }
  }

  ///************** LTC CREATE ACCOUNT ************//
  Future<dynamic> LTCCreateAccounts() async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account');
    var bodyData = jsonEncode(
        {
          "currency": "LTC",
          "xpub": _ltcXpub.xpub,
          "customer":{
            "accountingCurrency":"USD",
            "customerCountry":"US",
            "externalId": "${auth.currentUser!.uid}",
            "providerCountry":"US"
          },"compliant":false,
          "accountCode":"AC_${auth.currentUser!.uid}111_B",
          "accountingCurrency":"USD",
          "accountNumber":"${auth.currentUser!.uid}333"
        });
    var response = await http.post(url, headers: {
      'x-api-key': Strings.xApiKey,
      'content-type': Strings.contentType
    }, body: bodyData);

    if(response.statusCode == 200){
      print('im success');
      setState(() {
        _ltcCreateAccount = LTCCreateAccount.fromRawJson(response.body);
      });
      print(_ltcCreateAccount.currency);
    }else{
      print(response.statusCode);
    }
  }

  ///************** MATIC CREATE ACCOUNT ************//
  Future<dynamic> MATICCreateAccounts() async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account');
    var bodyData = jsonEncode(
        {
          "currency": "MATIC",
          "xpub": _maticXpub.xpub,
          "customer":{
            "accountingCurrency":"USD",
            "customerCountry":"US",
            "externalId": "${auth.currentUser!.uid}",
            "providerCountry":"US"
          },"compliant":false,
          "accountCode":"AC_${auth.currentUser!.uid}111_B",
          "accountingCurrency":"USD",
          "accountNumber":"${auth.currentUser!.uid}333"
        });
    var response = await http.post(url, headers: {
      'x-api-key': Strings.xApiKey,
      'content-type': Strings.contentType
    }, body: bodyData);

    if(response.statusCode == 200){
      print('im success');
      setState(() {
        _maticCreateAccount = MATICCreateAccount.fromRawJson(response.body);
      });
      print(_maticCreateAccount.currency);
    }else{
      print(response.statusCode);
    }
  }

  ///************** XLM CREATE ACCOUNT ************//
  Future<dynamic> XLMCreateAccounts() async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account');
    var bodyData = jsonEncode(
        {
          "currency": "XLM",
          "customer":{
            "accountingCurrency":"USD",
            "customerCountry":"US",
            "externalId": "${auth.currentUser!.uid}",
            "providerCountry":"US"
          },"compliant":false,
          "accountCode":"AC_${auth.currentUser!.uid}111_B",
          "accountingCurrency":"USD",
          "accountNumber":"${auth.currentUser!.uid}333"
        });
    var response = await http.post(url, headers: {
      'x-api-key': Strings.xApiKey,
      'content-type': Strings.contentType
    }, body: bodyData);

    if(response.statusCode == 200){
      print('im success');
      setState(() {
        _xlmCreateAccount = XLMCreateAccount.fromRawJson(response.body);
      });
      print(_xlmCreateAccount.currency);
    }else{
      print(response.statusCode);
    }
  }

  ///************** XRM CREATE ACCOUNT ************//
  Future<dynamic> XRPCreateAccounts() async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account');
    var bodyData = jsonEncode(
        {
          "currency": "XRP",
          "customer":{
            "accountingCurrency":"USD",
            "customerCountry":"US",
            "externalId": "${auth.currentUser!.uid}",
            "providerCountry":"US"
          },"compliant":false,
          "accountCode":"AC_${auth.currentUser!.uid}111_B",
          "accountingCurrency":"USD",
          "accountNumber":"${auth.currentUser!.uid}333"
        });
    var response = await http.post(url, headers: {
      'x-api-key': Strings.xApiKey,
      'content-type': Strings.contentType
    }, body: bodyData);

    if(response.statusCode == 200){
      print('im success');
      setState(() {
        _xrpCreateAccount = XRPCreateAccount.fromRawJson(response.body);
      });
      print(_xrpCreateAccount.currency);
    }else{
      print(response.statusCode);
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
