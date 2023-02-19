import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BitcoinPriceWidget extends StatefulWidget {
  const BitcoinPriceWidget({Key? key}) : super(key: key);

  @override
  _BitcoinPriceWidgetState createState() => _BitcoinPriceWidgetState();
}

class _BitcoinPriceWidgetState extends State<BitcoinPriceWidget> {
  late Stream<double> _stream;
  late double _currentPrice;

  Stream<double> getBitcoinPriceStream() async* {
    while (true) {
      final response = await http.get(Uri.parse(
          'https://api.binance.com/api/v3/ticker/price?symbol=BTCUSDT'));
      final data = jsonDecode(response.body);
      final price = double.parse(data['price']);
      yield price;
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  void initState() {
    super.initState();
    _stream = getBitcoinPriceStream();
    _currentPrice = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: _stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _currentPrice = snapshot.data!;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'BTCUSDT',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '\$${_currentPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}
