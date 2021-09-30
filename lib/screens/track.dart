import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:realmood/GetPrices/GetPricesModel.dart';
import 'package:realmood/models/tracklistModel.dart';
import 'package:realmood/utils/constant.dart';
import 'package:realmood/widgets/tracklistWidget.dart';
import 'package:http/http.dart' as http;

class Track extends StatelessWidget {

  TextEditingController searchController=TextEditingController();
  GetPricesModel? _btcPriceModel;
  GetPricesModel? _ethPriceModel;
  GetPricesModel? _ltcPriceModel;
  GetPricesModel? _bchPriceModel;
  GetPricesModel? _adaPriceModel;
  GetPricesModel? _bnbPriceModel;
  GetPricesModel? _bscPriceModel;
  GetPricesModel? _dogePriceModel;
  GetPricesModel? _maticPriceModel;
  GetPricesModel? _xrpPriceModel;
  GetPricesModel? _xlmPriceModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
            child: Text(
              'Track Coins',
              style: style2.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Container(
          //   child: TextField(
          //     controller: searchController,
          //     cursorColor: tertiaryColor,
          //     decoration: InputDecoration(
          //       hintText: 'Search',
          //       hintStyle: TextStyle(
          //           fontSize: 14, color: secondaryColor.withOpacity(0.8)),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(30),
          //         borderSide: BorderSide(
          //           width: 0,
          //           style: BorderStyle.none,
          //         ),
          //       ),
          //       filled: true,
          //       fillColor: fifthColor,
          //       contentPadding: EdgeInsets.only(left: 30, top: 15, bottom: 15),
          //       suffixIcon: Padding(
          //         padding: EdgeInsets.only(right: 24.0, left: 16.0),
          //         child: Icon(
          //           LineIcons.search,
          //           color: tertiaryColor,
          //           size: 20,
          //         ),
          //       ),
          //     ),
          //     style: style2,
          //   ),
          // ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                imageCard('assets/bitcoin.png'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'BTC',
                                  style: style2.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            FutureBuilder(
                              future: getCoinPrice('BTC', _btcPriceModel),
                              builder: (BuildContext context, snapshot){
                                if(snapshot.hasData){
                                  return  Text(
                                    '\$${snapshot.data.toString()}',
                                    style: style2.copyWith(
                                      fontSize: 11,
                                      color: secondaryColor.withOpacity(0.8),
                                    ),
                                  );
                                }
                                else {
                                  return Center();
                                }
                              }
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                imageCard('assets/ethere.png'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'ETH',
                                  style: style2.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            FutureBuilder(
                                future: getCoinPrice('ETH', _btcPriceModel),
                                builder: (BuildContext context, snapshot){
                                  if(snapshot.hasData){
                                    return  Text(
                                      '\$${snapshot.data.toString()}',
                                      style: style2.copyWith(
                                        fontSize: 11,
                                        color: secondaryColor.withOpacity(0.8),
                                      ),
                                    );
                                  }
                                  else {
                                    return Center();
                                  }
                                }
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                imageCard('assets/ltc.png'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'LTC',
                                  style: style2.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            FutureBuilder(
                                future: getCoinPrice('LTC', _btcPriceModel),
                                builder: (BuildContext context, snapshot){
                                  if(snapshot.hasData){
                                    return  Text(
                                      '\$${snapshot.data.toString()}',
                                      style: style2.copyWith(
                                        fontSize: 11,
                                        color: secondaryColor.withOpacity(0.8),
                                      ),
                                    );
                                  }
                                  else {
                                    return Center();
                                  }
                                }
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                imageCard('assets/bch.png'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'BCH',
                                  style: style2.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            FutureBuilder(
                                future: getCoinPrice('BCH', _btcPriceModel),
                                builder: (BuildContext context, snapshot){
                                  if(snapshot.hasData){
                                    return  Text(
                                      '\$${snapshot.data.toString()}',
                                      style: style2.copyWith(
                                        fontSize: 11,
                                        color: secondaryColor.withOpacity(0.8),
                                      ),
                                    );
                                  }
                                  else {
                                    return Center();
                                  }
                                }
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                imageCard('assets/ada.png'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'ADA',
                                  style: style2.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            FutureBuilder(
                                future: getCoinPrice('ADA', _btcPriceModel),
                                builder: (BuildContext context, snapshot){
                                  if(snapshot.hasData){
                                    return  Text(
                                      '\$${snapshot.data.toString()}',
                                      style: style2.copyWith(
                                        fontSize: 11,
                                        color: secondaryColor.withOpacity(0.8),
                                      ),
                                    );
                                  }
                                  else {
                                    return Center();
                                  }
                                }
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                imageCard('assets/bnb.png'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'BNB',
                                  style: style2.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            FutureBuilder(
                                future: getCoinPrice('BNB', _btcPriceModel),
                                builder: (BuildContext context, snapshot){
                                  if(snapshot.hasData){
                                    return  Text(
                                      '\$${snapshot.data.toString()}',
                                      style: style2.copyWith(
                                        fontSize: 11,
                                        color: secondaryColor.withOpacity(0.8),
                                      ),
                                    );
                                  }
                                  else {
                                    return Center();
                                  }
                                }
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                imageCard('assets/doge.png'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'DOGECOIN',
                                  style: style2.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            FutureBuilder(
                                future: getCoinPrice('DOGE', _btcPriceModel),
                                builder: (BuildContext context, snapshot){
                                  if(snapshot.hasData){
                                    return  Text(
                                      '\$${snapshot.data.toString()}',
                                      style: style2.copyWith(
                                        fontSize: 11,
                                        color: secondaryColor.withOpacity(0.8),
                                      ),
                                    );
                                  }
                                  else {
                                    return Center();
                                  }
                                }
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                imageCard('assets/lite.png'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'MATIC',
                                  style: style2.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            FutureBuilder(
                                future: getCoinPrice('POLY', _btcPriceModel),
                                builder: (BuildContext context, snapshot){
                                  if(snapshot.hasData){
                                    return  Text(
                                      '\$${snapshot.data.toString()}',
                                      style: style2.copyWith(
                                        fontSize: 11,
                                        color: secondaryColor.withOpacity(0.8),
                                      ),
                                    );
                                  }
                                  else {
                                    return Center();
                                  }
                                }
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                imageCard('assets/xrp.png'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'XRP',
                                  style: style2.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            FutureBuilder(
                                future: getCoinPrice('XRP', _btcPriceModel),
                                builder: (BuildContext context, snapshot){
                                  if(snapshot.hasData){
                                    return  Text(
                                      '\$${snapshot.data.toString()}',
                                      style: style2.copyWith(
                                        fontSize: 11,
                                        color: secondaryColor.withOpacity(0.8),
                                      ),
                                    );
                                  }
                                  else {
                                    return Center();
                                  }
                                }
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                imageCard('assets/xlm.png'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'XLM',
                                  style: style2.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            FutureBuilder(
                                future: getCoinPrice('XLM', _btcPriceModel),
                                builder: (BuildContext context, snapshot){
                                  if(snapshot.hasData){
                                    return  Text(
                                      '\$${snapshot.data.toString()}',
                                      style: style2.copyWith(
                                        fontSize: 11,
                                        color: secondaryColor.withOpacity(0.8),
                                      ),
                                    );
                                  }
                                  else {
                                    return Center();
                                  }
                                }
                            )
                          ],
                        ),
                      ),
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

  Future<dynamic> getCoinPrice(var coinName, var model) async{
    var url = Uri.parse('https://rest.coinapi.io/v1/assets?filter_asset_id=$coinName');
    try{
      var response = await http.get(url,
      headers: {
        'X-CoinAPI-Key' : '0EEAA860-8153-4E23-A06B-C3FA8438F2A4'
      });
      if(response.statusCode == 200){
        List<dynamic> list = json.decode(response.body);
        return list[0]['price_usd'];
      }
      else {
        print(response.statusCode);
      }
    }
    catch(e){
      print(e);
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
