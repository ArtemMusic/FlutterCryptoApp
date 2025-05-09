part of 'crypto_list_bloc.dart';

abstract class CryptoListBlocEvent extends Equatable {}

class LoadCryptoList extends CryptoListBlocEvent {
  LoadCryptoList({this.completer});
  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
