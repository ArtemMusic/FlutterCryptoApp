import 'dart:async';

import 'package:crypto_app/repositories/crypro_coins/crypto_coins.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_list_state.dart';
part 'crypto_list_event.dart';

class CryptoListBloc extends Bloc<CryptoListBlocEvent, CryptoListBlocState> {
  CryptoListBloc(this.cryptoRepository) : super(CryptoListBlocInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        if (state is! CryptoListLoaded) {
          emit(CryptoListLoading());
        }
        final coinsList = await cryptoRepository.getCoinsList();
        emit(CryptoListLoaded(coinsList: coinsList));
      } catch (e) {
        emit(CryptoListLoadingFailure(exeption: e));
      } finally {
        event.completer?.complete();
      }
    });
  }

  final CryptoCoinsRepository cryptoRepository;
}
