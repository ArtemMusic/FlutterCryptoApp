import '../features/crypto_coin/crypto_coin.dart';
import '../features/crypto_list/crypto_list.dart';

final routers = {
  '/': (context) => const CryptoListScreen(),
  '/current_crypto': (context) => const CryptoCoinScreen(),
};
