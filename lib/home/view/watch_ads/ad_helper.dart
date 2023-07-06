import 'dart:io';

class AdHelper {
  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-1292788792984527/3257625674"; // live android ad unit
      // return "ca-app-pub-3940256099942544/5224354917"; // test android add unit
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313"; // live ios ad unit
      // return "ca-app-pub-3940256099942544/1712485313"; // test ios ad unit
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
