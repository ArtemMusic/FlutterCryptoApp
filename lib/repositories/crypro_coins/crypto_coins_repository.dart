import 'package:crypto_app/repositories/crypro_coins/crypto_coins.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository {
  const CryptoCoinsRepository({required this.dio});
  final Dio dio;
  // BTC,ETH,BNB,TRX,SOL etc.
  // PRICE LOWHOUR HIGHHOUR HIGH24HOUR LOW24HOUR IMAGEURL CHANGEPCT24HOUR

  Future<List<CryptoCoin>> getCoinsList() async {
    final request = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,TRX,SOL}&tsyms=USD',
    );
    return _sendRequest(request);
  }

  Future<List<CryptoCoin>> getCoinByName(String coinName) async {
    final request = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$coinName&tsyms=USD',
    );
    return _sendRequest(request);
  }

  Future<List<CryptoCoin>> _sendRequest(Response<dynamic> response) async {
    final responseData = response.data as Map<String, dynamic>;
    final dataRaw = responseData['RAW'] as Map<String, dynamic>;
    final data =
        dataRaw.entries.map((e) {
          final usdData =
              (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
          return CryptoCoin(
            title: e.key,
            priceInUsd: usdData['PRICE'].toString().substring(0, 10),
            lowHour: usdData['LOWHOUR'].toString().substring(0, 8),
            highHour: usdData['HIGHHOUR'].toString().substring(0, 8),
            high24Hour: usdData['HIGH24HOUR'].toString().substring(0, 8),
            low24Hour: usdData['LOW24HOUR'].toString().substring(0, 8),
            changePct24Hour: usdData['CHANGEPCT24HOUR'].toString().substring(
              0,
              5,
            ),
            imageUrl: 'https://cryptocompare.com/${usdData['IMAGEURL']}',
          );
        }).toList();

    return data;
  }
}
