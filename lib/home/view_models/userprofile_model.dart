import 'package:daytrit/home/view_models/userprofile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../authentication/components/flushbar/custom_flush_bar.dart';

class ProfileModel {
  var log = Logger();

  final CustomFlushBar customFlushBar = CustomFlushBar();

  void fetchUserDetails(BuildContext context) async {
    final userViewModel = Provider.of<ProfileViewModel>(context, listen: false);
    await userViewModel.getUserProfile();

    if (userViewModel.userProfileFailure != null) {
      Object? message = userViewModel.userProfileFailure!.message;
      if (message != null) {
        customFlushBar.showErrorFlushBar(
            title: 'Error occurred', body: message, context: context);
      } else {
        String? message = userViewModel.userProfileFailure!.message;

        customFlushBar.showSuccessFlushBar(
            title: 'Success', body: message, context: context);
      }
    }
  }
}
