import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'coin_data.dart';
import 'crypto_block.dart';

class CryptoData{
  CryptoData(this.currentCurrency);
  String currentCurrency = 'USD';

  Future<List<Widget>> getCryptoBlocks() async{
    List<Widget> cryptoBlocks = [];

    for(String crypto in cryptoList){
      http.Response response = await http.get(Uri.parse('https://rest.coinapi.io/v1/exchangerate/$crypto/$currentCurrency?apikey=DE6AA1A0-A7C5-4FC2-883B-2B53BA8261B1'));
      print(response.statusCode);
      if(response.statusCode == 200) {
        double price = jsonDecode(response.body)['rate'];
        print(price);
        var cryptoBlock = CryptoBlock(cryptoName: crypto, price: price.round().toString(), currency: currentCurrency,);
        cryptoBlocks.add(cryptoBlock);
      } else {
        var cryptoBlock = CryptoBlock(cryptoName: crypto, price: 'Unable to get data', currency: '',);
        cryptoBlocks.add(cryptoBlock);
      }
    };
    return cryptoBlocks;
  }
}
