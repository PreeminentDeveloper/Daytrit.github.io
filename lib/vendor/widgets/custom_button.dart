import '../../utils/constants.dart';
import 'package:flutter/material.dart';
import '../../utils/size_utils.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key, this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.onTap,
      this.width,
      this.margin,
      this.prefixWidget,
      this.suffixWidget,
      this.text});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  VoidCallback? onTap;

  double? width;

  EdgeInsetsGeometry? margin;

  Widget? prefixWidget;

  Widget? suffixWidget;

  String? text;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: getHorizontalSize(width ?? 0),
        margin: margin,
        padding: _setPadding(),
        decoration: _buildDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixWidget ?? SizedBox(),
            Text(
              text ?? "",
              textAlign: TextAlign.center,
              style: _setFontStyle(),
            ),
            suffixWidget ?? SizedBox(),
          ],
        ),
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll12:
        return getPadding(
          all: 12,
        );
      default:
        return getPadding(
          all: 16,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.FillRed100:
        return AppColours.red100;
      case ButtonVariant.OutlineGray501:
        return null;
      default:
        return AppColours.deepOrangeA200;
    }
  }

  _setBorder() {
    switch (variant) {
      case ButtonVariant.OutlineGray501:
        return Border.all(
          color: AppColours.gray501,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.FillDeeporangeA200:
      case ButtonVariant.FillRed100:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder27:
        return BorderRadius.circular(
          getHorizontalSize(
            27.50,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            4.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.AeonikBold14DeeporangeA400:
        return TextStyle(
          color: AppColours.deepOrangeA400,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Aeonik',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.AeonikBold14Gray501:
        return TextStyle(
          color: AppColours.gray501,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Aeonik',
          fontWeight: FontWeight.w700,
        );
      default:
        return TextStyle(
          color: AppColours.whiteA701,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Aeonik',
          fontWeight: FontWeight.w700,
        );
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder4,
  RoundedBorder27,
}

enum ButtonPadding {
  PaddingAll16,
  PaddingAll12,
}

enum ButtonVariant {
  FillDeeporangeA200,
  FillRed100,
  OutlineGray501,
}

enum ButtonFontStyle {
  AeonikBold14,
  AeonikBold14DeeporangeA400,
  AeonikBold14Gray501,
}
