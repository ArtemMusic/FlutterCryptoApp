import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_app/repositories/crypro_coins/crypto_coins.dart';

part 'crypto_coin_event.dart';
part 'crypto_coin_state.dart';

class CryptoCoinBloc extends Bloc<CryptoCoinEvent, CryptoCoinState> {
  CryptoCoinBloc(this.cryptoRepository, this.coinName)
    : super(CryptoCoinInitial()) {
    on<LoadCryptoCoin>((event, emit) async {
      try {
        if (state is! CryptoCoinLoaded) {
          emit(CryptoCoinLoading());
        }
        final coin = await cryptoRepository.getCoinByName(coinName);
        emit(CryptoCoinLoaded(coin: coin.first));
      } catch (e) {
        emit(CryptoCoinLoadingFailure(exeption: e));
      } finally {
        event.completer?.complete();
      }
    });
  }

  final CryptoCoinsRepository cryptoRepository;
  final String coinName;
}
