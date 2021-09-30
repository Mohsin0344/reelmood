import 'package:flutter/material.dart';
import 'package:realmood/screens/SendToScreen.dart';
import 'package:realmood/utils/constant.dart';
import 'package:realmood/widgets/inputWidget.dart';

class SendCoins extends StatefulWidget {
  var rmdAmount;
  var btcBalance;
  var ethBalance;
  var ltcBalance;
  var bchBalance;
  var adaBalance;
  var bnbBalance;
  var dogeBalance;
  var maticBalance;
  var xrpBalance;
  var xlmBalance;
   SendCoins({Key? key, this.rmdAmount, this.btcBalance,
   this.adaBalance, this.bchBalance, this.bnbBalance, this.dogeBalance,
     this.ethBalance, this.ltcBalance, this.maticBalance, this.xlmBalance,
     this.xrpBalance
   }) : super(key: key);

  @override
  _SendCoinsState createState() => _SendCoinsState();
}

class _SendCoinsState extends State<SendCoins> {

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
                  'Send Crypto',
                  style: TextStyle(fontSize: 18, color: secondaryColor)
              )
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  'Select a wallet',
                  style: TextStyle(fontSize: 12, color: secondaryColor.withOpacity(0.5))
              )
          ),
          SizedBox(
            height: 20,
          ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                SendTo(currency: 'RMD', image: 'assets/Logo1.png',
                balance: widget.rmdAmount,
                )
            ));
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
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'RMD',
                            style: style2.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  SendTo(currency: 'BTC', image: 'assets/bitcoin.png',
                    balance: widget.btcBalance,
                  )
              ));
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
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'BTC',
                              style: style2.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  SendTo(currency: 'ETH', image: 'assets/ethere.png',
                    balance: widget.ethBalance,
                  )
              ));
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
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'ETH',
                              style: style2.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  SendTo(currency: 'LTC', image: 'assets/ltc.png',
                    balance: widget.ltcBalance,
                  )
              ));
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
                    child: imageCard('assets/ltc.png'),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'LTC',
                              style: style2.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  SendTo(currency: 'BCH', image: 'assets/bch.png',
                    balance: widget.bchBalance,
                  )
              ));
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
                    child: imageCard('assets/bch.png'),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'BCH',
                              style: style2.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  SendTo(currency: 'ADA', image: 'assets/ada.png',
                    balance: widget.adaBalance,
                  )
              ));
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
                    child: imageCard('assets/ada.png'),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'ADA',
                              style: style2.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  SendTo(currency: 'BNB', image: 'assets/bnb.png',
                    balance: widget.bnbBalance,
                  )
              ));
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
                    child: imageCard('assets/bnb.png'),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'BNB',
                              style: style2.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  SendTo(currency: 'DOGE', image: 'assets/doge.png',
                    balance: widget.dogeBalance,
                  )
              ));
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
                    child: imageCard('assets/doge.png'),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'DOGE',
                              style: style2.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  SendTo(currency: 'MATIC', image: 'assets/lite.png',
                    balance: widget.maticBalance,
                  )
              ));
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
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'MATIC',
                              style: style2.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  SendTo(currency: 'XRP', image: 'assets/xrp.png',
                    balance: widget.xrpBalance,
                  )
              ));
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
                    child: imageCard('assets/xrp.png'),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'XRP',
                              style: style2.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  SendTo(currency: 'XLM', image: 'assets/xlm.png',
                    balance: widget.xlmBalance,
                  )
              ));
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
                    child: imageCard('assets/xlm.png'),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'XLM',
                              style: style2.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
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
}
