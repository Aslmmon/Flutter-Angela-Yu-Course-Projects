import 'package:bitcoin_ticker/network/NetworkHelper.dart';

class Coin{
  static const coinConverterApi = "https://rest.coinapi.io";
  final api_key = "36489E3A-D1E6-4D19-8310-7B84DF2D6B9B";


  Future<dynamic> getCoinConvertData(String currency) async {
    var url = '$coinConverterApi/v1/exchangerate/BTC/$currency?apikey=$api_key"';
    NetworkHelper networkingHelper = NetworkHelper(url: url);
    var coinData = await networkingHelper.getCoinConvertsData();
     print(coinData);
    return coinData;

  }



}