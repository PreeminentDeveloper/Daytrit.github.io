import 'package:daytrit/utils/url_paths.dart';
import '../../utils/network_handler.dart';

class FetchCoinService {
  NetworkHandler networkHandler = NetworkHandler();

  static getUserCoin() async {
    NetworkHandler networkHandler = NetworkHandler();
    var response = await networkHandler.getWithToken(CoinUrls.fetchCoin);
    print("COIN RESPONSE: $response");
    return response;
  }
}
