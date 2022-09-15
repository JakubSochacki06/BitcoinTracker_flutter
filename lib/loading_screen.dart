import 'package:bitcoin_tracker_github/price_screen.dart';
import 'package:flutter/material.dart';
import 'crypto_data.dart';
import 'crypto_block.dart';
import 'package:bitcoin_tracker_github/price_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();

}

class _LoadingScreenState extends State<LoadingScreen> {
  List<Widget> TrueCryptoBlocks = [];
  String selectedCurrency = 'USD';

  @override
  void initState() {
    assignCryptoBlocks(selectedCurrency);
    super.initState();
  }

  void assignCryptoBlocks(selectedCurrency) async {
    CryptoData cryptoData = CryptoData(selectedCurrency);
    TrueCryptoBlocks = await cryptoData.getCryptoBlocks();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PriceScreen(
            cryptoBlocks: TrueCryptoBlocks,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCircle(
        size: 100,
        color: Colors.white,
      ),
    );
  }
}
