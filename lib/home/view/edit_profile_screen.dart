import 'dart:developer';
import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/input_field/custom_input_field.dart';
import 'package:daytrit/authentication/components/loader/loader.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/authentication/view_models/edit_profile_view_model.dart.dart';
import 'package:daytrit/authentication/view_models/validation_view_model.dart';
import 'package:daytrit/home/view_models/userprofile_view_model.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/show_file_dialog.dart';
import 'package:daytrit/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../authentication/components/buttons/regular/custom_botton.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? image;
  final List<String> location = [
    'Nigeria',
    'Rwanda',
    'Angola',
    'South Africa',
    'Ethiopia'
  ];

  String? selectedStatus;
  @override
  Widget build(BuildContext context) {
    final validationViewModel = Provider.of<ValidationViewModel>(context);
    final editProfileViewModel = Provider.of<EditProfileViewModel>(context);
    final profileModel = Provider.of<ProfileViewModel>(context);
    return Scaffold(
      // backgroundColor: AppColours.gray50,
      appBar: AppBar(
          backgroundColor: AppColours.gray50,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Account Information",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColours.black,
              fontSize: getFontSize(
                25,
              ),
              fontFamily: 'Aeonik',
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black45,
            ),
            onTap: () => Navigator.pop(context),
          )),
      body: ModalProgressHUD(
        inAsyncCall: editProfileViewModel.loading,
        progressIndicator: const Loader(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // addVerticalSpace(15),
                Stack(
                  fit: StackFit.loose,
                  children: [
                    Container(
                      height: 110,
                    ),
                    Center(
                        child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                      child: profileModel.userData?.photo == null
                          ? CircleAvatar(
                              radius: 50,
                              backgroundColor: AppColours.grey300,
                              backgroundImage: AssetImage(AppImages.avatar))
                          : Container(
                              width: 94,
                              height: 94,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://daytrit.net${profileModel.userData!.photo}"),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                  color: Colors.grey),
                            ),
                    )),
                    Positioned(
                      right: 125,
                      bottom: 10,
                      child: InkWell(
                        onTap: () {
                          selectPhotoBottomsheet(context);
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: AppColours.midGreen,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: AppColours.lightGreen,
                            child: SvgPicture.asset(
                              AppImages.imgEdit,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                addVerticalSpace(10),
                getText(
                  context: context,
                  title: 'Full Name',
                  weight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.black,
                ),
                addVerticalSpace(10),
                CustomInputField(
                  hintText: profileModel.userData?.name ?? "",
                  hintColor: AppColours.grey200,
                  style: const TextStyle(
                    color: AppColours.black,
                    fontSize: 20,
                  ),
                  borderColor: AppColours.grey100,
                  fillColor: AppColours.white,
                  isFilledColor: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  errorText: validationViewModel.fullName.error,
                  onChanged: (dynamic value) =>
                      validationViewModel.setFullName(value),
                ),
                addVerticalSpace(15),
                getText(
                    context: context,
                    title: 'Email Address',
                    weight: FontWeight.w400,
                    fontSize: 18,
                    color: AppColours.black),
                addVerticalSpace(10),
                CustomInputField(
                  hintText: profileModel.userData?.email ?? "",
                  hintColor: AppColours.grey200,
                  fillColor: AppColours.white,
                  isFilledColor: true,
                  style: const TextStyle(
                    color: AppColours.black,
                    fontSize: 20,
                  ),
                  borderColor: AppColours.grey100,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                  ],
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  //   errorText: validationViewModel.email.error,
                  //   onChanged: (dynamic value) =>
                  //       validationViewModel.setEmail(value),
                ),
                addVerticalSpace(15),
                getText(
                  context: context,
                  title: 'Country',
                  weight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.black,
                ),
                addVerticalSpace(10),
                // CustomDropdownButton(
                //   borderColor: AppColours.grey100,
                //   color: AppColours.white,
                //   hintText: profileModel.userData?.location ?? "",
                //   textColor: AppColours.grey200,
                //   items: location
                //       .map((item) => DropdownMenuItem<String>(
                //             value: item,
                //             child: getText(
                //                 context: context,
                //                 title: item,
                //                 fontSize: 20,
                //                 color: AppColours.black),
                //           ))
                //       .toList(),
                //   selectedValue: validationViewModel.selectedStatus,
                //   onChanged: (dynamic value) =>
                //       validationViewModel.setLocation(value),
                // ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () => showCountryPicker(
                        context: context,
                        countryListTheme: CountryListThemeData(
                          flagSize: 25,
                          backgroundColor: Colors.white,
                          textStyle:
                              TextStyle(fontSize: 16, color: Colors.blueGrey),
                          bottomSheetHeight:
                              500, // Optional. Country list modal height
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                          inputDecoration: InputDecoration(
                            hintText: 'Search Country',
                            prefixIcon: const Icon(Icons.search),
                            prefixIconColor: AppColours.officialColor,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color:
                                      AppColours.officialColor), //<-- SEE HERE
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: AppColours.officialColor),
                            ),
                          ),
                        ),
                        onSelect: (Country country) {
                          selectedStatus = country.displayName;
                          validationViewModel.setLocation(country.displayName);
                        }),
                    child: Container(
                        height: 50,
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            // color: AppColours.black,
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: AppColours.forestLightGreen)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              validationViewModel.selectedStatus ??
                                  profileModel.userData?.location,
                              style: TextStyle(
                                  color:
                                      validationViewModel.selectedStatus == null
                                          ? AppColours.grey200
                                          : AppColours.black,
                                  fontSize: 18),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: AppColours.darkLemon2,
                            )
                          ],
                        )),
                  ),
                ),
                addVerticalSpace(5),
                getText(
                  context: context,
                  title: 'Phone Number',
                  weight: FontWeight.w400,
                  fontSize: 18,
                  color: Colors.black,
                ),
                addVerticalSpace(10),
                CustomInputField(
                  borderColor: AppColours.grey100,
                  hintColor: AppColours.grey200,
                  hintText: profileModel.userData?.phone ?? "",
                  style: const TextStyle(
                    color: AppColours.black,
                    fontSize: 20,
                  ),
                  fillColor: AppColours.white,
                  textInputAction: TextInputAction.done,
                  isFilledColor: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  errorText: validationViewModel.phoneNumber.error,
                  onChanged: (dynamic value) =>
                      validationViewModel.setPhoneNumber(value),
                ),
                addVerticalSpace(35),
                CustomButton(
                  buttonName: "Save Changes",
                  buttonTextColor: AppColours.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  height: 52,
                  width: double.infinity,
                  buttonColor: Colors.red,
                  onPressed: () =>
                      validationViewModel.submitEditProfile(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void selectPhotoBottomsheet(BuildContext context) {
    final validationViewModel =
        Provider.of<ValidationViewModel>(context, listen: false);
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
              final imageTemp = File(image.path);
              validationViewModel.submitUploadImage(
                context,
                imageTemp,
              );
              setState(() {
                this.image = imageTemp;
                log('hiim ${imageTemp.toString()}');
              });
            } on PlatformException catch (e) {
              log('Failed to pick image: $e');
            }
          },
          onTapGallery: () async {
            Navigator.pop(ctx);
            try {
              final image =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (image == null) return;
              final imageTemp = File(image.path);
              validationViewModel.submitUploadImage(
                context,
                imageTemp,
              );
              setState(() {
                this.image = imageTemp;
                log('hiim ${imageTemp.toString()}');
              });
            } on PlatformException catch (e) {
              print('Failed to pick image: $e');
            }
          },
        );
      },
    );
  }
}
