// To parse this JSON data, do
//
//     final googleSignInModel = googleSignInModelFromJson(jsonString);

import 'dart:convert';

GoogleSignInModel googleSignInModelFromJson(String str) =>
    GoogleSignInModel.fromJson(json.decode(str));

String googleSignInModelToJson(GoogleSignInModel data) =>
    json.encode(data.toJson());

class GoogleSignInModel {
  GoogleSignInModel({
    this.googleSignInAccount,
  });

  GoogleSignInAccountModel? googleSignInAccount;

  factory GoogleSignInModel.fromJson(Map<String, dynamic> json) =>
      GoogleSignInModel(
        googleSignInAccount:
            GoogleSignInAccountModel.fromJson(json["GoogleSignInAccount"]),
      );

  Map<String, dynamic> toJson() => {
        "GoogleSignInAccount": googleSignInAccount!.toJson(),
      };
}

class GoogleSignInAccountModel {
  GoogleSignInAccountModel({
    this.displayName,
    this.email,
    this.id,
    this.photoUrl,
    this.serverAuthCode,
  });

  String? displayName;
  String? email;
  String? id;
  String? photoUrl;
  dynamic serverAuthCode;

  factory GoogleSignInAccountModel.fromJson(Map<String, dynamic> json) =>
      GoogleSignInAccountModel(
        displayName: json["displayName"],
        email: json["email"],
        id: json["id"],
        photoUrl: json["photoUrl"],
        serverAuthCode: json["serverAuthCode"],
      );

  Map<String, dynamic> toJson() => {
        "displayName": displayName,
        "email": email,
        "id": id,
        "photoUrl": photoUrl,
        "serverAuthCode": serverAuthCode,
      };
}
