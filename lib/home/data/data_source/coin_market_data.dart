import 'dart:convert';

import 'package:crypto/home/data/models/chart.dart';
import 'package:crypto/home/data/models/coin_market_model.dart';
import 'package:http/http.dart' as http;

class CoinMarketData {
  Future<List<CoinModel>> getCoinMarket() async {
    try {
      List<CoinModel> coinMarketList = [];
      const url =
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';

      var response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      });

      if (response.statusCode == 200) {
        var x = response.body;
        coinMarketList = coinModelFromJson(x);
      }

      return coinMarketList;
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }

  Future<List<ChartModel>?> getChartData(String id, String days) async {
    try {
      List<ChartModel>? modelList;
      String url =
          'https://api.coingecko.com/api/v3/coins/$id/ohlc?vs_currency=usd&days=$days';
      var response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      });

      if (response.statusCode == 200) {
        Iterable x = json.decode(response.body);
        modelList = x.map((e) => ChartModel.fromJson(e)).toList();
      }
      
      return modelList;
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }
}
