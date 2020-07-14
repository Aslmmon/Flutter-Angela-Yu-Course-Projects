import 'package:bitcoin_ticker/network/NetworkHelper.dart';

import '../coin_data.dart';

class Coin {
  static const coinConverterApi = "https://rest.coinapi.io";
  final api_key = "36489E3A-D1E6-4D19-8310-7B84DF2D6B9B";

  Future<dynamic> getCoinConvertData(String currency) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      var url =
          '$coinConverterApi/v1/exchangerate/$crypto/$currency?apikey=$api_key';
      NetworkHelper networkingHelper = NetworkHelper(url: url);
      var coinData = await networkingHelper.getCoinConvertsData();
      cryptoPrices[crypto] = coinData["rate"].toStringAsFixed(0);
      print(url);
      print(cryptoPrices.toString());
    }
    return cryptoPrices;

  }
}
