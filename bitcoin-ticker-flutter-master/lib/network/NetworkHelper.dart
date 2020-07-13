import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({this.url});

  final String url;

  Future getCoinConvertsData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var data = response.body;
      var coinData = jsonDecode(data);
      return coinData;
    }
  }
}
