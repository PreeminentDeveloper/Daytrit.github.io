import 'package:daytrit/utils/constants.dart';
import 'package:flutter/material.dart';

typedef SaveCallBack = void Function(String? value);
typedef ValidateCallBack = String? Function(String? value);

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final Color? hintColor;
  final Color? fillColor;
  final bool? isFilledColor;
  final String? labelText;
  final TextStyle? style;
  
  final int? maxLength;
  final Color? cursorColor;
  final Color borderColor;
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final dynamic inputFormatters;
  final bool obscureText, readOnly;
  final String? errorText;
  final dynamic onSave;
  final dynamic onChanged;
  final dynamic validator;
  const CustomInputField({
    Key? key,
    this.hintText,
    this.hintColor = AppColours.darkLemon2,
    this.fillColor,
    this.isFilledColor,
    this.labelText,
    this.style,
    this.maxLength,
    this.cursorColor = AppColours.darkLemon2,
    this.borderColor = AppColours.forestLightGreen,
    required this.textInputAction,
    required this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.inputFormatters,
    this.obscureText = false,
    this.readOnly = false,
    this.errorText,
    this.onSave,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        readOnly: readOnly,
        style: style,
        controller: controller,
        key: key,
        onChanged: onChanged,
        onSaved: onSave,
        validator: validator,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        inputFormatters: inputFormatters,
        maxLength: maxLength,
        obscureText: obscureText,
        cursorColor: cursorColor,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          fillColor: fillColor,
          filled: isFilledColor,
          errorText: errorText,
          contentPadding: const EdgeInsets.only(
            left: 15.0,
            top: 35.0,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: hintColor),
          labelText: labelText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderColor, width: 1)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: borderColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: AppColours.darkLemon2, width: 1),
          ),
        ),
      ),
    );
  }
}
