import '../../utils/network_handler.dart';
import '../../utils/url_paths.dart';
import '../models/dataModel/logout_response.dart';

class LogOutService {
  NetworkHandler networkHandler = NetworkHandler();

  Future<LogOutResponse> logOut({
    required String email,
  }) async{
    Map<String, dynamic> data = {
      'email' : email,
    };
    print('email is $data');
    var response = await networkHandler.postWithToken(AuthenticationUrls.logout, data);
    LogOutResponse res = logOutResponseFromMap(response.body);
    return res;
  }
}