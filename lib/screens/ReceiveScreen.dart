import 'dart:convert';
import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:realmood/DepositAddress/DepositAddressModel.dart';
import 'package:realmood/Strings.dart';
import 'package:realmood/utils/constant.dart';
import 'package:http/http.dart' as http;

class ReceiveCoins extends StatefulWidget {
  const ReceiveCoins({Key? key}) : super(key: key);

  @override
  _ReceiveCoinsState createState() => _ReceiveCoinsState();
}

class _ReceiveCoinsState extends State<ReceiveCoins> {
  var userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: ()=> Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text('Receive'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 12.0
        ),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Receive Crypto',
            style: TextStyle(fontSize: 18, color: secondaryColor)
            )
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  'Select a wallet to copy address',
                  style: TextStyle(fontSize: 12, color: secondaryColor.withOpacity(0.5))
              )
          ),
      SizedBox(
        height: 20,
      ),
          FutureBuilder(
            future: getRMDDepositAddress(),
            builder: (BuildContext context, snapshot){
              if(snapshot.hasData){
                return InkWell(
                  onTap: (){
                    FlutterClipboard.copy('${snapshot.data}').then(( value ){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Copied')));
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                        color: fifthColor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: imageCard('assets/Logo1.png'),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'RMD',
                                    style: style2.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '${snapshot.data}',
                                        style: style2.copyWith(
                                            color: secondaryColor,
                                            fontSize: 10),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )
                                  )
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Icon(
                              Icons.copy_outlined,
                              color: secondaryColor.withOpacity(0.8),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else return Center();
            }
          ),
          SizedBox(height: 12,),
          FutureBuilder(
              future: getBTCDepositAddress(),
              builder: (BuildContext context, snapshot){
                if(snapshot.hasData){
                  return InkWell(
                    onTap: (){
                      FlutterClipboard.copy('${snapshot.data}').then(( value ){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Copied')));
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                          color: fifthColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: imageCard('assets/bitcoin.png'),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'BTC',
                                      style: style2.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '${snapshot.data}',
                                          style: style2.copyWith(
                                              color: secondaryColor,
                                              fontSize: 10),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        )
                                    )
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Icon(
                                Icons.copy_outlined,
                                color: secondaryColor.withOpacity(0.8),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else return Center();
              }
          ),
          SizedBox(height: 12,),
          FutureBuilder(
              future: getETHDepositAddress(),
              builder: (BuildContext context, snapshot){
                if(snapshot.hasData){
                  return InkWell(
                    onTap: (){
                      FlutterClipboard.copy('${snapshot.data}').then(( value ){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Copied')));
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                          color: fifthColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: imageCard('assets/ethere.png'),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'ETH',
                                      style: style2.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '${snapshot.data}',
                                          style: style2.copyWith(
                                              color: secondaryColor,
                                              fontSize: 10),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        )
                                    )
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Icon(
                                Icons.copy_outlined,
                                color: secondaryColor.withOpacity(0.8),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else return Center();
              }
          ),
          SizedBox(height: 12,),
          FutureBuilder(
              future: getLTCDepositAddress(),
              builder: (BuildContext context, snapshot){
                if(snapshot.hasData){
                  return InkWell(
                    onTap: (){
                      FlutterClipboard.copy('${snapshot.data}').then(( value ){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Copied')));
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                          color: fifthColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: imageCard('assets/lite.png'),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'LTC',
                                      style: style2.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '${snapshot.data}',
                                          style: style2.copyWith(
                                              color: secondaryColor,
                                              fontSize: 10),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        )
                                    )
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Icon(
                                Icons.copy_outlined,
                                color: secondaryColor.withOpacity(0.8),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else return Center();
              }
          ),
          SizedBox(height: 12,),
          FutureBuilder(
              future: getBCHDepositAddress(),
              builder: (BuildContext context, snapshot){
                if(snapshot.hasData){
                  return InkWell(
                    onTap: (){
                      FlutterClipboard.copy('${snapshot.data}').then(( value ){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Copied')));
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                          color: fifthColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: imageCard('assets/lite.png'),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'BCH',
                                      style: style2.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '${snapshot.data}',
                                          style: style2.copyWith(
                                              color: secondaryColor,
                                              fontSize: 10),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        )
                                    )
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Icon(
                                Icons.copy_outlined,
                                color: secondaryColor.withOpacity(0.8),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else return Center();
              }
          ),
          SizedBox(height: 12,),
          FutureBuilder(
              future: getADADepositAddress(),
              builder: (BuildContext context, snapshot){
                if(snapshot.hasData){
                  return InkWell(
                    onTap: (){
                      FlutterClipboard.copy('${snapshot.data}').then(( value ){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Copied')));
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                          color: fifthColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: imageCard('assets/lite.png'),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'ADA',
                                      style: style2.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '${snapshot.data}',
                                          style: style2.copyWith(
                                              color: secondaryColor,
                                              fontSize: 10),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        )
                                    )
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Icon(
                                Icons.copy_outlined,
                                color: secondaryColor.withOpacity(0.8),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else return Center();
              }
          ),
          SizedBox(height: 12,),
          FutureBuilder(
              future: getBNBDepositAddress(),
              builder: (BuildContext context, snapshot){
                if(snapshot.hasData){
                  return InkWell(
                    onTap: (){
                      FlutterClipboard.copy('${snapshot.data}').then(( value ){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Copied')));
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                          color: fifthColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: imageCard('assets/lite.png'),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'BNB',
                                      style: style2.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '${snapshot.data}',
                                          style: style2.copyWith(
                                              color: secondaryColor,
                                              fontSize: 10),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        )
                                    )
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Icon(
                                Icons.copy_outlined,
                                color: secondaryColor.withOpacity(0.8),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else return Center();
              }
          ),
          SizedBox(height: 12,),
          FutureBuilder(
              future: getDOGEDepositAddress(),
              builder: (BuildContext context, snapshot){
                if(snapshot.hasData){
                  return InkWell(
                    onTap: (){
                      FlutterClipboard.copy('${snapshot.data}').then(( value ){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Copied')));
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                          color: fifthColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: imageCard('assets/lite.png'),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'DOGE',
                                      style: style2.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '${snapshot.data}',
                                          style: style2.copyWith(
                                              color: secondaryColor,
                                              fontSize: 10),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        )
                                    )
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Icon(
                                Icons.copy_outlined,
                                color: secondaryColor.withOpacity(0.8),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else return Center();
              }
          ),
          SizedBox(height: 12,),
          FutureBuilder(
              future: getMATICDepositAddress(),
              builder: (BuildContext context, snapshot){
                if(snapshot.hasData){
                  return InkWell(
                    onTap: (){
                      FlutterClipboard.copy('${snapshot.data}').then(( value ){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Copied')));
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                          color: fifthColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: imageCard('assets/lite.png'),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'MATIC',
                                      style: style2.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '${snapshot.data}',
                                          style: style2.copyWith(
                                              color: secondaryColor,
                                              fontSize: 10),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        )
                                    )
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Icon(
                                Icons.copy_outlined,
                                color: secondaryColor.withOpacity(0.8),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else return Center();
              }
          ),
        ],
      ),
    );
  }
  ///****************** RMD deposit address *****************///
  Future<dynamic> getRMDDepositAddress() async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var accountId = userDetails.data()?['bscAccountId'];
    var url = Uri.parse('https://api-eu1.tatum.io/v3/offchain/account/address/batch');
    var bodyData = jsonEncode(
        {
          "addresses":
          [
            {
              "accountId": "$accountId"
            }
          ]
        }
    );
    try{
      var response = await http.post(url, headers: {
        'x-api-key' : Strings.xApiKey,
        'content-type': Strings.contentType
      }, body: bodyData);
      if(response.statusCode == 200){
        List responseString = jsonDecode(response.body);
        var list = responseString.map((m) => new GetDepositAddress.fromJson(m)).toList();
        print('RMD deposit Success');
        await FirebaseFirestore.instance.collection('Users')
            .doc('$userId')
            .set({
          'rmdDepositAddress': '${list[0].address}'
        },SetOptions(merge: true)).then((value){
          print('success');
        });
        return list[0].address;
      } else{
        print('ETH ${response.statusCode}');
      }
    } catch(e){
      print(e.toString());
    }
  }

  ///****************** BTC deposit address *****************///
  Future<dynamic> getBTCDepositAddress() async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var accountId = userDetails.data()?['btcAccountId'];
    var url = Uri.parse('https://api-eu1.tatum.io/v3/offchain/account/address/batch');
    var bodyData = jsonEncode(
        {
          "addresses":
          [
            {
              "accountId": "$accountId"
            }
          ]
        }
    );
    try{
      var response = await http.post(url, headers: {
        'x-api-key' : Strings.xApiKey,
        'content-type': Strings.contentType
      }, body: bodyData);
      if(response.statusCode == 200){
        List responseString = jsonDecode(response.body);
        var list = responseString.map((m) => new GetDepositAddress.fromJson(m)).toList();
        print('RMD deposit Success');
        return list[0].address;
      } else{
        print('ETH ${response.statusCode}');
      }
    } catch(e){
      print(e.toString());
    }
  }

  ///****************** ETH deposit address *****************///
  Future<dynamic> getETHDepositAddress() async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var accountId = userDetails.data()?['ethAccountId'];
    var url = Uri.parse('https://api-eu1.tatum.io/v3/offchain/account/address/batch');
    var bodyData = jsonEncode(
        {
          "addresses":
          [
            {
              "accountId": "$accountId"
            }
          ]
        }
    );
    try{
      var response = await http.post(url, headers: {
        'x-api-key' : Strings.xApiKey,
        'content-type': Strings.contentType
      }, body: bodyData);
      if(response.statusCode == 200){
        List responseString = jsonDecode(response.body);
        var list = responseString.map((m) => new GetDepositAddress.fromJson(m)).toList();
        print('ETH deposit Success');
        return list[0].address;
      } else{
        print('ETH ${response.statusCode}');
      }
    } catch(e){
      print(e.toString());
    }
  }

  ///****************** ETH deposit address *****************///
  Future<dynamic> getLTCDepositAddress() async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var accountId = userDetails.data()?['ltcAccountId'];
    var url = Uri.parse('https://api-eu1.tatum.io/v3/offchain/account/address/batch');
    var bodyData = jsonEncode(
        {
          "addresses":
          [
            {
              "accountId": "$accountId"
            }
          ]
        }
    );
    try{
      var response = await http.post(url, headers: {
        'x-api-key' : Strings.xApiKey,
        'content-type': Strings.contentType
      }, body: bodyData);
      if(response.statusCode == 200){
        List responseString = jsonDecode(response.body);
        var list = responseString.map((m) => new GetDepositAddress.fromJson(m)).toList();
        print('LTC deposit Success');
        return list[0].address;
      } else{
        print('LTC ${response.statusCode}');
      }
    } catch(e){
      print(e.toString());
    }
  }

  ///****************** BCH deposit address *****************///
  Future<dynamic> getBCHDepositAddress() async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var accountId = userDetails.data()?['bchAccountId'];
    var url = Uri.parse('https://api-eu1.tatum.io/v3/offchain/account/address/batch');
    var bodyData = jsonEncode(
        {
          "addresses":
          [
            {
              "accountId": "$accountId"
            }
          ]
        }
    );
    try{
      var response = await http.post(url, headers: {
        'x-api-key' : Strings.xApiKey,
        'content-type': Strings.contentType
      }, body: bodyData);
      if(response.statusCode == 200){
        List responseString = jsonDecode(response.body);
        var list = responseString.map((m) => new GetDepositAddress.fromJson(m)).toList();
        print('BCH deposit Success');
        return list[0].address;
      } else{
        print('BCH ${response.statusCode}');
      }
    } catch(e){
      print(e.toString());
    }
  }

  ///****************** BCH deposit address *****************///
  Future<dynamic> getADADepositAddress() async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var accountId = userDetails.data()?['adaAccountId'];
    var url = Uri.parse('https://api-eu1.tatum.io/v3/offchain/account/address/batch');
    var bodyData = jsonEncode(
        {
          "addresses":
          [
            {
              "accountId": "$accountId"
            }
          ]
        }
    );
    try{
      var response = await http.post(url, headers: {
        'x-api-key' : Strings.xApiKey,
        'content-type': Strings.contentType
      }, body: bodyData);
      if(response.statusCode == 200){
        List responseString = jsonDecode(response.body);
        var list = responseString.map((m) => new GetDepositAddress.fromJson(m)).toList();
        print('ADA deposit Success');
        return list[0].address;
      } else{
        print('ADA ${response.statusCode}');
      }
    } catch(e){
      print(e.toString());
    }
  }

  ///****************** BCH deposit address *****************///
  Future<dynamic> getBNBDepositAddress() async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var accountId = userDetails.data()?['bnbAccountId'];
    var url = Uri.parse('https://api-eu1.tatum.io/v3/offchain/account/address/batch');
    var bodyData = jsonEncode(
        {
          "addresses":
          [
            {
              "accountId": "$accountId"
            }
          ]
        }
    );
    try{
      var response = await http.post(url, headers: {
        'x-api-key' : Strings.xApiKey,
        'content-type': Strings.contentType
      }, body: bodyData);
      if(response.statusCode == 200){
        List responseString = jsonDecode(response.body);
        var list = responseString.map((m) => new GetDepositAddress.fromJson(m)).toList();
        print('BNB deposit Success');
        return list[0].address;
      } else{
        print('BNB ${response.statusCode}');
      }
    } catch(e){
      print(e.toString());
    }
  }

  ///****************** BCH deposit address *****************///
  Future<dynamic> getDOGEDepositAddress() async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var accountId = userDetails.data()?['dogeAccountId'];
    var url = Uri.parse('https://api-eu1.tatum.io/v3/offchain/account/address/batch');
    var bodyData = jsonEncode(
        {
          "addresses":
          [
            {
              "accountId": "$accountId"
            }
          ]
        }
    );
    try{
      var response = await http.post(url, headers: {
        'x-api-key' : Strings.xApiKey,
        'content-type': Strings.contentType
      }, body: bodyData);
      if(response.statusCode == 200){
        List responseString = jsonDecode(response.body);
        var list = responseString.map((m) => new GetDepositAddress.fromJson(m)).toList();
        print('DOGE deposit Success');
        return list[0].address;
      } else{
        print('DOGE ${response.statusCode}');
      }
    } catch(e){
      print(e.toString());
    }
  }

  ///****************** BCH deposit address *****************///
  Future<dynamic> getMATICDepositAddress() async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var accountId = userDetails.data()?['maticAccountId'];
    var url = Uri.parse('https://api-eu1.tatum.io/v3/offchain/account/address/batch');
    var bodyData = jsonEncode(
        {
          "addresses":
          [
            {
              "accountId": "$accountId"
            }
          ]
        }
    );
    try{
      var response = await http.post(url, headers: {
        'x-api-key' : Strings.xApiKey,
        'content-type': Strings.contentType
      }, body: bodyData);
      if(response.statusCode == 200){
        List responseString = jsonDecode(response.body);
        var list = responseString.map((m) => new GetDepositAddress.fromJson(m)).toList();
        print('MATIC deposit Success');
        return list[0].address;
      } else{
        print('MATIC ${response.statusCode}');
      }
    } catch(e){
      print(e.toString());
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
