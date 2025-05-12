import 'package:crypto_app/features/crypto_coin/bloc/crypto_coin_bloc.dart';
import 'package:crypto_app/features/crypto_coin/view/crypto_coin_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  @override
  Widget build(BuildContext context) {
    final String coinName =
        ModalRoute.of(context)?.settings.arguments as String;

    return BlocProvider<CryptoCoinBloc>(
      create:
          (context) =>
              GetIt.I<CryptoCoinBloc>(param1: coinName)..add(LoadCryptoCoin()),
      child: const CryptoCoinScreenContent(),
    );
  }
}
