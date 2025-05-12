import 'dart:async';

import 'package:crypto_app/features/crypto_coin/bloc/crypto_coin_bloc.dart';
import 'package:crypto_app/features/crypto_coin/widgets/crypto_coin_info_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoCoinScreenContent extends StatefulWidget {
  const CryptoCoinScreenContent({super.key});

  @override
  State<CryptoCoinScreenContent> createState() =>
      _CryptoCoinScreenContentState();
}

class _CryptoCoinScreenContentState extends State<CryptoCoinScreenContent> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          context.read<CryptoCoinBloc>().add(
            LoadCryptoCoin(completer: completer),
          );
          return completer.future;
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 25, bottom: 25, left: 25),
          child: BlocBuilder<CryptoCoinBloc, CryptoCoinState>(
            builder: (context, state) {
              if (state is CryptoCoinLoaded) {
                final coin = state.coin;
                return CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.network(coin.imageUrl, height: 150),
                          const SizedBox(height: 20),
                          Text(
                            coin.title,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyLarge,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(bottom: 15, top: 20),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '${coin.priceInUsd} \$',
                                  style: theme.textTheme.bodyLarge,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '${coin.changePct24Hour} %',
                                  style: TextStyle(
                                    color:
                                        coin.changePct24Hour.startsWith('-')
                                            ? Colors.red
                                            : Colors.green.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CryptoCoinInfoBlock(periodHours: 1, coin: coin),
                          CryptoCoinInfoBlock(periodHours: 24, coin: coin),
                        ],
                      ),
                    ),
                  ],
                );
              }

              if (state is CryptoCoinLoadingFailure) {
                return Center(
                  child: Text(
                    'Ошибка: ${state.exeption}',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
