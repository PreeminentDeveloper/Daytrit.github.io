import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:flutter/material.dart';

class OptionsScreen extends StatelessWidget {
  String title;
  String description;
  OptionsScreen({super.key, required this.title, required this.description});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getText(
                        context: context,
                        title: title,
                        fontSize: 18,
                        weight: FontWeight.bold),
                    addVerticalSpace(10),
                    getText(context: context, title: description, fontSize: 14),
                    addVerticalSpace(10),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
