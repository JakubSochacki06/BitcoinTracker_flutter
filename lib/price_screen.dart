import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'crypto_block.dart';
import 'crypto_data.dart';
import 'loading_screen.dart';

class PriceScreen extends StatefulWidget {
  PriceScreen({required this.cryptoBlocks});
  final cryptoBlocks;
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String selectedCurrency = 'USD';
  List<Widget> updatedList = [];

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }


    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) async{
        CryptoData cryptoData = CryptoData(value!);
        List<Widget> TrueCryptoBlocks = await cryptoData.getCryptoBlocks();
        print(TrueCryptoBlocks);
        print(selectedCurrency);
        setState(() {
          print('setstate');
          selectedCurrency = value;
          print(selectedCurrency);
          updatedList = TrueCryptoBlocks;
        });
      },
    );
  }

  CupertinoPicker iOSPicker(){

    List<Widget> pickerItems = [];
    for (String currency in currenciesList) {
      var currencyText = Text(currency);
      pickerItems.add(currencyText);
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItems,
    );
  }

  List<Widget> buildUI() {
    List<Widget> updatedList = widget.cryptoBlocks;
    return updatedList;
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> oldList = buildUI();
    print('build');
    print(updatedList.isEmpty);
    print(oldList);
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: updatedList.isEmpty? oldList : updatedList,
          ),
          Container(
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
          ),
        ],
      ),
    );
  }
}

