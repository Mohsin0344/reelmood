import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:realmood/AccountDetails/ADAAccountDetails.dart';
import 'package:realmood/AccountDetails/BCHAccountDetails.dart';
import 'package:realmood/AccountDetails/BNBAccountDetails.dart';
import 'package:realmood/AccountDetails/BSCAccountDetails.dart';
import 'package:realmood/AccountDetails/BTCAccountDetails.dart';
import 'package:realmood/AccountDetails/DogeAccountDetails.dart';
import 'package:realmood/AccountDetails/ETHAccountDetails.dart';
import 'package:realmood/AccountDetails/LTCAccountDetails.dart';
import 'package:realmood/AccountDetails/MATICAccountDetails.dart';
import 'package:realmood/AccountDetails/XLMAccountDetails.dart';
import 'package:realmood/AccountDetails/XRPAccountDetails.dart';
import 'package:realmood/Strings.dart';
import 'package:realmood/models/homeModel.dart';
import 'package:realmood/screens/ReceiveScreen.dart';
import 'package:realmood/screens/SendCoins.dart';
import 'package:realmood/screens/WebViewRmd.dart';
import 'package:realmood/utils/constant.dart';
import 'package:realmood/widgets/homewidget.dart';
import 'package:realmood/widgets/pressedwidget.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var totalAccount = 0.0;
  bool isvisible = true;
  bool isvisible1 = false;
  Color clr = tertiaryColor;
  Color clr2 = fifthColor;
  Color TextColor = secondaryColor;
  Color TextColor2 = secondaryColor;
  String? selectValue;
  List selectValueList = [
    'USD',
    'BTC',
  ];

  ///************** Account Details Model **********////
  BTCAccountDetails? _btcAccountDetails;
  ETHAccountDetails? _ethAccountDetails;
  LTCAccountDetails? _ltcAccountDetails;
  BCHAccountDetails? _bchAccountDetails;
  ADAAccountDetails? _adaAccountDetails;
  BNBAccountDetails? _bnbAccountDetails;
  BSCAccountDetails? _bscAccountDetails;
  BSCAccountDetails? _bscAccountDetails2;
  DOGEAccountDetails? _dogeAccountDetails;
  MATICAccountDetails? _maticAccountDetails;
  XRPAccountDetails? _xrpAccountDetails;
  XLMAccountDetails? _xlmAccountDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              padding: EdgeInsets.only(
                top: Get.height * 0.05
              ),
              decoration: BoxDecoration(
                color: const Color(0xff13131E),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)
                )
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: Get.height * 0.032,
                          left: Get.width * 0.055,
                          right: Get.width * 0.055,
                          bottom: Get.height * 0.05,
                        ),
                        height: Get.height * 0.25,
                        width: Get.width * 0.80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff707070)
                          ),
                          borderRadius: BorderRadius.circular(14.67),
                          gradient: LinearGradient(
                            begin: Alignment(2.12, 2.09),
                            end: Alignment(-0.91, -0.89),
                            colors: [
                              const Color(0x36a93bfd),
                              const Color(0x006f4cec),
                              const Color(0x366150e8),
                              const Color(0x36a93bfd)
                            ],
                            stops: [0.075, 0.367, 0.606, 1.0],
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/lines.png'),
                            fit: BoxFit.fill
                          )
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Total Balance'
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: Get.height * 0.0032,
                                          left: Get.width * 0.020,
                                        ),
                                        child: Image.asset('assets/eyee.png',
                                        width: Get.width * 0.05,
                                    ),
                                      )
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Image.asset('assets/sim.png',
                                      width: Get.width * 0.10,
                                      )
                                    ),
                                  )
                                ],
                              )
                            ),
                            Expanded(
                              flex: 4,
                              child: Row(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      '0.00',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 31,
                                        height: 1.2
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        bottom: Get.width * 0.015
                                      ),
                                      child: Text(
                                        ' USD',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14
                                        ),
                                        textHeightBehavior:
                                        TextHeightBehavior(applyHeightToFirstAscent: false),

                                      ),
                                    ),
                                  )
                                ],
                              )
                            )
                          ],
                        ),
                      )
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.1,
                        vertical: Get.height * 0.01
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  ReceiveCoins()
                              ));
                            },
                            child: Container(
                              height: Get.height * 0.15,
                              width: Get.width * 0.22,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(13.93),
                                          color: const Color(0xff262a34),
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.all(20),
                                            child: Image.asset('assets/receive.png')),
                                      )
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                          'Recieve',
                                          style: GoogleFonts.poppins(
                                            fontSize: 11.942790031433105,
                                            color: const Color(0xffffffff),
                                            height: 1.2000000319414246,
                                          ),
                                          textHeightBehavior:
                                          TextHeightBehavior(applyHeightToFirstAscent: false),
                                          textAlign: TextAlign.left,
                                        ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context)=> RmdNews()));
                            },
                            child: Container(
                              height: Get.height * 0.15,
                              width: Get.width * 0.25,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            top:10,
                                          bottom: 10
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(13.93),
                                            color: const Color(0xff262a34),
                                          ),
                                          child: Padding(
                                              padding: EdgeInsets.all(20),
                                              child: Image.asset('assets/buy.png',
                                              width: Get.width * 0.08,
                                              )),
                                        )
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        'Buy',
                                        style: GoogleFonts.poppins(
                                          fontSize: 11.942790031433105,
                                          color: const Color(0xffffffff),
                                          height: 1.2000000319414246,
                                        ),
                                        textHeightBehavior:
                                        TextHeightBehavior(applyHeightToFirstAscent: false),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  SendCoins(rmdAmount: _bscAccountDetails!.balance.accountBalance.toString(),
                                    btcBalance: _btcAccountDetails!.balance.accountBalance.toString(),
                                    ethBalance: _ethAccountDetails!.balance.accountBalance.toString(),
                                    ltcBalance: _ltcAccountDetails!.balance.accountBalance.toString(),
                                    bchBalance: _bchAccountDetails!.balance.accountBalance.toString(),
                                    adaBalance: _adaAccountDetails!.balance.accountBalance.toString(),
                                    bnbBalance: _bscAccountDetails2!.balance.accountBalance.toString(),
                                    dogeBalance: _dogeAccountDetails!.balance.accountBalance.toString(),
                                    maticBalance: _maticAccountDetails!.balance.accountBalance.toString(),
                                    xrpBalance: _xrpAccountDetails!.balance.accountBalance.toString(),
                                    xlmBalance: _xlmAccountDetails!.balance.accountBalance.toString(),
                                  )
                              ));
                            },
                            child: Container(
                              height: Get.height * 0.15,
                              width: Get.width * 0.22,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(13.93),
                                            color: const Color(0xff262a34),
                                          ),
                                          child: Padding(
                                              padding: EdgeInsets.all(20),
                                              child: Image.asset('assets/send.png')),
                                        )
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        'Send',
                                        style: GoogleFonts.poppins(
                                          fontSize: 11.942790031433105,
                                          color: const Color(0xffffffff),
                                          height: 1.2000000319414246,
                                        ),
                                        textHeightBehavior:
                                        TextHeightBehavior(applyHeightToFirstAscent: false),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                  )
                ],
              )
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: const Color(0xff191926),
              child: bottomSwitchCard(),
            ),
          )
        ],
      ),
    );
  }

  upperCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Center(
        //   child: Container(
        //     height: MediaQuery.of(context).size.height! *  0.30,
        //     width: MediaQuery.of(context).size.width! *  0.30,
        //     color: Colors.red,
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              circleButton(() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  ReceiveCoins()
                ));
              }, 'Receive', LineIcons.arrowDown),
              circleButton(() {}, 'Buy', LineIcons.shoppingBag),
              circleButton(() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    SendCoins(rmdAmount: _bscAccountDetails!.balance.accountBalance.toString(),
                    btcBalance: _btcAccountDetails!.balance.accountBalance.toString(),
                      ethBalance: _ethAccountDetails!.balance.accountBalance.toString(),
                      ltcBalance: _ltcAccountDetails!.balance.accountBalance.toString(),
                      bchBalance: _bchAccountDetails!.balance.accountBalance.toString(),
                      adaBalance: _adaAccountDetails!.balance.accountBalance.toString(),
                      bnbBalance: _bscAccountDetails2!.balance.accountBalance.toString(),
                      dogeBalance: _dogeAccountDetails!.balance.accountBalance.toString(),
                      maticBalance: _maticAccountDetails!.balance.accountBalance.toString(),
                      xrpBalance: _xrpAccountDetails!.balance.accountBalance.toString(),
                      xlmBalance: _xlmAccountDetails!.balance.accountBalance.toString(),
                    )
                ));
              }, 'Send', LineIcons.arrowUp),
            ],
          ),
        ),
        SizedBox(
          height: 3,
        ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 10, right: 10),
        //   child: switchButton(),
        // ),
      ],
    );
  }

  bottomSwitchCard() {
    return Container(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 10
        ),
        child: Text('Favorites',
          style: GoogleFonts.poppins(
            color: Colors.white
          ),
        ),
      ),
      Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 10, left: 25, right: 25),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              FutureBuilder(
                future: getAccountDetailsBSC(),
                builder: (BuildContext context, snapshot){
                  if(snapshot.hasData){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 9),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: fifthColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    imageCard('assets/Logo1.png'),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'RMD',
                                          style: style2.copyWith(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Text(
                                          'Watchlist',
                                          style: style2.copyWith(
                                              color: secondaryColor.withOpacity(0.6),
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$${_bscAccountDetails!.balance.accountBalance.toString()}',
                                      style: style2.copyWith(
                                          color: secondaryColor.withOpacity(0.6), fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              FutureBuilder(
                future: getAccountDetailsBTC(),
                builder: (BuildContext context, snapshot){
                  if(snapshot.hasData){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 9),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: fifthColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    imageCard('assets/bitcoin.png'),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'BTC',
                                          style: style2.copyWith(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Text(
                                          'Watchlist',
                                          style: style2.copyWith(
                                              color: secondaryColor.withOpacity(0.6),
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$${_btcAccountDetails!.balance.accountBalance.toString()}',
                                      style: style2.copyWith(
                                          color: secondaryColor.withOpacity(0.6), fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else return Center();
                },
              ),
              FutureBuilder(
                future: getAccountDetailsETH(),
                builder: (BuildContext context, snapshot){
                  if(snapshot.hasData){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 9),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: fifthColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    imageCard('assets/ethere.png'),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ETH',
                                          style: style2.copyWith(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Text(
                                          'Watchlist',
                                          style: style2.copyWith(
                                              color: secondaryColor.withOpacity(0.6),
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$${_ethAccountDetails!.balance.accountBalance.toString()}',
                                      style: style2.copyWith(
                                          color: secondaryColor.withOpacity(0.6), fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              FutureBuilder(
                future: getAccountDetailsLTC(),
                builder: (BuildContext context, snapshot){
                  if(snapshot.hasData){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 9),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: fifthColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    imageCard('assets/ltc.png'),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'LTC',
                                          style: style2.copyWith(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Text(
                                          'Watchlist',
                                          style: style2.copyWith(
                                              color: secondaryColor.withOpacity(0.6),
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$${_ltcAccountDetails!.balance.accountBalance.toString()}',
                                      style: style2.copyWith(
                                          color: secondaryColor.withOpacity(0.6), fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else return Center();
                },
              ),
              FutureBuilder(
                future: getAccountDetailsBCH(),
                builder: (BuildContext context, snapshot){
                  if(snapshot.hasData){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 9),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: fifthColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    imageCard('assets/bch.png'),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'BCH',
                                          style: style2.copyWith(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Text(
                                          'Watchlist',
                                          style: style2.copyWith(
                                              color: secondaryColor.withOpacity(0.6),
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$${_bchAccountDetails!.balance.accountBalance.toString()}',
                                      style: style2.copyWith(
                                          color: secondaryColor.withOpacity(0.6), fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else return Center();
                },
              ),
              FutureBuilder(
                future: getAccountDetailsADA(),
                builder: (BuildContext context, snapshot){
                  if(snapshot.hasData){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 9),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: fifthColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    imageCard('assets/ada.png'),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ADA',
                                          style: style2.copyWith(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Text(
                                          'Watchlist',
                                          style: style2.copyWith(
                                              color: secondaryColor.withOpacity(0.6),
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$${_adaAccountDetails!.balance.accountBalance.toString()}',
                                      style: style2.copyWith(
                                          color: secondaryColor.withOpacity(0.6), fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else return Center();
                },
              ),
              FutureBuilder(
                future: getAccountDetailsBNB(),
                builder: (BuildContext context, snapshot){
                  if(snapshot.hasData){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 9),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: fifthColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    imageCard('assets/bnb.png'),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'BNB',
                                          style: style2.copyWith(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Text(
                                          'Watchlist',
                                          style: style2.copyWith(
                                              color: secondaryColor.withOpacity(0.6),
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$${_bscAccountDetails2!.balance.accountBalance.toString()}',
                                      style: style2.copyWith(
                                          color: secondaryColor.withOpacity(0.6), fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else return Center();
                },
              ),
              FutureBuilder(
                future: getAccountDetailsDOGE(),
                builder: (BuildContext context, snapshot){
                  if(snapshot.hasData){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 9),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: fifthColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    imageCard('assets/doge.png'),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'DOGECOIN',
                                          style: style2.copyWith(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Text(
                                          'Watchlist',
                                          style: style2.copyWith(
                                              color: secondaryColor.withOpacity(0.6),
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$${_dogeAccountDetails!.balance.accountBalance.toString()}',
                                      style: style2.copyWith(
                                          color: secondaryColor.withOpacity(0.6), fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else return Center();
                },
              ),
              FutureBuilder(
                future: getAccountDetailsMATIC(),
                builder: (BuildContext context, snapshot){
                  if(snapshot.hasData){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 9),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: fifthColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    imageCard('assets/lite.png'),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'MATIC',
                                          style: style2.copyWith(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Text(
                                          'Watchlist',
                                          style: style2.copyWith(
                                              color: secondaryColor.withOpacity(0.6),
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$${_maticAccountDetails!.balance.accountBalance.toString()}',
                                      style: style2.copyWith(
                                          color: secondaryColor.withOpacity(0.6), fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else return Center();
                },
              ),
              FutureBuilder(
                future: getAccountDetailsXRP(),
                builder: (BuildContext context, snapshot){
                  if(snapshot.hasData){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 9),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: fifthColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    imageCard('assets/xrp.png'),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'XRP',
                                          style: style2.copyWith(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Text(
                                          'Watchlist',
                                          style: style2.copyWith(
                                              color: secondaryColor.withOpacity(0.6),
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$${_xrpAccountDetails!.balance.accountBalance.toString()}',
                                      style: style2.copyWith(
                                          color: secondaryColor.withOpacity(0.6), fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else return Center();
                },
              ),
              FutureBuilder(
                future: getAccountDetailsXLM(),
                builder: (BuildContext context, snapshot){
                  if(snapshot.hasData){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 9),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: fifthColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    imageCard('assets/lite.png'),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'XLM',
                                          style: style2.copyWith(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 1,
                                        ),
                                        Text(
                                          'Watchlist',
                                          style: style2.copyWith(
                                              color: secondaryColor.withOpacity(0.6),
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$${_xlmAccountDetails!.balance.accountBalance.toString()}',
                                      style: style2.copyWith(
                                          color: secondaryColor.withOpacity(0.6), fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else return Center();
                },
              ),
            ],
          ),
        ),
      ),
    ],
      ),
    );
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

  // switchButton() {
  //   return Container(
  //     width: double.infinity,
  //     margin: EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 2),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Expanded(
  //           child: ElevatedButton(
  //             onPressed: () {
  //               setState(() {
  //                 isvisible = true;
  //                 isvisible1 = false;
  //                 clr = tertiaryColor;
  //                 clr2 = fifthColor;
  //                 TextColor2 = secondaryColor;
  //                 TextColor = secondaryColor;
  //               });
  //             },
  //             style: ElevatedButton.styleFrom(
  //                 primary: clr,
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.only(
  //                       topLeft: Radius.circular(20),
  //                       bottomLeft: Radius.circular(20)),
  //                 )),
  //             child: Text(
  //               'Favorites',
  //               style: TextStyle(
  //                   fontSize: 10,
  //                   color: TextColor2,
  //                   fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //         ),
  //         Expanded(
  //           child: ElevatedButton(
  //             onPressed: () {
  //               setState(() {
  //                 isvisible1 = true;
  //                 isvisible = false;
  //                 clr2 = tertiaryColor;
  //                 clr = fifthColor;
  //                 TextColor = secondaryColor;
  //                 TextColor2 = secondaryColor;
  //               });
  //             },
  //             style: ElevatedButton.styleFrom(
  //                 primary: clr2,
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.only(
  //                       topRight: Radius.circular(20),
  //                       bottomRight: Radius.circular(20)),
  //                 )),
  //             child: Text(
  //               'Collectibles',
  //               style: TextStyle(
  //                   fontSize: 10,
  //                   color: TextColor,
  //                   fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  selectValueMenu() {
    return Container(
      height: 25,
      decoration: BoxDecoration(
        color: secondaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 6, right: 2),
        child: DropdownButton(
          value: selectValue,
          hint: Text(
            'USD',
            style: style2.copyWith(fontSize: 10, color: secondaryColor),
          ),
          iconSize: 20,
          underline: Container(
            height: 0,
            color: Colors.deepPurpleAccent,
          ),
          icon: Icon(
            Icons.arrow_drop_down,
            color: primaryColor,
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectValue = newValue!;
            });
          },
          dropdownColor: tertiaryColor,
          items: selectValueList.map((valueItems) {
            return new DropdownMenuItem<String>(
              value: valueItems,
              child: new Text(
                valueItems,
                style: style2.copyWith(fontSize: 8, color: secondaryColor),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  ///************** BTC ACCOUNT DETAILS ****************///////
  Future getAccountDetailsBTC() async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var accountId = userDetails.data()?['btcAccountId'];
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account/$accountId');
    try{
      var response = await http.get(url, headers: {
        'x-api-key' : Strings.xApiKey});
      if(response.statusCode == 200){
          _btcAccountDetails = BTCAccountDetails.fromRawJson(response.body);
          print('BTC Success');
          return _btcAccountDetails;
      } else{
        print('BTC ${response.statusCode}');
      }
    } catch(e){
      print(e.toString());
    }
  }

  ///************** ETH ACCOUNT DETAILS ****************///////
  Future getAccountDetailsETH() async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var accountId = userDetails.data()?['ethAccountId'];
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account/$accountId');
    try{
      var response = await http.get(url, headers: {
        'x-api-key' : Strings.xApiKey});
      if(response.statusCode == 200){
          _ethAccountDetails = ETHAccountDetails.fromRawJson(response.body);
          print('ETH Success');
          return _ethAccountDetails;
      } else{
        print('ETH ${response.statusCode}');
      }
    } catch(e){
      print(e.toString());
    }
  }

  ///************** LTC ACCOUNT DETAILS ****************///////
  Future getAccountDetailsLTC() async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var accountId = userDetails.data()?['ltcAccountId'];
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account/$accountId');
    try{
      var response = await http.get(url, headers: {
        'x-api-key' : Strings.xApiKey});
      if(response.statusCode == 200){
          _ltcAccountDetails = LTCAccountDetails.fromRawJson(response.body);
        print('LTC Success');
        return _ltcAccountDetails;
      } else{
        print('LTC ${response.statusCode}');
      }
    } catch(e){
      print(e.toString());
    }
  }

  ///************** BCH ACCOUNT DETAILS ****************///////
  Future getAccountDetailsBCH() async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var accountId = userDetails.data()?['bchAccountId'];
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account/$accountId');
    try{
      var response = await http.get(url, headers: {
        'x-api-key' : Strings.xApiKey});
      if(response.statusCode == 200){
          _bchAccountDetails = BCHAccountDetails.fromRawJson(response.body);
        print('BCH Success');
        return _bchAccountDetails;
      } else{
        print('BCH ${response.statusCode}');
      }
    } catch(e){
      print(e.toString());
    }
  }

  ///************** ADA ACCOUNT DETAILS ****************///////
  Future getAccountDetailsADA() async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var accountId = userDetails.data()?['adaAccountId'];
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account/$accountId');
    try{
      var response = await http.get(url, headers: {
        'x-api-key' : Strings.xApiKey});
      if(response.statusCode == 200){
          _adaAccountDetails = ADAAccountDetails.fromRawJson(response.body);
        print('ADA Success');
        return _adaAccountDetails;
      } else{
        print('ADA ${response.statusCode}');
      }
    } catch(e){
      print(e.toString());
    }
  }

  ///************** BNB ACCOUNT DETAILS ****************///////
  Future getAccountDetailsBNB() async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var accountId = userDetails.data()?['bnbAccountId'];
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account/$accountId');
    try{
      var response = await http.get(url, headers: {
        'x-api-key' : Strings.xApiKey});
      if(response.statusCode == 200){
        print(response.statusCode);
        _bscAccountDetails2 = BSCAccountDetails.fromRawJson(response.body);
        return _bscAccountDetails2;
      } else{
        print('BSC ${response.body}');
      }
    } catch(e){
      print(e.toString());
    }
  }

  ///************** BSC ACCOUNT DETAILS ****************///////
  Future<dynamic> getAccountDetailsBSC() async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var accountId = userDetails.data()?['bscAccountId'];
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account/$accountId');
    try{
      var response = await http.get(url, headers: {
        'x-api-key' : Strings.xApiKey});
      if(response.statusCode == 200){
        print(response.statusCode);
          _bscAccountDetails = BSCAccountDetails.fromRawJson(response.body);
        return _bscAccountDetails;
      } else{
        print('BSC ${response.body}');
      }
    } catch(e){
      print(e.toString());
    }
  }

  ///************** BSC ACCOUNT DETAILS ****************///////
  Future getAccountDetailsDOGE() async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var accountId = userDetails.data()?['dogeAccountId'];
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account/$accountId');
    try{
      var response = await http.get(url, headers: {
        'x-api-key' : Strings.xApiKey});
      if(response.statusCode == 200){
          _dogeAccountDetails = DOGEAccountDetails.fromRawJson(response.body);
        print('DOGE Success');
        return _dogeAccountDetails;
      } else{
        print('DOGE ${response.statusCode}');
      }
    } catch(e){
      print(e.toString());
    }
  }

  ///************** MATIC ACCOUNT DETAILS ****************///////
  Future getAccountDetailsMATIC() async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var accountId = userDetails.data()?['maticAccountId'];
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account/$accountId');
    try{
      var response = await http.get(url, headers: {
        'x-api-key' : Strings.xApiKey});
      if(response.statusCode == 200){
          _maticAccountDetails = MATICAccountDetails.fromRawJson(response.body);
        print('MATIC Success');
        return _maticAccountDetails;
      } else{
        print('MATIC ${response.statusCode}');
      }
    } catch(e){
      print(e.toString());
    }
  }

  ///************** XRP ACCOUNT DETAILS ****************///////
  Future getAccountDetailsXRP() async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var accountId = userDetails.data()?['xrpAccountId'];
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account/$accountId');
    try{
      var response = await http.get(url, headers: {
        'x-api-key' : Strings.xApiKey});
      if(response.statusCode == 200){
          _xrpAccountDetails = XRPAccountDetails.fromRawJson(response.body);
        print('XRP Success');
        return _xrpAccountDetails;
      } else{
        print('XRP ${response.statusCode}');
      }
    } catch(e){
      print(e.toString());
    }
  }

  ///************** XLM ACCOUNT DETAILS ****************///////
  Future getAccountDetailsXLM() async{
    var firebaseUser =  FirebaseAuth.instance.currentUser;
    var userDetails = await FirebaseFirestore.instance.collection("Users").doc(firebaseUser!.uid).get();
    var accountId = userDetails.data()?['xlmAccountId'];
    var url = Uri.parse('https://api-eu1.tatum.io/v3/ledger/account/$accountId');
    try{
      var response = await http.get(url, headers: {
        'x-api-key' : Strings.xApiKey});
      if(response.statusCode == 200){
          _xlmAccountDetails = XLMAccountDetails.fromRawJson(response.body);
        getSum();
          print('XLM Success');
        return _xlmAccountDetails;
      } else{
        print('XLM ${response.statusCode}');
      }
    } catch(e){
      print(e.toString());
    }
  }

   getSum() {
    var total = double.parse(_btcAccountDetails!.balance.accountBalance.toString())
        +
        double.parse(_ethAccountDetails!.balance.accountBalance.toString())
        +
        double.parse(_ltcAccountDetails!.balance.accountBalance.toString())
        +
        double.parse(_bchAccountDetails!.balance.accountBalance.toString())
        +
        double.parse(_adaAccountDetails!.balance.accountBalance.toString())
        +
        double.parse(_bnbAccountDetails!.balance.accountBalance.toString())
        +
        double.parse(_bscAccountDetails!.balance.accountBalance.toString())
        +
        double.parse(_dogeAccountDetails!.balance.accountBalance.toString())
        +
        double.parse(_maticAccountDetails!.balance.accountBalance.toString())
        +
        double.parse(_xrpAccountDetails!.balance.accountBalance.toString())
        +
        double.parse(_xlmAccountDetails!.balance.accountBalance.toString());
    print(total);
    setState(() {
      totalAccount = total;
    });
  }
}
