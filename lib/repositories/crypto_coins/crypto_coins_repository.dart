import 'package:crypto_app/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class CryptoCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AID,AVAX,HPT,INT,LRC,NAVI,ZIL,&tsyms=USD');

    debugPrint(response.toString());
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];
      return CryptoCoin(name: e.key, priceInUSD: price, imageUrl: 'https://www.cryptocompare.com/$imageUrl');
    }).toList();
 
    return cryptoCoinList;
  }
}
