import 'package:flutter/material.dart';

import 'btc_price_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bitcoin Price',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Real-Time Bitcoin Price Widget'),
        ),
        body: Center(
          child: BitcoinPriceWidget(),
        ),
      ),
    );
  }
}
