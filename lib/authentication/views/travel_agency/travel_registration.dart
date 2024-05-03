import 'dart:io';

import 'package:daytrit/authentication/components/buttons/dropdown/custom_dropdown_button.dart';
import 'package:daytrit/authentication/components/buttons/regular/custom_botton.dart';
import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/input_field/custom_input_field.dart';
import 'package:daytrit/authentication/components/loader/loader.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/authentication/models/data_model/id_card_model.dart';
import 'package:daytrit/authentication/view_models/register_agent_view_model.dart';
import 'package:daytrit/authentication/view_models/validation_view_model.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:daytrit/utils/show_file_dialog.dart';
import 'package:daytrit/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class TravelRegistrationScreen extends StatefulWidget {
  const TravelRegistrationScreen({super.key});

  @override
  State<TravelRegistrationScreen> createState() =>
      _TravelRegistrationScreenState();
}

class _TravelRegistrationScreenState extends State<TravelRegistrationScreen> {
  IDCard? _selectedIdCard;
  static String jsonStr = '''
  [
    {"id":"virtual-nin", "name":"Virtual National ID card"},
    {"id":"nin", "name":"National ID card"},
    {"id":"driver-license", "name":"Driver\'s license"},
    {"id":"vin", "name":"Voter\'s card"},
    {"id":"passport", "name":"International passport"}
  ]
  ''';

  List<IDCard> idCardList = idCardFromJson(jsonStr);

  void selectPhotoBottomsheet({context, isID}) {
    final validationViewModel =
        Provider.of<ValidationViewModel>(context!, listen: false);
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (ctx) {
        return ShowFileDialog(
          onTapCamera: () async {
            Navigator.pop(ctx);
            try {
              final image =
                  await ImagePicker().pickImage(source: ImageSource.camera);
              if (image == null) return;
              if (isID == true) {
                validationViewModel.setIDFile(File(image.path));
              } else {
                validationViewModel.setCompanyCertificatFile(File(image.path));
              }
              print(
                  'file-from-camera-to-string ${File(image.path).toString()}');
            } on PlatformException catch (e) {
              print('Failed to pick image: $e');
            }
          },
          onTapGallery: () async {
            Navigator.pop(ctx);
            try {
              final image =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (image == null) return;
              if (isID == true) {
                validationViewModel.setIDFile(File(image.path));
              } else {
                validationViewModel.setCompanyCertificatFile(File(image.path));
              }
              print(
                  'file-from-gallery-to-string ${File(image.path).toString()}');
            } on PlatformException catch (e) {
              print('Failed to pick image: $e');
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final validationViewModel = Provider.of<ValidationViewModel>(context);
    final registerAgentViewModel = Provider.of<RegisterAgentViewModel>(context);

    bool isPage1 = true;
    String initialButtonName = "Continue";

    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: registerAgentViewModel.loading,
          progressIndicator: const Loader(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.close)),
                      SizedBox(
                        height: 8,
                        width: 100,
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  validationViewModel.setPage(1);
                                });
                              },
                              child: Container(
                                width: 50,
                                color: validationViewModel.isPage1 == true
                                    ? AppColours.officialColor
                                    : AppColours.darkNude3,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    validationViewModel.setPage(2);
                                  });
                                },
                                child: Container(
                                  width: 50,
                                  color: validationViewModel.isPage1 == false
                                      ? AppColours.officialColor
                                      : AppColours.darkNude3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox()
                    ],
                  ),
                  addVerticalSpace(20),
                  getText(
                      context: context,
                      title: "Hello",
                      fontSize: 40,
                      color: AppColours.darkLemon,
                      weight: FontWeight.bold),
                  getText(
                      context: context,
                      title: "Sign up in few minutes",
                      fontSize: 16,
                      color: AppColours.darkLemon4),
                  addVerticalSpace(30),
                  Visibility(
                    visible: validationViewModel.isPage1 == true ? true : false,
                    child: Column(
                      children: [
                        CustomInputField(
                          title: "First Name",
                          hintText: "",
                          style: const TextStyle(
                            color: AppColours.black,
                            fontSize: 20,
                          ),
                          borderRadius: 5,
                          borderColor: Colors.transparent,
                          fillColor: AppColours.darkNude2,
                          isFilledColor: true,
                          isAgent: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                                RegExp(r"\s\b|\b\s"))
                          ],
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          errorText: validationViewModel.firstName.error,
                          onChanged: (dynamic value) =>
                              validationViewModel.setFirstName(value),
                        ),
                        addVerticalSpace(15),
                        CustomInputField(
                          title: "Last Name",
                          hintText: "",
                          style: const TextStyle(
                            color: AppColours.black,
                            fontSize: 20,
                          ),
                          borderRadius: 5,
                          borderColor: Colors.transparent,
                          fillColor: AppColours.darkNude2,
                          isFilledColor: true,
                          isAgent: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                                RegExp(r"\s\b|\b\s"))
                          ],
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          errorText: validationViewModel.lastName.error,
                          onChanged: (dynamic value) =>
                              validationViewModel.setLastName(value),
                        ),
                        addVerticalSpace(15),
                        CustomInputField(
                          title: "Email Address",
                          hintText: "",
                          style: const TextStyle(
                            color: AppColours.black,
                            fontSize: 20,
                          ),
                          borderRadius: 5,
                          borderColor: Colors.transparent,
                          fillColor: AppColours.darkNude2,
                          isFilledColor: true,
                          isAgent: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                                RegExp(r"\s\b|\b\s"))
                          ],
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          errorText: validationViewModel.email.error,
                          onChanged: (dynamic value) =>
                              validationViewModel.setEmail(value),
                        ),
                        addVerticalSpace(15),
                        CustomInputField(
                          title: "Phone Number",
                          hintText: "",
                          style: const TextStyle(
                            color: AppColours.black,
                            fontSize: 20,
                          ),
                          borderRadius: 5,
                          borderColor: Colors.transparent,
                          fillColor: AppColours.darkNude2,
                          isFilledColor: true,
                          isAgent: true,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          errorText: validationViewModel.phoneNumber.error,
                          onChanged: (dynamic value) =>
                              validationViewModel.setPhoneNumber(value),
                        ),
                        addVerticalSpace(15),
                        CustomInputField(
                          title: "Password",
                          hintText: "",
                          style: const TextStyle(
                            color: AppColours.black,
                            fontSize: 20,
                          ),
                          borderRadius: 5,
                          borderColor: Colors.transparent,
                          fillColor: AppColours.darkNude2,
                          isFilledColor: true,
                          isAgent: true,
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
                        addVerticalSpace(30),
                      ],
                    ),
                  ),
                  Visibility(
                    visible:
                        validationViewModel.isPage1 == false ? true : false,
                    child: Column(
                      children: [
                        CustomInputField(
                          title: "Company Name",
                          hintText: "",
                          style: const TextStyle(
                            color: AppColours.black,
                            fontSize: 20,
                          ),
                          borderRadius: 5,
                          borderColor: Colors.transparent,
                          fillColor: AppColours.darkNude2,
                          isFilledColor: true,
                          isAgent: true,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          errorText: validationViewModel.companyName.error,
                          onChanged: (dynamic value) =>
                              validationViewModel.setCompanyName(value),
                        ),
                        addVerticalSpace(15),
                        CustomInputField(
                          title: "Company Address",
                          hintText: "",
                          style: const TextStyle(
                            color: AppColours.black,
                            fontSize: 20,
                          ),
                          borderRadius: 5,
                          borderColor: Colors.transparent,
                          fillColor: AppColours.darkNude2,
                          isFilledColor: true,
                          isAgent: true,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          errorText: validationViewModel.companyAddress.error,
                          onChanged: (dynamic value) =>
                              validationViewModel.setCompanyAddress(value),
                        ),
                        addVerticalSpace(15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3),
                              child: Text("ID Card",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColours.darkLemon4)),
                            ),
                            CustomDropdownButton(
                                hintText: "",
                                textColor: AppColours.darkLemon2,
                                color: AppColours.darkNude2,
                                borderColor: Colors.transparent,
                                borderRadius: 5,
                                items: idCardList
                                    .map<DropdownMenuItem<IDCard>>(
                                        (item) => DropdownMenuItem(
                                              value: item,
                                              child: getText(
                                                  context: context,
                                                  title: "${item.name}",
                                                  fontSize: 20),
                                            ))
                                    .toList(),
                                selectedValue: _selectedIdCard,
                                onChanged: (dynamic value) {
                                  validationViewModel.setIDCardType(value.id);
                                  setState(() {
                                    _selectedIdCard = value;
                                  });
                                }),
                          ],
                        ),
                        CustomInputField(
                          title: "ID Number",
                          hintText: "",
                          style: const TextStyle(
                            color: AppColours.black,
                            fontSize: 20,
                          ),
                          borderRadius: 5,
                          borderColor: Colors.transparent,
                          fillColor: AppColours.darkNude2,
                          isFilledColor: true,
                          isAgent: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          errorText: validationViewModel.idNumber.error,
                          onChanged: (dynamic value) =>
                              validationViewModel.setIDNumber(value),
                        ),
                        addVerticalSpace(15),
                        GestureDetector(
                          onTap: () => selectPhotoBottomsheet(
                              context: context, isID: true),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 3),
                                child: Text("Upload ID",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColours.darkLemon4)),
                              ),
                              Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: AppColours.darkNude2,
                                    borderRadius: BorderRadius.circular(5),
                                    border:
                                        Border.all(color: Colors.transparent)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          validationViewModel.idFile != null
                                              ? validationViewModel.idFile!.path
                                                  .split('/')
                                                  .last
                                              : '',
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                          style: TextStyle(
                                            color: validationViewModel.idFile !=
                                                    null
                                                ? Colors.black
                                                : AppColours.darkLemon2,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(5),
                                                bottomRight:
                                                    Radius.circular(5)),
                                            color: AppColours.officialColor),
                                        child: Center(
                                            child: Text(
                                          'Upload',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: getFontSize(
                                              15,
                                            ),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        addVerticalSpace(15),
                        GestureDetector(
                          onTap: () => selectPhotoBottomsheet(
                              context: context, isID: false),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 3),
                                child: Text("Upload Company Certificate",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColours.darkLemon4)),
                              ),
                              Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: AppColours.darkNude2,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: AppColours.transparent)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          validationViewModel
                                                      .companyCertificateFile !=
                                                  null
                                              ? validationViewModel
                                                  .companyCertificateFile!.path
                                                  .split('/')
                                                  .last
                                              : '',
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                          style: TextStyle(
                                            color: validationViewModel
                                                        .companyCertificateFile !=
                                                    null
                                                ? Colors.black
                                                : AppColours.darkLemon2,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(5),
                                                bottomRight:
                                                    Radius.circular(5)),
                                            color: AppColours.officialColor),
                                        child: Center(
                                            child: Text(
                                          'Upload',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: getFontSize(
                                              15,
                                            ),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        addVerticalSpace(30),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      CustomButton(
                          buttonName: validationViewModel.isPage1 == true
                              ? initialButtonName
                              : "Create an Account",
                          buttonTextColor: AppColours.white,
                          height: 52,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          width: double.infinity,
                          buttonColor: validationViewModel.isAgentInfoValid &&
                                  validationViewModel.isPage1 == true
                              ? AppColours.officialColor
                              : validationViewModel.isAgentInfoValid &&
                                      validationViewModel.isAgentCompanyValid
                                  ? AppColours.officialColor
                                  : Color.fromARGB(255, 162, 203, 194),
                          onPressed: () => validationViewModel
                                      .isAgentInfoValid &&
                                  !validationViewModel.isAgentCompanyValid
                              ? validationViewModel.setPage(2)
                              : validationViewModel.isAgentInfoValid &&
                                      validationViewModel.isAgentCompanyValid
                                  ? validationViewModel
                                      .submitAgentSignUpData(context)
                                  : null),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            getText(
                                context: context,
                                title: "Already have an account?",
                                color: AppColours.grey,
                                fontSize: 16),
                            addHorizontalSpace(8),
                            InkWell(
                              onTap: () {
                                openLoginScreen(context);
                                validationViewModel.resetLogInFields();
                                validationViewModel
                                    .toggleObscurePassword(false);
                              },
                              child: getText(
                                  context: context,
                                  title: "Log In",
                                  color: AppColours.red2,
                                  weight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
