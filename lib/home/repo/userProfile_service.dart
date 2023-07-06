import 'package:daytrit/utils/url_paths.dart';
import '../../utils/network_handler.dart';
import '../models/dataModel/userPofile_response.dart';

class UserProfileService {
  NetworkHandler networkHandler = NetworkHandler();

  static getUserDetails() async {
    NetworkHandler networkHandler = NetworkHandler();
    var responseBody =
        await networkHandler.getWithToken(AuthenticationUrls.profile);
    UserProfileResponse response = UserProfileResponse.fromMap(responseBody);
    return response;
  }
}




// static logOutUser(Map<String, dynamic> data) async {
//   NetworkHandler networkHandler = NetworkHandler();
//   Map<String, dynamic>? decodedData;
//   var responseBody = await networkHandler.postWithToken(AuthenticationUrls.profile, data);
//   LogOutResponse response = LogOutResponse.fromMap(responseBody);
//   return response;
// }