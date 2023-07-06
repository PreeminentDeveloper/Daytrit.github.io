import 'package:daytrit/authentication/components/buttons/regular/custom_botton.dart';
import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/loader/loader.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/authentication/view_models/validation_model.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../components/input_field/custom_input_field.dart';
import '../view_models/new_password_view_model.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => NewPasswordState();
}

class NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    final validationViewModel = Provider.of<ValidationModel>(context);
    final newPasswordViewModel = Provider.of<NewPasswordViewModel>(context);
    return Scaffold(
      backgroundColor: AppColours.monochromeWhite2,
      body: ModalProgressHUD(
        inAsyncCall: newPasswordViewModel.loading,
        progressIndicator: const Loader(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 61, bottom: 42),
                  child: InkWell(
                      onTap: () => Navigator.of(context).pop(context),
                      child: Icon(Icons.arrow_back_ios)),
                ),
                addVerticalSpace(28),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getText(
                        context: context,
                        title: "Enter New Password",
                        fontSize: 28,
                        weight: FontWeight.w700),
                    addVerticalSpace(50),
                    getText(
                        context: context,
                        title:
                            "Please fill in a new secure password that you can remember",
                        fontSize: 16,
                        weight: FontWeight.w400),
                    addVerticalSpace(12),
                    CustomInputField(
                      hintText: "New Password",
                      style: const TextStyle(
                        color: AppColours.black,
                        fontSize: 20,
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      obscureText: validationViewModel.obscurePassword,
                      suffixIcon: IconButton(
                        icon: Image(
                            image: AssetImage(
                                validationViewModel.obscurePassword
                                    ? AppImages.passwordVisibilityOff
                                    : AppImages.passwordVisibilityOn)),
                        onPressed: () {
                          validationViewModel.toggleObscurePassword(
                              validationViewModel.obscurePassword);
                        },
                      ),
                      errorText: validationViewModel.password.error,
                      onChanged: (dynamic value) =>
                          validationViewModel.setPassword(value),
                    ),
                    addVerticalSpace(12),
                    CustomInputField(
                      hintText: "Confirm Password",
                      style: const TextStyle(
                        color: AppColours.black,
                        fontSize: 20,
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      obscureText: validationViewModel.obscureConfirmPassword,
                      suffixIcon: IconButton(
                        icon: Image(
                            image: AssetImage(
                                validationViewModel.obscureConfirmPassword
                                    ? AppImages.passwordVisibilityOff
                                    : AppImages.passwordVisibilityOn)),
                        onPressed: () {
                          validationViewModel.toggleObscureConfirmPassword(
                              validationViewModel.obscureConfirmPassword);
                        },
                      ),
                      errorText: validationViewModel.confirmPassword.error,
                      onChanged: (dynamic value) =>
                          validationViewModel.setConfirmPassword(value),
                    ),
                    addVerticalSpace(24),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: CustomButton(
                          height: 52,
                          width: double.infinity,
                          buttonName: "Send",
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          buttonColor: !validationViewModel.isPasswordValid
                              ? Colors.grey
                              : AppColours.black,
                          onPressed: () => !validationViewModel.isPasswordValid
                              ? null
                              : validationViewModel.submitNewPassword(context)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
