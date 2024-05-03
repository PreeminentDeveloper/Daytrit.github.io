import 'package:daytrit/authentication/components/buttons/regular/custom_botton.dart';
import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/input_field/custom_input_field.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/navigation_utils.dart';
import 'package:daytrit/utils/size_utils.dart';
import 'package:flutter/material.dart';

class TravelersDetailsScreen extends StatelessWidget {
  const TravelersDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.white,
      appBar: AppBar(
          backgroundColor: AppColours.white,
          elevation: 0,
          title: Text(
            "Travelers's details",
            style: TextStyle(
              color: AppColours.black,
              fontSize: getFontSize(
                32,
              ),
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: InkWell(
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onTap: () => Navigator.pop(context),
          )),
      body: SingleChildScrollView(
        child: Column(children: [
          addVerticalSpace(20),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColours.dayTritPrimaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            height: 1200,
            width: double.infinity,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              addVerticalSpace(20),
              Container(
                height: 700,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColours.white),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getText(
                          context: context,
                          title: "Travelers's details",
                          fontSize: 25,
                          color: AppColours.gray700,
                          weight: FontWeight.w600),
                      addVerticalSpace(15),
                      getText(
                          context: context,
                          title: "Surname*",
                          fontSize: 18,
                          color: AppColours.gray700,
                          weight: FontWeight.w500),
                      addVerticalSpace(5),
                      CustomInputField(
                        hintText: "Input text here",
                        hintColor: AppColours.gray500,
                        style: TextStyle(
                          color: AppColours.black,
                          fontSize: 20,
                        ),
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                        // ],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        // errorText: validationViewModel.email.error,
                        // onChanged: (dynamic value) =>
                        //     validationViewModel.setEmail(value),
                      ),
                      addVerticalSpace(10),
                      getText(
                          context: context,
                          title: "First Name*",
                          fontSize: 18,
                          color: AppColours.gray700,
                          weight: FontWeight.w500),
                      addVerticalSpace(5),
                      CustomInputField(
                        hintText: "Input text here",
                        hintColor: AppColours.gray500,
                        style: const TextStyle(
                          color: AppColours.black,
                          fontSize: 20,
                        ),
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                        // ],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        // errorText: validationViewModel.email.error,
                        // onChanged: (dynamic value) =>
                        //     validationViewModel.setEmail(value),
                      ),
                      addVerticalSpace(10),
                      getText(
                          context: context,
                          title: "Middle name*",
                          fontSize: 18,
                          color: AppColours.gray700,
                          weight: FontWeight.w500),
                      addVerticalSpace(5),
                      CustomInputField(
                        hintText: "Input text here",
                        hintColor: AppColours.gray500,
                        style: const TextStyle(
                          color: AppColours.black,
                          fontSize: 20,
                        ),
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                        // ],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        // errorText: validationViewModel.email.error,
                        // onChanged: (dynamic value) =>
                        //     validationViewModel.setEmail(value),
                      ),
                      addVerticalSpace(10),
                      getText(
                          context: context,
                          title: "Nationality*",
                          fontSize: 18,
                          color: AppColours.gray700,
                          weight: FontWeight.w500),
                      addVerticalSpace(5),
                      CustomInputField(
                        hintText: "Input text here",
                        hintColor: AppColours.gray500,
                        style: const TextStyle(
                          color: AppColours.black,
                          fontSize: 20,
                        ),
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                        // ],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        // errorText: validationViewModel.email.error,
                        // onChanged: (dynamic value) =>
                        //     validationViewModel.setEmail(value),
                      ),
                      addVerticalSpace(10),
                      getText(
                          context: context,
                          title: "Gender*",
                          fontSize: 18,
                          color: AppColours.gray700,
                          weight: FontWeight.w500),
                      addVerticalSpace(5),
                      CustomInputField(
                        hintText: "Input text here",
                        hintColor: AppColours.gray500,
                        style: const TextStyle(
                          color: AppColours.black,
                          fontSize: 20,
                        ),
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                        // ],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        // errorText: validationViewModel.email.error,
                        // onChanged: (dynamic value) =>
                        //     validationViewModel.setEmail(value),
                      ),
                      addVerticalSpace(10),
                      getText(
                          context: context,
                          title: "Date of Birth*",
                          fontSize: 18,
                          color: AppColours.gray700,
                          weight: FontWeight.w500),
                      addVerticalSpace(5),
                      CustomInputField(
                        hintText: "Input text here",
                        hintColor: AppColours.gray500,
                        style: const TextStyle(
                          color: AppColours.black,
                          fontSize: 20,
                        ),
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                        // ],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        // errorText: validationViewModel.email.error,
                        // onChanged: (dynamic value) =>
                        //     validationViewModel.setEmail(value),
                      ),
                    ]),
              ),
              addVerticalSpace(5),
              Container(
                height: 270,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColours.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getText(
                        context: context,
                        title: 'Send my confirmation to',
                        fontSize: 18,
                        color: AppColours.black,
                        weight: FontWeight.w500),
                    addVerticalSpace(20),
                    getText(
                        context: context,
                        title: "Email*",
                        fontSize: 18,
                        color: AppColours.gray700,
                        weight: FontWeight.w500),
                    addVerticalSpace(5),
                    CustomInputField(
                      hintText: "Input text here",
                      hintColor: AppColours.gray500,
                      style: const TextStyle(
                        color: AppColours.black,
                        fontSize: 20,
                      ),
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                      // ],
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      // errorText: validationViewModel.email.error,
                      // onChanged: (dynamic value) =>
                      //     validationViewModel.setEmail(value),
                    ),
                    addVerticalSpace(10),
                    getText(
                        context: context,
                        title: "Phone Number*",
                        fontSize: 18,
                        color: AppColours.gray700,
                        weight: FontWeight.w500),
                    addVerticalSpace(5),
                    CustomInputField(
                      hintText: "Input text here",
                      hintColor: AppColours.gray500,
                      style: const TextStyle(
                        color: AppColours.black,
                        fontSize: 20,
                      ),
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
                      // ],
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      // errorText: validationViewModel.email.error,
                      // onChanged: (dynamic value) =>
                      //     validationViewModel.setEmail(value),
                    ),
                  ],
                ),
              ),
              addVerticalSpace(15),
              CustomButton(
                  buttonName: "Continue",
                  buttonTextColor: AppColours.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  height: 60,
                  width: double.infinity,
                  buttonColor: AppColours.white,
                  onPressed: () {
                    openOverviewAndPaymentScreen(context);
                  })
            ]),
          )
        ]),
      ),
    );
  }
}
