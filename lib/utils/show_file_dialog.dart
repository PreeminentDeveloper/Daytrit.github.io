import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:flutter/material.dart';

class ShowFileDialog extends StatelessWidget {
  final dynamic onTapCamera;
  final dynamic onTapGallery;
  const ShowFileDialog({super.key, this.onTapCamera, this.onTapGallery});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: onTapCamera,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getText(
                    context: context,
                    title: 'Open Camera',
                    weight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          addVerticalSpace(15),
          Divider(color: AppColours.grey100),
          addVerticalSpace(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: onTapGallery,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getText(
                    context: context,
                    title: 'Open Gallery',
                    weight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
