import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.title,
    required this.priceInUsd,
    required this.imageUrl,
    required this.lowHour,
    required this.highHour,
    required this.high24Hour,
    required this.low24Hour,
    required this.changePct24Hour,
  });

  final String title;
  final String priceInUsd;
  final String imageUrl;
  final String lowHour;
  final String highHour;
  final String high24Hour;
  final String low24Hour;
  final String changePct24Hour;

  @override
  List<Object?> get props => [
    title,
    priceInUsd,
    imageUrl,
    lowHour,
    highHour,
    high24Hour,
    low24Hour,
    changePct24Hour,
  ];
}
