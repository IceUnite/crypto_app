import 'package:crypto_app/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Text(
        coin.name.toString(),
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '${coin.priceInUSD.toString()} \$',
        style: theme.textTheme.labelSmall,
      ),
      leading: Image.network(
        coin.imageUrl,
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: coin.name,
        );
      },
    );
  }
}
