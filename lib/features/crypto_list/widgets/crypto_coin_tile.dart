import 'package:crypto_app/repositories/crypro_coins/crypto_coins.dart';
import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({super.key, required this.coin});
  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      title: Text(coin.title, style: theme.textTheme.bodyMedium),
      subtitle: Text(
        '${coin.priceInUsd} \$',
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      leading: Image.network(coin.imageUrl),
      onTap:
          () => Navigator.of(
            context,
          ).pushNamed('/current_crypto', arguments: coin.title),
    );
  }
}
