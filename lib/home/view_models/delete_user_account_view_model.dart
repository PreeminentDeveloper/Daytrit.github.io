import 'package:daytrit/authentication/components/flushbar/custom_flush_bar.dart';
import 'package:daytrit/home/repo/api_status.dart';
import 'package:daytrit/home/view_models/delete_account_view_model.dart';
import 'package:daytrit/home/view_models/userprofile_view_model.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteUserAccountViewModel extends ChangeNotifier {
  final CustomFlushBar customFlushBar = CustomFlushBar();

  void deleteAccount(BuildContext context) async {
    final deleteAccountViewModel =
        Provider.of<DeleteAccountViewModel>(context, listen: false);
    await deleteAccountViewModel.deleteAccount();

    Object? errorMessage = deleteAccountViewModel.deleteAccountFailure?.message;
    print("ERROR MESSAGE: $errorMessage");
    if (errorMessage != null) {
      print("Error deleting account");
    } else {
      String? successMessage =
          deleteAccountViewModel.deleteAccountResponse?.message;
      print("SUCCESS: $successMessage");
      customFlushBar.showSuccessFlushBar(
          title: 'Success',
          body: "Your account has successfully been deleted.",
          context: context);
      final profileViewModel =
          Provider.of<ProfileViewModel>(context, listen: false);
      print("Email: ${profileViewModel.userData!.email}");
      var data = await profileViewModel.logOut();
      print("Logout data: $data");
      if (data == true) {
        openLoginScreen(context);
      }
    }
    clearAuthErrorMessage(deleteAccountViewModel);
  }

  clearAuthErrorMessage(deleteAccountViewModel) {
    DeleteAccountFailure deleteAccountFailure =
        DeleteAccountFailure(message: null);
    deleteAccountViewModel.setDeleteAccountFailure(deleteAccountFailure);
    deleteAccountViewModel.deleteAccountResponse;
  }
}
