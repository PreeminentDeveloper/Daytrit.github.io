import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static int isOnBoarded = 0;

  static storeToken(accesToken) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: "token", value: accesToken);
  }

  static storeLoggedInUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", true);
  }

  static Future<bool> getLoggedInUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLoggedIn") ?? false;
  }

  static Future<String> getAccessToken() async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: "token") ?? "";
  }

  static Future<bool> logout() async {
    const storage = FlutterSecureStorage();
    final prefs = await SharedPreferences.getInstance();
    storage.delete(key: "token");
    prefs.remove("isLoggedIn");
    // var result = continueWithGoogleLogout();
    // print("RESULT:: $result");
    return true;
  }

  static Future continueWithGoogleLogout() => GoogleSignIn().disconnect();
}
