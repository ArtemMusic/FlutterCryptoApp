import 'package:crypto_app/repositories/crypro_coins/crypto_coins.dart';
import 'package:flutter/material.dart';

class CryptoCoinInfoBlock extends StatelessWidget {
  const CryptoCoinInfoBlock({
    super.key,
    required this.coin,
    required this.periodHours,
  });
  final CryptoCoin coin;
  final int periodHours;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  periodHours == 1
                      ? [
                        const Text('Hight 1 Hour'),
                        Text('${coin.highHour} \$'),
                      ]
                      : [
                        const Text('Hight 24 Hour'),
                        Text('${coin.high24Hour} \$'),
                      ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  periodHours == 1
                      ? [const Text('Low 1 Hour'), Text('${coin.lowHour} \$')]
                      : [
                        const Text('Low 24 Hour'),
                        Text('${coin.lowHour}  \$'),
                      ],
            ),
          ],
        ),
      ),
    );
  }
}
