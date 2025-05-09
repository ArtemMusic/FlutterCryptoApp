part of 'crypto_list_bloc.dart';

abstract class CryptoListBlocState extends Equatable {}

class CryptoListBlocInitial extends CryptoListBlocState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoListBlocState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoaded extends CryptoListBlocState {
  CryptoListLoaded({required this.coinsList});
  final List<CryptoCoin> coinsList;

  @override
  List<Object?> get props => [coinsList];
}

class CryptoListLoadingFailure extends CryptoListBlocState {
  CryptoListLoadingFailure({this.exeption});
  final Object? exeption;

  @override
  List<Object?> get props => [exeption];
}
