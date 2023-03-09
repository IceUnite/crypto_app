import 'package:crypto_app/features/crypto_list/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Crypto app'),
        ),
        body: ListView.separated(
            itemCount: 15,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              final coinName = 'Bitcoin';
              return CryptoCoinTile(coinName: coinName,);
            }) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
