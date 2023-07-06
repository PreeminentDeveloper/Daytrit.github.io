// import 'dart:convert';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// import '../../authentication/models/data_model/login_model.dart';
//
//
//
// class UserInfoCache{
//
//   LoginModel? _loginModel;
//
//   LoginModel? get user => _loginModel;
//
//
//   getUserDataFromStorage() async{
//     try{
//       final storage =  FlutterSecureStorage();
//       var data =
//       await storage.write(key:"user_data", value: token);
//     }
//   }
//
// }