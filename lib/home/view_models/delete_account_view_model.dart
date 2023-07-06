import 'package:daytrit/home/models/dataModel/delete_account_response.dart';
import 'package:daytrit/home/repo/delete_account_service.dart';
import 'package:flutter/material.dart';
import '../repo/api_status.dart';

class DeleteAccountViewModel extends ChangeNotifier {
  bool _loading = false;
  DeleteAccountFailure? _deleteAccountFailure;
  DeleteAccountResponse? _deleteAccountResponse;

  bool get loading => _loading;
  DeleteAccountFailure? get deleteAccountFailure => _deleteAccountFailure;
  DeleteAccountResponse? get deleteAccountResponse => _deleteAccountResponse;

  DeleteAccountViewModel();

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setDeleteAccountFailure(DeleteAccountFailure deleteAccountFailure) =>
      _deleteAccountFailure = deleteAccountFailure;

  setDeleteAccountResponse(dynamic deleteAccountResponse) =>
      _deleteAccountResponse = deleteAccountResponse;

  deleteAccount() async {
    setLoading(true);
    var response = await DeleteAccountService.deleteAccount();
    if (response is Success) {
      print("success deleting account...");
      setDeleteAccountResponse(response.data);
    }
    if (response is DeleteAccountFailure) {
      print("failed deleting account...${response.message}");
      DeleteAccountFailure authError =
          DeleteAccountFailure(message: response.message);
      setDeleteAccountFailure(authError);
    }
    setLoading(false);
  }
}
