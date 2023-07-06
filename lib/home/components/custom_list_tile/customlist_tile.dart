import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget? leading;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const CustomListTile({
    Key? key,
    this.leading,
    required this.title,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      dense: true,
      title: getText(
        context: context,
        title: title,
        weight: FontWeight.w400,
        fontSize: 18,
        color: Colors.black,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
