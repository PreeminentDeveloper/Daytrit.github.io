import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:daytrit/authentication/components/buttons/dropdown/custom_dropdown_button.dart';
import 'package:daytrit/authentication/components/buttons/regular/custom_botton.dart';
import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/input_field/custom_input_field.dart';
import 'package:daytrit/authentication/components/loader/loader.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/authentication/models/data_model/id_card_model.dart';
import 'package:daytrit/authentication/view_models/validation_view_model.dart';
import 'package:daytrit/home/view_models/add_travel_vendor_view_model.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/show_file_dialog.dart';
import 'package:daytrit/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class AddTravelVendorScreen extends StatefulWidget {
  const AddTravelVendorScreen({super.key});

  @override
  State<AddTravelVendorScreen> createState() => _AddTravelVendorScreenState();
}

class _AddTravelVendorScreenState extends State<AddTravelVendorScreen> {
  String? selectedStatus;

  final List<String> category = [
    'Treats',
    'Tourism',
    'Travels',
    'Trade',
  ];

  final List<String> paymentMethod = [
    'Cash',
    'Trit Coin',
    'Trit Coin & Cash',
  ];

  final List<String> type = [
    'Freemium',
    'Premium',
  ];

  void selectPhotoBottomsheet({context, photo}) {
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
              if (photo == 1) {
                validationViewModel.setPhoto1(File(image.path));
              } else if (photo == 2) {
                validationViewModel.setPhoto2(File(image.path));
              } else if (photo == 3) {
                validationViewModel.setPhoto3(File(image.path));
              } else if (photo == 4) {
                validationViewModel.setPhoto4(File(image.path));
              }
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
              if (photo == 1) {
                validationViewModel.setPhoto1(File(image.path));
              } else if (photo == 2) {
                validationViewModel.setPhoto2(File(image.path));
              } else if (photo == 3) {
                validationViewModel.setPhoto3(File(image.path));
              } else if (photo == 4) {
                validationViewModel.setPhoto4(File(image.path));
              }
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
    final addTravelVendorViewModel =
        Provider.of<AddTravelVendorViewModel>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Add Vendor",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColours.black,
              fontSize: 18,
              fontFamily: 'Aeonik',
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColours.black,
              size: 20,
            ),
            onTap: () => Navigator.pop(context),
          )),
      body: ModalProgressHUD(
        inAsyncCall: addTravelVendorViewModel.loading,
        progressIndicator: const Loader(),
        child: SingleChildScrollView(
          child: Container(
            color: AppColours.gray50,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(10),
                CustomInputField(
                  title: "Title",
                  titleFontWeight: FontWeight.bold,
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
                  errorText: validationViewModel.vendorTitle.error,
                  onChanged: (dynamic value) =>
                      validationViewModel.setVendorTitle(value),
                ),
                addVerticalSpace(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text("Category",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColours.darkLemon4)),
                    ),
                    CustomDropdownButton(
                        hintText: "",
                        textColor: AppColours.darkLemon2,
                        color: AppColours.darkNude2,
                        borderColor: Colors.transparent,
                        borderRadius: 5,
                        items: category
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: getText(
                                      context: context,
                                      title: item,
                                      fontSize: 20),
                                ))
                            .toList(),
                        selectedValue: validationViewModel.category,
                        onChanged: (dynamic value) =>
                            validationViewModel.setCategory(value)),
                  ],
                ),
                // addVerticalSpace(10),
                CustomInputField(
                  title: "State",
                  titleFontWeight: FontWeight.bold,
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
                  errorText: validationViewModel.state.error,
                  onChanged: (dynamic value) =>
                      validationViewModel.setStateOfResidence(value),
                ),
                addVerticalSpace(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text("Payment Method",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColours.darkLemon4)),
                    ),
                    CustomDropdownButton(
                        hintText: "",
                        textColor: AppColours.darkLemon2,
                        color: AppColours.darkNude2,
                        borderColor: Colors.transparent,
                        borderRadius: 5,
                        items: paymentMethod
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: getText(
                                      context: context,
                                      title: item,
                                      fontSize: 20),
                                ))
                            .toList(),
                        selectedValue: validationViewModel.paymentMethod,
                        onChanged: (dynamic value) =>
                            validationViewModel.setPaymentMethod(value)),
                  ],
                ),
                // addVerticalSpace(10),
                // CustomInputField(
                //   title: "Coin",
                //   titleFontWeight: FontWeight.bold,
                //   hintText: "",
                //   style: const TextStyle(
                //     color: AppColours.black,
                //     fontSize: 20,
                //   ),
                //   borderRadius: 5,
                //   borderColor: Colors.transparent,
                //   fillColor: AppColours.darkNude2,
                //   isFilledColor: true,
                //   isAgent: true,
                //   textInputAction: TextInputAction.next,
                //   keyboardType: TextInputType.name,
                //   errorText: validationViewModel.coin.error,
                //   onChanged: (dynamic value) =>
                //       validationViewModel.setCoin(value),
                // ),
                // addVerticalSpace(10),
                // CustomInputField(
                //   title: "Cash Requirement (Optional)",
                //   titleFontWeight: FontWeight.bold,
                //   hintText: "",
                //   style: const TextStyle(
                //     color: AppColours.black,
                //     fontSize: 20,
                //   ),
                //   borderRadius: 5,
                //   borderColor: Colors.transparent,
                //   fillColor: AppColours.darkNude2,
                //   isFilledColor: true,
                //   isAgent: true,
                //   textInputAction: TextInputAction.next,
                //   keyboardType: TextInputType.name,
                //   errorText: validationViewModel.cashRequirement.error,
                //   onChanged: (dynamic value) =>
                //       validationViewModel.setCashRequirement(value),
                // ),
                // addVerticalSpace(10),
                CustomInputField(
                  title: "Cash Price",
                  titleFontWeight: FontWeight.bold,
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
                  errorText: validationViewModel.cashPrice.error,
                  onChanged: (dynamic value) =>
                      validationViewModel.setCashPrice(value),
                ),
                addVerticalSpace(10),
                CustomInputField(
                  title: "Rating",
                  titleFontWeight: FontWeight.bold,
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
                  errorText: validationViewModel.rating.error,
                  onChanged: (dynamic value) =>
                      validationViewModel.setRating(value),
                ),
                addVerticalSpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text("Type",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColours.darkLemon4)),
                    ),
                    CustomDropdownButton(
                        hintText: "",
                        textColor: AppColours.darkLemon2,
                        color: AppColours.darkNude2,
                        borderColor: Colors.transparent,
                        borderRadius: 5,
                        items: type
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: getText(
                                      context: context,
                                      title: item,
                                      fontSize: 20),
                                ))
                            .toList(),
                        selectedValue: validationViewModel.type,
                        onChanged: (dynamic value) =>
                            validationViewModel.setType(value)),
                  ],
                ),
                addVerticalSpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Text("Country",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColours.darkLemon4))),
                    GestureDetector(
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
                                    color: AppColours
                                        .officialColor), //<-- SEE HERE
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
                            validationViewModel
                                .setLocation(country.displayName);
                          }),
                      child: Container(
                          height: 55,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                              color: AppColours.darkNude2,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.transparent)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                validationViewModel.selectedStatus ?? "",
                                style: TextStyle(
                                    color: validationViewModel.selectedStatus ==
                                            null
                                        ? AppColours.darkLemon2
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
                  ],
                ),
                addVerticalSpace(10),
                CustomInputField(
                  title: "Address",
                  titleFontWeight: FontWeight.bold,
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
                addVerticalSpace(10),
                CustomInputField(
                  title: "Description",
                  titleFontWeight: FontWeight.bold,
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
                  errorText: validationViewModel.description.error,
                  onChanged: (dynamic value) =>
                      validationViewModel.setDescription(value),
                ),
                addVerticalSpace(10),
                CustomInputField(
                  title: "Features",
                  titleFontWeight: FontWeight.bold,
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
                  errorText: validationViewModel.features.error,
                  onChanged: (dynamic value) =>
                      validationViewModel.setFeatures(value),
                ),
                addVerticalSpace(10),
                CustomFileUpload(
                  title: "Photo 1",
                  onTap: () =>
                      selectPhotoBottomsheet(context: context, photo: 1),
                  selectedFile: validationViewModel.photo1 != null
                      ? validationViewModel.photo1!.path.split('/').last
                      : '',
                ),
                addVerticalSpace(10),
                CustomFileUpload(
                  title: "Photo 2",
                  onTap: () =>
                      selectPhotoBottomsheet(context: context, photo: 2),
                  selectedFile: validationViewModel.photo2 != null
                      ? validationViewModel.photo2!.path.split('/').last
                      : '',
                ),
                addVerticalSpace(10),
                CustomFileUpload(
                  title: "Photo 3",
                  onTap: () =>
                      selectPhotoBottomsheet(context: context, photo: 3),
                  selectedFile: validationViewModel.photo3 != null
                      ? validationViewModel.photo3!.path.split('/').last
                      : '',
                ),
                addVerticalSpace(10),
                CustomFileUpload(
                  title: "Photo 4",
                  onTap: () =>
                      selectPhotoBottomsheet(context: context, photo: 4),
                  selectedFile: validationViewModel.photo4 != null
                      ? validationViewModel.photo4!.path.split('/').last
                      : '',
                ),
                addVerticalSpace(50),
                CustomButton(
                  buttonName: "Save New Vendor",
                  buttonTextColor: AppColours.white,
                  height: 52,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  width: double.infinity,
                  buttonColor: validationViewModel.isAddVendorValid
                      ? AppColours.officialColor
                      : Color.fromARGB(255, 162, 203, 194),
                  onPressed: () => !validationViewModel.isAddVendorValid
                      ? null
                      : validationViewModel.submitAddTravelVendorData(context),
                ),
                addVerticalSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomFileUpload extends StatelessWidget {
  CustomFileUpload({super.key, this.title, this.selectedFile, this.onTap});

  String? title;
  String? selectedFile;
  dynamic onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: Text(title!,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColours.darkLemon4)),
        ),
        GestureDetector(
          onTap: onTap!,
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColours.darkNude2,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.transparent)),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      selectedFile!,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
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
                            bottomRight: Radius.circular(5)),
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
        ),
      ],
    );
  }
}
