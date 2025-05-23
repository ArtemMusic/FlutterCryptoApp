part of 'crypto_coin_bloc.dart';

abstract class CryptoCoinState extends Equatable {}

class CryptoCoinInitial extends CryptoCoinState {
  @override
  List<Object?> get props => [];
}

class CryptoCoinLoading extends CryptoCoinState {
  @override
  List<Object?> get props => [];
}

class CryptoCoinLoaded extends CryptoCoinState {
  CryptoCoinLoaded({required this.coin});
  final CryptoCoin coin;

  @override
  List<Object?> get props => [coin];
}

class CryptoCoinLoadingFailure extends CryptoCoinState {
  CryptoCoinLoadingFailure({this.exeption});
  final Object? exeption;

  @override
  List<Object?> get props => [exeption];
}
