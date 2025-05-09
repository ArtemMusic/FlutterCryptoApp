import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.title,
    required this.priceInUsd,
    required this.imageUrl,
  });

  final String title;
  final String priceInUsd;
  final String imageUrl;

  @override
  List<Object?> get props => [title, priceInUsd, imageUrl];
}
