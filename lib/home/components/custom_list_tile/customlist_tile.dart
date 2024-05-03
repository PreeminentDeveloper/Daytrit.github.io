import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget? leading;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? textColor;

  const CustomListTile({
    Key? key,
    this.leading,
    this.textColor,
    required this.title,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      dense: true,
      horizontalTitleGap: 5,
      title: getText(
        context: context,
        title: title,
        weight: FontWeight.w500,
        fontSize: 16,
        color: textColor ?? Colors.black,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
