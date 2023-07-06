import 'package:daytrit/home/models/dataModel/userPofile_response.dart';

class Success {
  Object? data;
  String? message;
  Success({this.data, this.message});
}

class UserProfileFailure extends ProfileState {
  String? message;
  UserProfileFailure({this.message});
}

class NotificationFailure extends ProfileState {
  String? message;
  NotificationFailure({this.message});
}

class HomeScreenDataFailure extends ProfileState {
  String? message;
  Object? errors;
  HomeScreenDataFailure({this.message, this.errors});
}

class ExploreFailure {
  String? message;
  ExploreFailure({this.message});
}

class EarnCoinFailure extends ProfileState {
  String? message;
  Object? errors;
  EarnCoinFailure({this.message, this.errors});
}

class DeleteAccountFailure extends ProfileState {
  String? message;
  Object? errors;
  DeleteAccountFailure({this.message, this.errors});
}

class UserProfileSuccess extends ProfileState {
  UserData data;
  UserProfileSuccess(this.data);
}

// class NotificationSuccess extends ProfileState {
//   NotificationData data;
//   NotificationSuccess(this.data);
// }

class LogOutFailure {
  String? message;
  LogOutFailure({this.message});
}

abstract class ProfileState {}
