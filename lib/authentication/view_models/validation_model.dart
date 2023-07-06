import 'dart:io';

import 'package:daytrit/authentication/components/flushbar/custom_flush_bar.dart';
import 'package:daytrit/authentication/models/error_model/auth_error.dart';
import 'package:daytrit/authentication/models/validation_model/validation_item.dart';
import 'package:daytrit/authentication/view_models/edit_profile_view_model.dart.dart';
import 'package:daytrit/authentication/view_models/forgot_password_view_model.dart';
import 'package:daytrit/authentication/view_models/login_view_model.dart';
import 'package:daytrit/authentication/view_models/login_with_google_view_model.dart.dart';
import 'package:daytrit/authentication/view_models/register_view_model.dart';
import 'package:daytrit/authentication/view_models/verify_email_view_model.dart';
import 'package:daytrit/services/auth_service.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'new_password_view_model.dart';

class ValidationModel extends ChangeNotifier {
  var log = Logger();

  ValidationItem _fullName = ValidationItem(null, null);
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);
  ValidationItem _confirmPassword = ValidationItem(null, null);
  dynamic _selectedStatus;
  ValidationItem _phoneNumber = ValidationItem(null, null);
  ValidationItem _referralCode = ValidationItem(null, null);
  ValidationItem _verificationCode = ValidationItem(null, null);

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  String? emailToVerify;

  // Getters
  ValidationItem get fullName => _fullName;
  ValidationItem get email => _email;
  ValidationItem get password => _password;
  ValidationItem get confirmPassword => _confirmPassword;
  dynamic get selectedStatus => _selectedStatus;
  ValidationItem get phoneNumber => _phoneNumber;
  ValidationItem get referralCode => _referralCode;
  ValidationItem get verificationCode => _verificationCode;

  bool get obscurePassword => _obscurePassword;
  bool get obscureConfirmPassword => _obscureConfirmPassword;
  bool get isSignUpValid {
    if (_fullName.value != null &&
        _email.value != null &&
        _password.value != null &&
        _selectedStatus != null &&
        _phoneNumber.value != null) {
      return true;
    } else {
      return false;
    }
  }

  bool get isEditProfileValid {
    if (_fullName.value != null &&
        _selectedStatus != null &&
        _phoneNumber.value != null) {
      return true;
    } else {
      return false;
    }
  }

  bool get isPasswordValid {
    if (_password.value != null && _confirmPassword.value != null) {
      return true;
    } else {
      return false;
    }
  }

  bool get isLoginValid {
    if (_email.value != null && _password.value != null) {
      return true;
    } else {
      return false;
    }
  }

  bool get isEmalValid {
    if (_email.value != null) {
      return true;
    } else {
      return false;
    }
  }

  final CustomFlushBar customFlushBar = CustomFlushBar();

  // Setters
  void setFullName(String value) {
    if (value.length >= 3 && value.contains(" ")) {
      _fullName = ValidationItem(value, null);
    } else {
      _fullName = ValidationItem(null, "Full Name is required");
    }
    notifyListeners();
  }

  void setEmail(String value) {
    final emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (emailRegExp.hasMatch(value.trim())) {
      _email = ValidationItem(value, null);
      emailToVerify = value;
    } else {
      _email = ValidationItem(null, "Enter a valid email address");
    }
    notifyListeners();
  }

  void setPassword(String value) {
    if (value.length >= 8) {
      _password = ValidationItem(value, null);
    } else {
      _password =
          ValidationItem(null, "Password must not be less than 8 characters");
    }
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    if (value == password.value) {
      _confirmPassword = ValidationItem(value, null);
    } else {
      _confirmPassword = ValidationItem(null, "Password mismatch");
    }
    notifyListeners();
  }

  void toggleObscurePassword(bool obscurePassword) {
    _obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void toggleObscureConfirmPassword(bool obscureConfirmPassword) {
    _obscureConfirmPassword = !obscureConfirmPassword;
    notifyListeners();
  }

  void setLocation(String value) {
    _selectedStatus = value;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    final phoneNumberRegExp = RegExp(
        r'^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{7})$');
    if (phoneNumberRegExp.hasMatch(value.trim())) {
      _phoneNumber = ValidationItem(value, null);
    } else {
      _phoneNumber = ValidationItem(null, "Enter a valid phone number");
    }
    notifyListeners();
  }

  void setReferralCode(String value) {
    if (value.length >= 6) {
      _referralCode = ValidationItem(value, null);
    } else {
      _referralCode = ValidationItem(null, "Enter a valid referral code");
    }
    notifyListeners();
  }

  void setVerification(String value) {
    if (value.length != 6) {
      _verificationCode =
          ValidationItem(null, "*Please fill up all the cells properly");
    } else {
      _verificationCode = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void submitSignUpData(BuildContext context) async {
    var data = {
      "name": fullName.value,
      "email": email.value,
      "password": password.value,
      "location": selectedStatus,
      "phone": phoneNumber.value,
      "referral_code": referralCode.value
    };
    print(data);
    final registerViewModel =
        Provider.of<RegisterViewModel>(context, listen: false);
    await registerViewModel.registerUser(data);
    Object? errorMessage = registerViewModel.authError?.message;
    print("AUTH ERROR MESSAGE: $errorMessage");
    if (errorMessage != null) {
      customFlushBar.showErrorFlushBar(
          title: 'Error occurred', body: errorMessage, context: context);
    } else {
      String? successMessage = registerViewModel.registerModel!.message;
      print("SIGNUP MESSAGE: $successMessage");

      modalBottomSheetMenu(context,
          message: successMessage!,
          buttonName: "Proceed",
          onPressed: () => openVerificationScreen(context));
      resetSignUpFields();
    }
    clearAuthErrorMessage(registerViewModel);
  }

  void submitEditProfile(BuildContext context) async {
    var data = {
      "name": fullName.value,
      "location": selectedStatus,
      "phone": phoneNumber.value,
    };
    print(data);
    final editProfileViewModel =
        Provider.of<EditProfileViewModel>(context, listen: false);
    await editProfileViewModel.editProfile(data);
    Object? errorMessage = editProfileViewModel.authError?.message;
    print("AUTH ERROR MESSAGE: $errorMessage");
    if (errorMessage != null) {
      print("EDIT PROFILE ERROR: $errorMessage");
      customFlushBar.showErrorFlushBar(
          title: 'Error occurred', body: errorMessage, context: context);
    } else {
      String? successMessage = editProfileViewModel.editProfileModel!.message;
      customFlushBar.showSuccessFlushBar(
          title: 'Success', body: successMessage, context: context);
      print("EDIT PROFILE MESSAGE: $successMessage");
      //openProfileScreen(context);
      //Navigator.pop(context);
      //  String? accesToken = loginViewModel.loginModel!.data!.accessToken;
      // modalBottomSheetMenu(context,
      //     message: successMessage!,
      //     buttonName: "Proceed",
      //     onPressed: () => openVerificationScreen(context));
      resetSignUpFields();
    }
    clearAuthErrorMessage(editProfileViewModel);
  }

  void submitUploadImage(
    BuildContext context,
    File file,
  ) async {
    var data = {"photo": file};
    print(data);
    final editProfileViewModel =
        Provider.of<EditProfileViewModel>(context, listen: false);
    await editProfileViewModel.uploadImage(
      data,
      file,
    );
    Object? errorMessage = editProfileViewModel.authError?.message;
    print("AUTH ERROR MESSAGE: $errorMessage");
    if (errorMessage != null) {
      print("UPLOAD ERROR: $errorMessage");
      customFlushBar.showErrorFlushBar(
          title: 'Error occurred', body: errorMessage, context: context);
    } else {
      String? successMessage = editProfileViewModel.editProfileModel!.message;
      customFlushBar.showSuccessFlushBar(
          title: 'Success', body: successMessage, context: context);
      print("UPLOAD IMAGE: $successMessage");
      openProfileScreen(context);
      //Navigator.pop(context);
      //  String? accesToken = loginViewModel.loginModel!.data!.accessToken;
      // modalBottomSheetMenu(context,
      //     message: successMessage!,
      //     buttonName: "Proceed",
      //     onPressed: () => openVerificationScreen(context));
      resetSignUpFields();
    }
    clearAuthErrorMessage(editProfileViewModel);
  }

  void submitCodeForEmailVerification(BuildContext context,
      {required bool isPasswordResetProcess}) async {
    var signUpProcessPayload = {
      "email": emailToVerify,
      "code": verificationCode.value,
    };
    var passwordResetPayload = {
      "email": emailToVerify,
      "reset_code": verificationCode.value,
    };

    final verifyEmailViewModel =
        Provider.of<VerifyEmailViewModel>(context, listen: false);

    if (isPasswordResetProcess) {
      await verifyEmailViewModel.verifyEmail(passwordResetPayload,
          isPasswordReset: true);
    } else {
      await verifyEmailViewModel.verifyEmail(signUpProcessPayload,
          isPasswordReset: false);
    }

    Object? errorMessage = verifyEmailViewModel.authError?.message;
    String? successMessage;
    if (errorMessage != null) {
      customFlushBar.showErrorFlushBar(
          title: 'Error occurred', body: errorMessage, context: context);
    } else {
      if (isPasswordResetProcess) {
        successMessage = verifyEmailViewModel.validateEmailModel!.message;
        modalBottomSheetMenu(context,
            message: successMessage,
            buttonName: "Proceed",
            onPressed: () => openNewPassword(context));
      } else {
        successMessage = verifyEmailViewModel.verifyEmailModel!.message;
        modalBottomSheetMenu(context,
            message: successMessage!,
            buttonName: "Log In",
            onPressed: () => openLoginScreenWithReplacement(context));
      }
    }
    clearAuthErrorMessage(verifyEmailViewModel);
  }

  void submitLogInData(BuildContext context) async {
    var data = {
      "email": email.value,
      "password": password.value,
    };
    final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    await loginViewModel.loginUser(data: data);

    Object? errorMessage = loginViewModel.authError?.message;
    if (errorMessage != null) {
      customFlushBar.showErrorFlushBar(
          title: 'Error occurred', body: errorMessage, context: context);
    } else {
      String? successMessage = loginViewModel.loginModel!.message;
      customFlushBar.showSuccessFlushBar(
          title: 'Success', body: successMessage, context: context);
      String? accesToken = loginViewModel.loginModel!.data!.accessToken;
      await AuthService.storeToken(accesToken);
      await AuthService.storeLoggedInUser();
      openBottomNavBar(context);
      resetLogInFields();
    }
    clearAuthErrorMessage(loginViewModel);
  }

  void submitForgotPassword(BuildContext context) async {
    var data = {
      "email": email.value,
    };
    final forgotPasswordViewModel =
        Provider.of<ForgotPasswordViewModel>(context, listen: false);
    await forgotPasswordViewModel.sendEmail(data: data);

    Object? errorMessage = forgotPasswordViewModel.authError?.message;
    if (errorMessage != null) {
      customFlushBar.showErrorFlushBar(
          title: 'Error occurred', body: errorMessage, context: context);
    } else {
      String? successMessage =
          forgotPasswordViewModel.forgotPasswordModel!.message;
      customFlushBar.showSuccessFlushBar(
          title: 'Success', body: successMessage, context: context);
      openResetCode(context);
    }
    clearAuthErrorMessage(forgotPasswordViewModel);
  }

  void submitNewPassword(BuildContext context) async {
    var data = {
      "email": email.value,
      "reset_code": verificationCode.value,
      "password": password.value,
      "password_confirmation": confirmPassword.value,
    };
    print(data);
    final newPasswordViewModel =
        Provider.of<NewPasswordViewModel>(context, listen: false);
    await newPasswordViewModel.sendNewPassword(data: data);

    Object? errorMessage = newPasswordViewModel.authError?.message;
    if (errorMessage != null) {
      customFlushBar.showErrorFlushBar(
          title: 'Error occurred', body: errorMessage, context: context);
    } else {
      String? successMessage = newPasswordViewModel.newPasswordModel!.message;
      modalBottomSheetMenu(context,
          message: successMessage,
          buttonName: "Log In",
          onPressed: () => openLoginScreenWithReplacement(context));
      resetNewPasswordFields();
      resetVerificationFields();
      resetForgotPasswordFields();
    }
    clearAuthErrorMessage(newPasswordViewModel);
  }

  void continueWithGoogle(BuildContext context) async {
    final loginWithGoogleViewModel =
        Provider.of<LoginWithGoogleViewModel>(context, listen: false);
    await loginWithGoogleViewModel.loginUser();

    Object? errorMessage = loginWithGoogleViewModel.authError?.message;
    if (errorMessage != null) {
      customFlushBar.showErrorFlushBar(
          title: 'Error occurred', body: errorMessage, context: context);
    } else {
      String? successMessage = loginWithGoogleViewModel.loginModel!.message;

      customFlushBar.showSuccessFlushBar(
          title: 'Success', body: successMessage, context: context);
      String? accesToken =
          loginWithGoogleViewModel.loginModel!.data!.accessToken;
      await AuthService.storeToken(accesToken);
      await AuthService.storeLoggedInUser();
      openBottomNavBar(context);
      resetLogInFields();
    }
    clearAuthErrorMessage(loginWithGoogleViewModel);
  }

  _storeToken(accesToken) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: "token", value: accesToken);
  }

  _storeLoggedInUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", true);
  }

  clearAuthErrorMessage(authViewModel) {
    AuthError authError = AuthError(message: null);
    authViewModel.setAuthError(authError);
    authViewModel.authError;
  }

  void resetSignUpFields() {
    _fullName = ValidationItem(null, null);
    _password = ValidationItem(null, null);
    _selectedStatus = null;
    _phoneNumber = ValidationItem(null, null);
    _referralCode = ValidationItem(null, null);
    _obscurePassword = false;
    notifyListeners();
  }

  void resetVerificationFields() {
    _verificationCode = ValidationItem(null, null);
    notifyListeners();
  }

  void resetLogInFields() {
    _email = ValidationItem(null, null);
    _password = ValidationItem(null, null);
    notifyListeners();
  }

  void resetForgotPasswordFields() {
    _email = ValidationItem(null, null);
    notifyListeners();
  }

  void resetNewPasswordFields() {
    _password = ValidationItem(null, null);
    _confirmPassword = ValidationItem(null, null);
    notifyListeners();
  }
}
