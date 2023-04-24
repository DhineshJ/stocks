import 'package:flutter/material.dart';

import '../models/stocks.dart';

class StockDetails extends StatelessWidget {
  const StockDetails({super.key, required this.datum});

  final Datum datum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: const Text('Stock Details'), backgroundColor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                WhiteText(datum: datum.symbol, fontSize: 24),
                const Spacer(),
                WhiteText(datum: "SS - ${datum.symbol}"),
              ],
            ),
            WhiteText(datum: "Type -  ${datum.type}"),
            WhiteText(datum: "Openings - ${datum.open}"),
            Row(
              children: [
                WhiteText(datum: "Highest -  ${datum.high}"),
                const Spacer(),
                WhiteText(datum: "Lowest -  ${datum.low}"),
              ],
            ),
            WhiteText(datum: "Holdings - ${datum.holdings}"),
            WhiteText(datum: "Exchange -  ${datum.exchange}"),
            WhiteText(datum: "LTP -  ${datum.ltp}"),
            WhiteText(datum: "Previous Close -  ${datum.previousClose}"),
            WhiteText(datum: "Trade Volume -  ${datum.trdVol}"),
          ],
        ),
      ),
    );
  }
}

class WhiteText extends StatelessWidget {
  const WhiteText({
    super.key,
    required this.datum,
    this.fontSize = 16,
  });

  final String datum;
  final double fontSize;
 
  @override
  Widget build(BuildContext context) {
    return Text(datum,
        style: TextStyle(color: Colors.white, fontSize: fontSize));
  }
}
