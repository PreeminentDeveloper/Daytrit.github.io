class ApiResponse {
  String? message;
}

class Success extends ApiResponse {
  Object? data;
  @override
  String? message;
  Success({this.data, this.message});
}

class VendorSuccess extends ApiResponse {
  Map<String, dynamic>? data;
  @override
  String? message;
  VendorSuccess({this.data, this.message});
}

class SignUpFailure {
  String? message;
  Object? errors;
  SignUpFailure({this.message, this.errors});
}

class VerifyEmailFailure {
  String? message;
  VerifyEmailFailure({this.message});
}

class EditProfileFailure {
  String? message;
  EditProfileFailure({this.message});
}

class AddTravelVendorFailure {
  String? message;
  AddTravelVendorFailure({this.message});
}

class PurchaseCoinFailure {
  String? message;
  PurchaseCoinFailure({this.message});
}

class LoginFailure {
  String? message;
  LoginFailure({this.message});
}

class ForgotPasswordFailure {
  String? message;
  ForgotPasswordFailure({this.message});
}

class NewPasswordFailure {
  String? message;
  NewPasswordFailure({this.message});
}

class EarnCoinFailure {
  String? message;
  EarnCoinFailure({this.message});
}

class VendorFetchFailure extends ApiResponse {
  @override
  String? message;
  VendorFetchFailure({this.message});
}

class NotifcationFetchFailure extends ApiResponse {
  @override
  String? message;
  NotifcationFetchFailure({this.message});
}

class StatusFetchFailure extends ApiResponse {
  @override
  String? message;
  StatusFetchFailure({this.message});
}

class TransactionFetchFailure extends ApiResponse {
  @override
  String? message;
  TransactionFetchFailure({this.message});
}
