part of 'crypto_list_bloc.dart';

class CryptoListBlocState {}

class CryptoListBlocInitial extends CryptoListBlocState {}

class CryptoListLoading extends CryptoListBlocState {}

class CryptoListLoaded extends CryptoListBlocState {
  CryptoListLoaded({required this.coinsList});
  final List<CryptoCoin> coinsList;
}

class CryptoListLoadingFailure extends CryptoListBlocState {
  CryptoListLoadingFailure({this.exeption});
  final Object? exeption;
}
