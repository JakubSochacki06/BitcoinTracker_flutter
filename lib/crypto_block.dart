import 'package:flutter/material.dart';

class CryptoBlock extends StatefulWidget {
  CryptoBlock({required this.cryptoName, required this.price, required this.currency});
  final String cryptoName;
  final String price;
  final String currency;
  @override
  State<CryptoBlock> createState() => _CryptoBlockState();
}

class _CryptoBlockState extends State<CryptoBlock> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            '1 ${widget.cryptoName} = ${widget.price} ${widget.currency}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
