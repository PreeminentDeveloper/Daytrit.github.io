// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// class LoginWithFacebookViewModel extends ChangeNotifier {
//   bool _loading = false;
//   AccessToken? _accessToken;
//   bool _checking = true;
//   Map<String, dynamic>? _userData;

//   bool get loading => _loading;
//   bool get checking => _checking;
//   Map<String, dynamic>? get userData => _userData;

//   String prettyPrint(Map json) {
//     JsonEncoder encoder = const JsonEncoder.withIndent('  ');
//     String pretty = encoder.convert(json);
//     return pretty;
//   }

//   LoginWithFacebookViewModel();

//   setChecking(bool checking) {
//     _checking = checking;
//     notifyListeners();
//   }

//   setUserData(userData) {
//     _userData = userData;
//     notifyListeners();
//   }

//   setLoading(bool loading) {
//     _loading = loading;
//     notifyListeners();
//     print("Loading is $_loading");
//   }

//   Future<void> checkIfIsLogged() async {
//     setLoading(true);
//     print("Delay started...");
//     Future.delayed(const Duration(seconds: 5), () async {
//       final accessToken = await FacebookAuth.instance.accessToken;
//       setChecking(false);
//       if (accessToken != null) {
//         print("is Logged:::: ${prettyPrint(accessToken.toJson())}");
//         // now you can call to  FacebookAuth.instance.getUserData();
//         final userData = await FacebookAuth.instance.getUserData();
//         // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
//         _accessToken = accessToken;
//         setUserData(userData);
//       }
//       _userData != null ? _logOut() : _login();
//       setLoading(false);
//     });
//   }

//   void _printCredentials() {
//     print(
//       prettyPrint(_accessToken!.toJson()),
//     );
//   }

//   Future<void> _login() async {
//     print("logging in...");
//     final LoginResult result = await FacebookAuth.instance
//         .login(); // by default we request the email and the public profile

//     // loginBehavior is only supported for Android devices, for ios it will be ignored
//     // final result = await FacebookAuth.instance.login(
//     //   permissions: ['email', 'public_profile', 'user_birthday', 'user_friends', 'user_gender', 'user_link'],
//     //   loginBehavior: LoginBehavior
//     //       .DIALOG_ONLY, // (only android) show an authentication dialog instead of redirecting to facebook app
//     // );

//     if (result.status == LoginStatus.success) {
//       _accessToken = result.accessToken;
//       _printCredentials();
//       // get the user data
//       // by default we get the userId, email,name and picture
//       final userData = await FacebookAuth.instance.getUserData();
//       // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
//       _userData = userData;
//     } else {
//       print(result.status);
//       print(result.message);
//     }

//     setChecking(false);
//   }

//   Future<void> _logOut() async {
//     print("logging out...");
//     await FacebookAuth.instance.logOut();
//     _accessToken = null;
//     _userData = null;
//     notifyListeners();
//   }
// }
