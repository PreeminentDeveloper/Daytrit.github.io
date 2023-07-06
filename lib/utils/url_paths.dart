// baseUrl
const String baseUrl = "https://daytrit.net/api/v1";

const String appLovinSdkKey =
    "hHRwoVvuExeTBXXIX1qsEBuaaKm49rC5dTkGK0lltyg1uAASSCEQ0qlNHKHrqp9LkZhpU44C2KU8CWbgN1g2GT";

//enpoints
class AuthenticationUrls {
  static const String register = "/register";
  static const String login = "/login";
  static const String forgotPassword = "/forgot/password";
  static const String validateEmail = "/forgot/password/validate/otp";
  static const String newPassword = "/reset/password";
  static const String loginWithSocial =
      "/login/social/valid/login/valid/letslogin/social";
  static const String profile = "/user/profile";
  static const String logout = "/logout";
  static const String verifyEmail = "/verify_email";
  static const String fetchHomeData = "/user/vendors";
  static const String uploadImage = "/user/profile/photo";
}

class DeleteAccountUrl {
  static const String deleteAccount = "/user/delete/user";
}

class CoinUrls {
  static const String earnCoin = "/user/coin";
  static const String fetchCoin = "/user/mycoin";
  static const String purchaseCoin = '/user/coin/purchase';
}

class ExploreUrls {
  static const String explore = "/user/explore";
  static const String search_explore = "/user/explore/search";
}

class VendorUrls {
  static const String vendorList = "/user/vendors";
  static const String checkout = "/user/order";
}

class NotificationUrls {
  static const String notification = "/user/notifications";
}
