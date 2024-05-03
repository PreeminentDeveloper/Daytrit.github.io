import 'dart:convert';
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
import 'package:daytrit/authentication/view_models/register_agent_view_model.dart';
import 'package:daytrit/home/view_models/add_travel_vendor_view_model.dart';
import 'package:daytrit/home/view_models/status_view_model.dart';
import 'package:daytrit/home/view_models/userprofile_view_model.dart';
import 'package:daytrit/services/auth_service.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'new_password_view_model.dart';

class ValidationViewModel extends ChangeNotifier {
  var log = Logger();

// personal details variables
  ValidationItem _fullName = ValidationItem(null, null);
  ValidationItem _firstName = ValidationItem(null, null);
  ValidationItem _lastName = ValidationItem(null, null);
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);
  ValidationItem _confirmPassword = ValidationItem(null, null);
  ValidationItem _caption = ValidationItem(null, null);
  ValidationItem _phoneNumber = ValidationItem(null, null);
  ValidationItem _referralCode = ValidationItem(null, null);
  ValidationItem _verificationCode = ValidationItem(null, null);

  // company details variables
  ValidationItem _companyName = ValidationItem(null, null);
  ValidationItem _companyAddress = ValidationItem(null, null);
  ValidationItem _idNumber = ValidationItem(null, null);
  ValidationItem _idCardType = ValidationItem(null, null);

  // travel agency vendor variables
  ValidationItem _vendorTitle = ValidationItem(null, null);
  ValidationItem _state = ValidationItem(null, null);
  ValidationItem _coin = ValidationItem(null, null);
  ValidationItem _cashPrice = ValidationItem(null, null);
  ValidationItem _cashRequirement = ValidationItem(null, null);
  ValidationItem _rating = ValidationItem(null, null);
  ValidationItem _description = ValidationItem(null, null);
  ValidationItem _features = ValidationItem(null, null);

  // file upload variables
  File? _idFile;
  File? _companyCertificateFile;

  // add travelvendor
  File? _photo1;
  File? _photo2;
  File? _photo3;
  File? _photo4;

  dynamic _selectedStatus;
  dynamic _category;
  dynamic _paymentMethod;
  dynamic _type;

  bool _isPage1 = true;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  String? emailToVerify;

  // Getters
  ValidationItem get caption => _caption;
  ValidationItem get fullName => _fullName;
  ValidationItem get firstName => _firstName;
  ValidationItem get lastName => _lastName;

  ValidationItem get vendorTitle => _vendorTitle;
  ValidationItem get state => _state;
  ValidationItem get coin => _coin;
  ValidationItem get cashPrice => _cashPrice;
  ValidationItem get cashRequirement => _cashRequirement;
  ValidationItem get rating => _rating;
  ValidationItem get description => _description;
  ValidationItem get features => _features;

  ValidationItem get companyName => _companyName;
  ValidationItem get companyAddress => _companyAddress;
  ValidationItem get idNumber => _idNumber;
  ValidationItem get idCardType => _idCardType;
  ValidationItem get idCardphoto4Type => _idCardType;

  File? get idFile => _idFile;
  File? get photo1 => _photo1;
  File? get photo2 => _photo2;
  File? get photo3 => _photo3;
  File? get photo4 => _photo4;
  File? get companyCertificateFile => _companyCertificateFile;
  ValidationItem get email => _email;
  ValidationItem get password => _password;
  ValidationItem get confirmPassword => _confirmPassword;
  dynamic get selectedStatus => _selectedStatus;
  dynamic get category => _category;
  dynamic get paymentMethod => _paymentMethod;
  dynamic get type => _type;
  ValidationItem get phoneNumber => _phoneNumber;
  ValidationItem get referralCode => _referralCode;
  ValidationItem get verificationCode => _verificationCode;

  dynamic get isPage1 => _isPage1;

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

  bool get isAgentInfoValid {
    if (_firstName.value != null &&
        _lastName.value != null &&
        _email.value != null &&
        _phoneNumber.value != null &&
        password.value != null) {
      return true;
    } else {
      return false;
    }
  }

  bool get isAgentCompanyValid {
    if (companyName.value != null &&
        companyAddress.value != null &&
        idNumber.value != null) {
      return true;
    } else {
      return false;
    }
  }

  bool get isAddVendorValid {
    if (_vendorTitle.value != null &&
            _category != null &&
            _state.value != null &&
            _paymentMethod != null &&
            // _coin.value != null &&
            _cashPrice.value != null &&
            // _cashRequirement.value != null ||
            _rating.value != null &&
            _type != null &&
            _selectedStatus != null &&
            _companyAddress.value != null ||
        _description.value != null && _features.value != null) {
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

  bool get isCaptionValid {
    if (_caption.value != null || _password.value == null) {
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

  void setPage(int value) {
    if (value == 1) {
      _isPage1 = true;
    } else {
      _isPage1 = false;
    }
    notifyListeners();
  }

  void setFirstName(String value) {
    if (value.trim().isNotEmpty) {
      _firstName = ValidationItem(value, null);
    } else {
      _firstName = ValidationItem(null, "First Name is required");
    }
    notifyListeners();
  }

  void setLastName(String value) {
    if (value.trim().isNotEmpty) {
      _lastName = ValidationItem(value, null);
    } else {
      _lastName = ValidationItem(null, "Last Name is required");
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

  void setCaption(String value) {
    if (value.length >= 6) {
      _caption = ValidationItem(value, null);
    }
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

  void setCompanyName(String value) {
    if (value.trim().isNotEmpty) {
      _companyName = ValidationItem(value, null);
    } else {
      _companyName = ValidationItem(null, "Company Name is required");
    }
    notifyListeners();
  }

  void setCompanyAddress(String value) {
    if (value.trim().isNotEmpty) {
      _companyAddress = ValidationItem(value, null);
    } else {
      _companyAddress = ValidationItem(null, "Company Address is required");
    }
    notifyListeners();
  }

  void setIDNumber(String value) {
    final idNumberRegExp = RegExp(
        r'^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{7})$');
    if (idNumberRegExp.hasMatch(value.trim())) {
      _idNumber = ValidationItem(value, null);
    } else {
      _idNumber = ValidationItem(null, "Enter a valid ID number");
    }
    notifyListeners();
  }

  void setIDCardType(String id) {
    if (id.trim().isNotEmpty) {
      _idCardType = ValidationItem(id, null);
    } else {
      _idCardType = ValidationItem(null, "ID Card is required");
    }
    notifyListeners();
  }

  void setIDFile(File? file) {
    _idFile = file;
    notifyListeners();
  }

  void setCompanyCertificatFile(File? file) {
    _companyCertificateFile = file;
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

  void setVendorTitle(String value) {
    if (value.trim().isNotEmpty) {
      _vendorTitle = ValidationItem(value, null);
    } else {
      _vendorTitle = ValidationItem(null, "Title is required");
    }
    notifyListeners();
  }

  void setCategory(String value) {
    _category = value;
    notifyListeners();
  }

  void setStateOfResidence(String value) {
    if (value.trim().isNotEmpty) {
      _state = ValidationItem(value, null);
    } else {
      _state = ValidationItem(null, "State of Residence is required");
    }
    notifyListeners();
  }

  void setPaymentMethod(String value) {
    _paymentMethod = value;
    notifyListeners();
  }

  void setCoin(String value) {
    if (value.trim().isNotEmpty) {
      _coin = ValidationItem(value, null);
    } else {
      _coin = ValidationItem(null, "Coin is required");
    }
    notifyListeners();
  }

  void setCashPrice(String value) {
    if (value.trim().isNotEmpty) {
      _cashPrice = ValidationItem(value, null);
    } else {
      _cashPrice = ValidationItem(null, "Cash value is required");
    }
    notifyListeners();
  }

  void setCashRequirement(String value) {
    if (value.trim().isNotEmpty) {
      _cashRequirement = ValidationItem(value, null);
    } else {
      _cashRequirement = ValidationItem(null, "Cash Requirement is required");
    }
    notifyListeners();
  }

  void setRating(String value) {
    if (value.trim().isNotEmpty) {
      _rating = ValidationItem(value, null);
    } else {
      _rating = ValidationItem(null, "Rating is required");
    }
    notifyListeners();
  }

  void setType(String value) {
    _type = value;
    notifyListeners();
  }

  void setDescription(String value) {
    if (value.trim().isNotEmpty) {
      _description = ValidationItem(value, null);
    } else {
      _description = ValidationItem(null, "Description is required");
    }
    notifyListeners();
  }

  void setFeatures(String value) {
    if (value.trim().isNotEmpty) {
      _features = ValidationItem(value, null);
    } else {
      _features = ValidationItem(null, "Features is required");
    }
    notifyListeners();
  }

  void setPhoto1(File? file) {
    _photo1 = file;
    notifyListeners();
  }

  void setPhoto2(File? file) {
    _photo2 = file;
    notifyListeners();
  }

  void setPhoto3(File? file) {
    _photo3 = file;
    notifyListeners();
  }

  void setPhoto4(File? file) {
    _photo4 = file;
    notifyListeners();
  }

  // form submission to endpoints
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

  void submitAgentSignUpData(BuildContext context) async {
    final registerViewModel =
        Provider.of<RegisterAgentViewModel>(context, listen: false);
    await registerViewModel.registerAgent(
        firstName: firstName.value,
        lastName: lastName.value,
        phoneNumber: phoneNumber.value,
        email: email.value,
        companyName: companyName.value,
        companyAddress: companyAddress.value,
        password: password.value,
        idCardType: idCardType.value,
        idNumber: idNumber.value,
        idFile: idFile,
        companyCertificateFile: companyCertificateFile);
    Object? errorMessage = registerViewModel.authError?.message;
    print("auth-error-message: $errorMessage");
    if (errorMessage != null) {
      customFlushBar.showErrorFlushBar(
          title: 'Error occurred', body: errorMessage, context: context);
    } else {
      String? successMessage = registerViewModel.registerAgentModel!.message;
      print("agent-signup-message: $successMessage");

      modalBottomSheetMenu(context,
          message: successMessage,
          buttonName: "Proceed",
          onPressed: () => openVerificationScreen(context));
      resetRegisterAgentFields();
    }
    clearAuthErrorMessage(registerViewModel);
  }

  void submitAddTravelVendorData(BuildContext context) async {
    // var filecontent = photo1?.readAsBytesSync();
    // var filecontentbase64 = base64.encode(filecontent!);
    var rc = "first_name";
    // var data = {
    //   "title": vendorTitle.value,
    //   "category": category,
    //   "state": state.value,
    //   "payment_method": paymentMethod,
    //   // "coin": coin.value,
    //   "cash_price": cashPrice.value,
    //   // "required_checkout_field": cashRequirement.value,
    //   "required_checkout_field": "[first_name]",
    //   "rating": rating.value,
    //   "type": type,
    //   "country": selectedStatus,
    //   "address": companyAddress.value,
    //   "description": description.value,
    //   "features": features.value,
    //   "photo": photo1!.path,
    //   // "photo_2": photo2,
    //   // "photo_3": photo3,
    //   // "photo_4": photo4
    // };

    // print(data);
    final addTravelVendorViewModel =
        Provider.of<AddTravelVendorViewModel>(context, listen: false);
    await addTravelVendorViewModel.addTravelVendor(
        vendorTitle.value,
        category,
        state.value,
        paymentMethod,
        cashPrice.value,
        rc,
        rating.value,
        type,
        selectedStatus,
        companyAddress.value,
        description.value,
        features.value,
        photo1!.path);
    Object? errorMessage = addTravelVendorViewModel.authError?.message;
    print("auth-error-message: $errorMessage");
    if (errorMessage != null) {
      customFlushBar.showErrorFlushBar(
          title: 'Error occurred', body: errorMessage, context: context);
    } else {
      print("ERR: $errorMessage");
      String? successMessage =
          addTravelVendorViewModel.createTravelVendorModel?.message;
      customFlushBar.showSuccessFlushBar(
          title: 'Success', body: successMessage, context: context);
      print("added-vendor-message: $successMessage");
      Future.delayed(Duration(seconds: 2), () {
        openMyVendor(context);
      });
    }
    clearAuthErrorMessage(addTravelVendorViewModel);
  }

  void submitEditProfile(BuildContext context) async {
    final profileModel = Provider.of<ProfileViewModel>(context, listen: false);
    var data = {
      "name": fullName.value ?? profileModel.userData?.name,
      "location": selectedStatus ?? profileModel.userData?.location,
      "phone": phoneNumber.value ?? profileModel.userData?.phone,
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
      final profileModel =
          Provider.of<ProfileViewModel>(context, listen: false);
      await profileModel.getUserProfile();
      String? successMessage = editProfileViewModel.editProfileModel!.message;
      customFlushBar.showSuccessFlushBar(
          title: 'Success', body: successMessage, context: context);
      print("EDIT PROFILE MESSAGE: $successMessage");
    }
    clearAuthErrorMessage(editProfileViewModel);
  }

  void submitPostImage(BuildContext context, File image, caption) async {
    var data = {
      "type": "image",
      "caption": caption,
      "file_url": image,
    };
    print('data $data');
    final statusViewModel =
        Provider.of<StatusViewModel>(context, listen: false);
    await statusViewModel.postImage(data, image, caption);
    Object? errorMessage = statusViewModel.authError?.message;
    print("AUTH ERROR MESSAGE: $errorMessage");
    if (errorMessage != null) {
      print("POST IMAGE ERROR: $errorMessage");
      customFlushBar.showErrorFlushBar(
          title: 'Error occurred', body: errorMessage, context: context);
    } else {
      String? successMessage = statusViewModel.statusModel!.message;
      customFlushBar.showSuccessFlushBar(
          title: 'Success', body: successMessage, context: context);
      print("POST IMAGE MESSAGE: $successMessage");
      openHomeScreen(context);
      resetSignUpFields();
    }
  }

  void submitPostVideo(BuildContext context, File image, caption) async {
    var data = {"type": "video", "caption": caption, "file_url": image};
    print(data);
    final statusViewModel =
        Provider.of<StatusViewModel>(context, listen: false);
    await statusViewModel.postVideo(data, image, caption);
    Object? errorMessage = statusViewModel.authError?.message;
    print("AUTH ERROR MESSAGE: $errorMessage");
    if (errorMessage != null) {
      print("POST VIDEO ERROR: $errorMessage");
      customFlushBar.showErrorFlushBar(
          title: 'Error occurred', body: errorMessage, context: context);
    } else {
      String? successMessage = statusViewModel.statusModel!.message;
      customFlushBar.showSuccessFlushBar(
          title: 'Success', body: successMessage, context: context);
      print("POST VIdeo MESSAGE: $successMessage");

      resetSignUpFields();
    }
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
    if (errorMessage != null || errorMessage == "null") {
      print("UPLOAD ERROR: $errorMessage");
      customFlushBar.showErrorFlushBar(
          title: 'Error occurred', body: errorMessage, context: context);
    } else {
      final profileModel =
          Provider.of<ProfileViewModel>(context, listen: false);
      await profileModel.getUserProfile();
      String? successMessage = editProfileViewModel.editProfileModel!.message;
      customFlushBar.showSuccessFlushBar(
          title: 'Success', body: successMessage, context: context);
      print("UPLOAD IMAGE: $successMessage");
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
      String? role = loginViewModel.loginModel!.data.role;
      customFlushBar.showSuccessFlushBar(
          title: 'Success', body: successMessage, context: context);
      String? accesToken = loginViewModel.loginModel!.data!.accessToken;
      await AuthService.storeToken(accesToken);
      await AuthService.storeLoggedInUser();
      await AuthService.storeRole(role);
      if (role == "agent") {
        openTravelDashboard(context);
      } else {
        openBottomNavBar(context);
      }
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

  void resetRegisterAgentFields() {
    _firstName = ValidationItem(null, null);
    _lastName = ValidationItem(null, null);
    _companyName = ValidationItem(null, null);
    _companyAddress = ValidationItem(null, null);
    _phoneNumber = ValidationItem(null, null);
    _password = ValidationItem(null, null);
    _obscurePassword = false;
    _idNumber = ValidationItem(null, null);
    _idFile = null;
    _companyCertificateFile = null;
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
