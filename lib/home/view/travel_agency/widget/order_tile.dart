import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  String? image;
  String? title;
  String? description;
  dynamic price;
  OrderTile({super.key, this.image, this.title, this.description, this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image(
            image: NetworkImage(image!),
            height: 120,
            width: 120,
          ),
          addHorizontalSpace(15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getText(
                    context: context,
                    title: title!,
                    weight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColours.grey),
                addVerticalSpace(5),
                getText(
                    context: context,
                    title: description!,
                    fontSize: 16,
                    color: AppColours.bluegray900A2),
                addVerticalSpace(5),
                getText(
                    context: context,
                    title: price!,
                    fontSize: 16,
                    color: AppColours.bluegray900A2),
              ],
            ),
          )
        ],
      ),
    );
  }
}
