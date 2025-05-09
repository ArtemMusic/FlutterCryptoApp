part of 'crypto_list_bloc.dart';

class CryptoListBlocEvent {}

class LoadCryptoList extends CryptoListBlocEvent {
  LoadCryptoList({this.completer});
  final Completer? completer;
}
