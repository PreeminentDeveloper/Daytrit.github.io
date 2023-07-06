import 'package:daytrit/utils/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  dynamic items;
  String? hintText;
  dynamic selectedValue;
  dynamic onChanged;
  Color? color;
  Color textColor;
  Color borderColor;

  CustomDropdownButton(
      {Key? key, this.items,this.borderColor =  AppColours.forestLightGreen,
      this.textColor = AppColours.darkLemon2,
      this.color, this.hintText, this.selectedValue, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        height: 60,
        width: double.infinity,
        
        decoration: BoxDecoration(
          color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color:borderColor )),
        child: DropdownButtonHideUnderline(
            child: DropdownButton2(
          buttonPadding: const EdgeInsets.symmetric(horizontal: 15),
          hint: Text(
            "$hintText",
            style:  TextStyle(
                fontSize: 18,
                color:textColor,
                fontFamily: AppConstants.aeonik,
                fontWeight: FontWeight.w400),
          ),
          items: items,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColours.darkLemon2,
            size: 20,
          ),
          value: selectedValue,
          onChanged: onChanged,
          buttonHeight: 40,
          buttonWidth: 140,
          itemHeight: 40,
        )),
      ),
    );
  }
}
