import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_utils.dart';

// ignore: must_be_immutable
class AppbarTitle extends StatelessWidget {
  AppbarTitle({super.key, required this.text, this.margin, this.onTap});

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: AppColours.bluegray900A2,
          fontSize: getFontSize(
            32,
          ),
          fontFamily: 'Aeonik',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
