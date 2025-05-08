import 'package:crypto_app/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_app/features/crypto_list/widgets/crypto_coin_tile.dart';
import 'package:crypto_app/repositories/crypro_coins/crypto_coins.dart';
import 'package:crypto_app/theme/theme.dart';
import 'package:crypto_app/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  bool _isDarkMode = false;
  final _cryptoListBloc = CryptoListBloc(GetIt.I<CryptoCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
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

      body: BlocBuilder<CryptoListBloc, CryptoListBlocState>(
        bloc: _cryptoListBloc,
        builder: (context, state) {
          if (state is CryptoListLoaded) {
            return ListView.separated(
              itemCount: state.coinsList.length,
              itemBuilder: (context, i) {
                final coin = state.coinsList[i];
                return CryptoCoinTile(coin: coin);
              },
              separatorBuilder: (context, i) => const Divider(),
            );
          }

          if (state is CryptoListLoadingFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Something went wrong'),
                  const Text(
                    'Please try again later',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextButton(
                      onPressed: () => _cryptoListBloc.add(LoadCryptoList()),
                      child: const Text(
                        'Try again',
                        style: TextStyle(color: Colors.amber),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
