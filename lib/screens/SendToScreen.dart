import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:realmood/Strings.dart';
import 'package:realmood/utils/constant.dart';
import 'package:realmood/widgets/inputWidget.dart';
import 'package:realmood/widgets/pressedwidget.dart';

class SendTo extends StatefulWidget {
  var image;
  var currency;
  var balance;
  SendTo({Key? key, this.image,this.balance, this.currency}) : super(key: key);

  @override
  _SendToState createState() => _SendToState();
}

class _SendToState extends State<SendTo> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController addressController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Send To'
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10
          ),
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Send',
                style: TextStyle(
                    fontSize: 18,
                  color: Colors.white.withOpacity(0.5)
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'From',
                style: TextStyle(
                    fontSize: 16,
                    color:Colors.white.withOpacity(0.5)
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Divider(
                color:  Colors.white.withOpacity(0.5),
                indent: 55,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                  color: fifthColor,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: imageCard(widget.image),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${widget.currency}',
                              style: style2.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child:   Text(
                        '\$${widget.balance}',
                        style: style2.copyWith(
                            color: secondaryColor.withOpacity(0.6), fontSize: 10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'To',
                style: TextStyle(
                    fontSize: 16,
                    color:Colors.white.withOpacity(0.5)
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Divider(
                color:  Colors.white.withOpacity(0.5),
                indent: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            input('Address', addressController, (address){
              if(address.toString().isEmpty){
                return 'Enter address';
              }else return null;
            }),

            SizedBox(
              height: 10,
            ),
            input('Amount', amountController, (amount){
              if(amount.toString().isEmpty){
                return 'Enter amount';
              }else return null;
            }, keyBoardType: "number"),
            Container(
              color: Colors.blue,
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10
        ),
        child: customButton('Send', (){
          if(_formKey.currentState!.validate()){
            _formKey.currentState!.save();
            if(widget.currency == 'RMD'){
              sendRMD(context);
            }
            if(widget.currency == 'BTC'){
              sendBTC(context);
            }
            if(widget.currency == 'ETH'){
              sendETH(context);
            }
            if(widget.currency == 'LTC'){
              sendLTC(context);
            }
            if(widget.currency == 'BCH'){
              sendBCH(context);
            }
            if(widget.currency == 'ADA'){
              sendADA(context);
            }
            if(widget.currency == 'BNB'){
              sendBNB(context);
            }
            if(widget.currency == 'DOGE'){
              sendDOGE(context);
            }
            if(widget.currency == 'MATIC'){
              sendMATIC(context);
            }
            if(widget.currency == 'XRP'){
              sendXRP(context);
            }
            if(widget.currency == 'XLM'){
              sendXLM(context);
            }
          }
        }),
      )
    );
  }

  ///****************** Send RMD ***********************///
  Future<dynamic> sendRMD(BuildContext context) async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/offchain/bsc/transfer');
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var bscAccountId = userDetails.data()?['bscAccountId'];
    var bscPrivateKey = userDetails.data()?['bscPrivateKey'];
    var bodyData = jsonEncode(
        {
          "address": "${addressController.text}",
          "amount": "${amountController.text}",
          "compliant": false,
          "privateKey": "$bscPrivateKey",
          "paymentId": "1234",
          "senderAccountId": "$bscAccountId",
          "senderNote": "Sender note",
        }
    );
    try{
      var response = await http.post(url, headers: {
        'x-api-key': Strings.xApiKey,
        'content-type': Strings.contentType
      }, body: bodyData);

      if(response.statusCode == 200){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Sent Successfully')));
      } else{
        print(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Transaction Failed')));
      }
    }catch(e){

    }
  }

  ///****************** Send BTC ***********************///
  Future<dynamic> sendBTC(BuildContext context) async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/offchain/bitcoin/transfer');
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var accountId = userDetails.data()?['btcAccountId'];
    var btcXpub = userDetails.data()?['btcXpub'];
    var btcMnemonic = userDetails.data()?['btcMnemonic'];
    var bodyData = jsonEncode(
        {
          "senderAccountId": "$accountId",
          "address": "${addressController.text}",
          "amount": "${amountController.text}",
          "compliant": false,
          "attr": "string",
          "mnemonic": "$btcMnemonic",
          "xpub": "$btcXpub",
          "senderNote": "Sender note"
        }
    );
    try{
      var response = await http.post(url, headers: {
        'x-api-key': Strings.xApiKey,
        'content-type': Strings.contentType
      }, body: bodyData);

      if(response.statusCode == 200){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Sent Successfully')));
      } else{
        print(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Transaction Failed')));
      }
    }catch(e){

    }
  }

  ///****************** Send BTC ***********************///
  Future<dynamic> sendETH(BuildContext context) async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/offchain/ethereum/transfer');
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var ethPrivateKey = userDetails.data()?['ethPrivateKey'];
    var ethAccountId = userDetails.data()?['ethAccountId'];
    var bodyData = jsonEncode(
        {
          "nonce": 0,
          "address": "${addressController.text}",
          "amount": "${amountController.text}",
          "compliant": false,
          "privateKey": "$ethPrivateKey",
          "senderAccountId": "$ethAccountId",
          "senderNote": "Sender note",
        }
    );
    try{
      var response = await http.post(url, headers: {
        'x-api-key': Strings.xApiKey,
        'content-type': Strings.contentType
      }, body: bodyData);

      if(response.statusCode == 200){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Sent Successfully')));
      } else{
        print(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Transaction Failed')));
      }
    }catch(e){

    }
  }

  ///****************** Send LTC ***********************///
  Future<dynamic> sendLTC(BuildContext context) async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/offchain/litecoin/transfer');
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var ltcAccountId = userDetails.data()?['ltcAccountId'];
    var ltcXpub = userDetails.data()?['ltcXpub'];
    var ltcMnemonic = userDetails.data()?['ltcMnemonic'];
    var bodyData = jsonEncode(
        {
          "senderAccountId": "$ltcAccountId",
          "address": "${addressController.text}",
          "amount": "${amountController.text}",
          "compliant": false,
          "attr": "string",
          "mnemonic": "$ltcMnemonic",
          "xpub": "$ltcXpub",
          "senderNote": "Sender note"
        }
    );
    try{
      var response = await http.post(url, headers: {
        'x-api-key': Strings.xApiKey,
        'content-type': Strings.contentType
      }, body: bodyData);

      if(response.statusCode == 200){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Sent Successfully')));
      } else{
        print(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Transaction Failed')));
      }
    }catch(e){

    }
  }

  ///****************** Send BCH ***********************///
  Future<dynamic> sendBCH(BuildContext context) async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/offchain/bcash/transfer');
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var bchAccountId = userDetails.data()?['bchAccountId'];
    var bchXpub = userDetails.data()?['bchXpub'];
    var bchMnemonic = userDetails.data()?['bchMnemonic'];
    var bodyData = jsonEncode(
          {
            "senderAccountId": "$bchAccountId",
            "address": "${addressController.text}",
            "amount": "${amountController.text}",
            "compliant": false,
            "attr": "string",
            "mnemonic": "$bchMnemonic",
            "xpub": "$bchXpub",
            "senderNote": "Sender note"
          }
    );
    try{
      var response = await http.post(url, headers: {
        'x-api-key': Strings.xApiKey,
        'content-type': Strings.contentType
      }, body: bodyData);

      if(response.statusCode == 200){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Sent Successfully')));
      } else{
        print(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Transaction Failed')));
      }
    }catch(e){

    }
  }

  ///****************** Send ADA ***********************///
  Future<dynamic> sendADA(BuildContext context) async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/offchain/ada/transfer');
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var adaAccountId = userDetails.data()?['adaAccountId'];
    var adaXpub = userDetails.data()?['adaXpub'];
    var adaMnemonic = userDetails.data()?['adaMnemonic'];
    var bodyData = jsonEncode(
          {
            "senderAccountId": "$adaAccountId",
            "address": "${addressController.text}",
            "amount": "${amountController.text}",
            "compliant": false,
            "attr": "string",
            "mnemonic": "$adaMnemonic",
            "xpub": "$adaXpub",
            "senderNote": "Sender note"
          }
    );
    try{
      var response = await http.post(url, headers: {
        'x-api-key': Strings.xApiKey,
        'content-type': Strings.contentType
      }, body: bodyData);

      if(response.statusCode == 200){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Sent Successfully')));
      } else{
        print(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Transaction Failed')));
      }
    }catch(e){

    }
  }

  ///****************** Send BNB ***********************///
  Future<dynamic> sendBNB(BuildContext context) async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/offchain/bsc/transfer');
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var bnbAccountId = userDetails.data()?['bnbAccountId'];
    var bnbPrivateKey = userDetails.data()?['bnbPrivateKey'];
    var bodyData = jsonEncode(
        {
          "address": "${addressController.text}",
          "amount": "${amountController.text}",
          "compliant": false,
          "privateKey": "$bnbPrivateKey",
          "paymentId": "1234",
          "senderAccountId": "$bnbAccountId",
          "senderNote": "Sender note",
        }
    );
    try{
      var response = await http.post(url, headers: {
        'x-api-key': Strings.xApiKey,
        'content-type': Strings.contentType
      }, body: bodyData);

      if(response.statusCode == 200){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Sent Successfully')));
      } else{
        print(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Transaction Failed')));
      }
    }catch(e){

    }
  }

  ///****************** Send DOGE ***********************///
  Future<dynamic> sendDOGE(BuildContext context) async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/offchain/dogecoin/transfer');
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var dogeAccountId = userDetails.data()?['dogeAccountId'];
    var dogeMnemonic = userDetails.data()?['dogeMnemonic'];
    var dogeXpub = userDetails.data()?['dogeXpub'];
    var bodyData = jsonEncode(
        {
          "senderAccountId": "$dogeAccountId",
          "address": "${addressController.text}",
          "amount": "0.001",
          "compliant": false,
          "attr": "string",
          "mnemonic": "$dogeMnemonic",
          "xpub": "$dogeXpub",
          "senderNote": "Sender note"
        }
    );
    try{
      var response = await http.post(url, headers: {
        'x-api-key': Strings.xApiKey,
        'content-type': Strings.contentType
      }, body: bodyData);

      if(response.statusCode == 200){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Sent Successfully')));
      } else{
        print(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Transaction Failed')));
      }
    }catch(e){

    }
  }

  ///****************** Send DOGE ***********************///
  Future<dynamic> sendMATIC(BuildContext context) async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/offchain/polygon/transfer');
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var maticPrivateKey = userDetails.data()?['maticPrivateKey'];
    var maticAccountId = userDetails.data()?['maticAccountId'];
    var bodyData = jsonEncode(
        {
          "address": "${addressController.text}",
          "amount": "${amountController.text}",
          "compliant": false,
          "privateKey": "$maticPrivateKey",
          "senderAccountId": "$maticAccountId",
          "senderNote": "Sender note",
        }
    );
    try{
      var response = await http.post(url, headers: {
        'x-api-key': Strings.xApiKey,
        'content-type': Strings.contentType
      }, body: bodyData);

      if(response.statusCode == 200){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Sent Successfully')));
      } else{
        print(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Transaction Failed')));
      }
    }catch(e){

    }
  }

  ///****************** Send XRP ***********************///
  Future<dynamic> sendXRP(BuildContext context) async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/offchain/xrp/transfer');
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var xrpAccountId = userDetails.data()?['xrpAccountId'];
    var xrpAddress = userDetails.data()?['xrpAddress'];
    var xrpPrivateKeySecret = userDetails.data()?['xrpPrivateKeySecret'];
    var bodyData = jsonEncode(
        {
          "senderAccountId": "$xrpAccountId",
          "account": "$xrpAddress",
          "address": "${addressController.text}",
          "amount": "${amountController.text}",
          "compliant": false,
          "secret": "$xrpPrivateKeySecret",
          "senderNote": "Sender note"
        }
    );
    try{
      var response = await http.post(url, headers: {
        'x-api-key': Strings.xApiKey,
        'content-type': Strings.contentType
      }, body: bodyData);

      if(response.statusCode == 200){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Sent Successfully')));
      } else{
        print(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Transaction Failed')));
      }
    }catch(e){

    }
  }

  ///****************** Send XLM ***********************///
  Future<dynamic> sendXLM(BuildContext context) async{
    var url = Uri.parse('https://api-eu1.tatum.io/v3/offchain/xlm/transfer');
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var xlmAccountId = userDetails.data()?['xlmAccountId'];
    var xlmAddress = userDetails.data()?['xlmAddress'];
    var xlmPrivateKey = userDetails.data()?['xlmPrivateKey'];
    var bodyData = jsonEncode(
        {
          "senderAccountId": "${xlmAccountId}",
          "fromAccount": "$xlmAddress",
          "address": "${addressController.text}",
          "amount": "${amountController.text}",
          "secret": "$xlmPrivateKey",
          "compliant": false,
          "senderNote": "Sender note"
        }
    );
    try{
      var response = await http.post(url, headers: {
        'x-api-key': Strings.xApiKey,
        'content-type': Strings.contentType
      }, body: bodyData);

      if(response.statusCode == 200){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Sent Successfully')));
      } else{
        print(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Transaction Failed')));
      }
    }catch(e){

    }
  }

  Widget imageCard(String img) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Center(
          child: Image(
            image: AssetImage(img),
            height: 30,
            width: 20,
          )),
    );
  }
}
