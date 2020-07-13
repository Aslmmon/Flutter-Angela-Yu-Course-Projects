import 'package:bitcoin_ticker/network/NetworkHelper.dart';
import 'package:bitcoin_ticker/network/coin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;


class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = "USD";
  String assetBase;
  String assetQuote;
  double rate = 0;

  var coin = Coin();

  @override
  void initState() {
    super.initState();
      updateUI();
  }
  Future<void> updateUI() async {
    var data = await coin.getCoinConvertData(selectedCurrency);
    setState(() {
      if(data!=null){
        assetBase  = data["asset_id_base"];
        assetQuote = data["asset_id_quote"];
        rate = data["rate"];
      }else{
        rate = 0;
      }
    });

    print(data);
  }


  Widget getPicker() {
    if (Platform.isIOS) {
      return iosCupertinoPicker();
    } else if (Platform.isAndroid) {
      return androidDropDown();
    }
  }

  DropdownButton androidDropDown() {
    List<DropdownMenuItem<String>> menuItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String currency = currenciesList[i];
      var newItem = DropdownMenuItem(child: Text(currency), value: currency);
      menuItems.add(newItem);
    }
    return DropdownButton(
      value: selectedCurrency,
      items: menuItems,
      onChanged: (val) {
        setState(() {
          selectedCurrency = val;
          updateUI();
        });
      },
    );
  }

  CupertinoPicker iosCupertinoPicker() {
    List<Text> menuItems = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String currency = currenciesList[i];
      var newItem = Text(
        currency,
        style: TextStyle(color: Colors.white),
      );
      menuItems.add(newItem);
    }
    return CupertinoPicker(
        itemExtent: 32,
        onSelectedItemChanged: (selectedIndex) {
          setState(() {
            selectedCurrency = currenciesList[selectedIndex];
          });
          updateUI();
        },
        children: menuItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ${rate.toInt()} $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iosCupertinoPicker() : iosCupertinoPicker(),
          ),
        ],
      ),
    );
  }
}
