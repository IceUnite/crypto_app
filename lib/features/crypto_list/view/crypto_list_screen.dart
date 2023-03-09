import 'package:crypto_app/features/crypto_list/widgets/widgets.dart';
import 'package:crypto_app/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:crypto_app/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:flutter/material.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto app'),
      ),
      body: (_cryptoCoinList == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              padding: EdgeInsets.only(top: 16),
              itemCount: _cryptoCoinList!.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final coin = _cryptoCoinList!;
                return CryptoCoinTile(
                  coin: coin[index],
                );
              },
            ),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinList = await CryptoCoinsRepository().getCoinsList();
    setState(() {});
  }
}
