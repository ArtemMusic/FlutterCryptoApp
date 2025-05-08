import 'package:crypto_app/crypto_app.dart';
import 'package:crypto_app/repositories/crypro_coins/crypto_coins_repository.dart';
import 'package:crypto_app/theme/theme_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() {
  GetIt.I.registerLazySingleton(() => CryptoCoinsRepository(dio: Dio()));

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const CryptoApp(),
    ),
  );
}
