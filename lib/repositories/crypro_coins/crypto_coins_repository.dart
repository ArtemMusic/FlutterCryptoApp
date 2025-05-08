import 'package:crypto_app/repositories/crypro_coins/crypto_coins.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository {
  const CryptoCoinsRepository({required this.dio});
  final Dio dio;

  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,TRX,SOL&tsyms=USD',
    );

    final responseData = response.data as Map<String, dynamic>;
    final dataRaw = responseData['RAW'] as Map<String, dynamic>;
    final data =
        dataRaw.entries.map((e) {
          final usdData =
              (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
          return CryptoCoin(
            title: e.key,
            priceInUsd: usdData['PRICE'].toString().substring(0, 10),
            imageUrl: 'https://cryptocompare.com/${usdData['IMAGEURL']}',
          );
        }).toList();
    return data;
  }
}
