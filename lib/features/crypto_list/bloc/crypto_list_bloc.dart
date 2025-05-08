import 'package:crypto_app/repositories/crypro_coins/crypto_coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_list_state.dart';
part 'crypto_list_event.dart';

class CryptoListBloc extends Bloc<CryptoListBlocEvent, CryptoListBlocState> {
  CryptoListBloc(this.cryptoRepository) : super(CryptoListBlocInitial()) {
    on<CryptoListLoading>((event, emit) async {
      try {
        final coinsList = await cryptoRepository.getCoinsList();
        emit(CryptoListLoaded(coinsList: coinsList));
      } catch (e) {
        emit(CryptoListLoadingFailure(exeption: e));
      }
    });
  }

  final CryptoCoinsRepository cryptoRepository;
}
