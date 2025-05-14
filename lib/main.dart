import 'package:crypto_app/crypto_app.dart';
import 'package:crypto_app/features/crypto_coin/bloc/crypto_coin_bloc.dart';
import 'package:crypto_app/repositories/crypro_coins/crypto_coins_repository.dart';
import 'package:crypto_app/theme/theme_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I.registerLazySingleton(() => CryptoCoinsRepository(dio: Dio()));

  GetIt.I.registerFactoryParam<CryptoCoinBloc, String, void>((coinName, _) {
    return CryptoCoinBloc(GetIt.I<CryptoCoinsRepository>(), coinName);
  });

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const CryptoApp(),
    ),
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
