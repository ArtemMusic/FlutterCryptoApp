import 'package:crypto_app/features/crypto_list/widgets/crypto_coin_tile.dart';
import 'package:crypto_app/repositories/crypro_coins/crypto_coins.dart';
import 'package:crypto_app/theme/theme.dart';
import 'package:crypto_app/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  bool _isDarkMode = false;
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto list'),
        actions: [
          Row(
            children: [
              const Icon(Icons.light_mode),
              CupertinoSwitch(
                value: _isDarkMode,
                onChanged:
                    (value) => {
                      setState(() {
                        Provider.of<ThemeProvider>(
                          context,
                          listen: false,
                        ).toggleTheme(lightMode);
                        _isDarkMode = value;
                      }),
                    },
              ),
              const Icon(Icons.dark_mode),
            ],
          ),
        ],
      ),

      body:
          _cryptoCoinsList == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                itemCount: _cryptoCoinsList!.length,
                itemBuilder: (context, i) {
                  final coin = _cryptoCoinsList![i];

                  return CryptoCoinTile(coin: coin);
                },
                separatorBuilder: (context, i) => const Divider(),
              ),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList = await GetIt.I<CryptoCoinsRepository>().getCoinsList();
    setState(() {});
  }
}
