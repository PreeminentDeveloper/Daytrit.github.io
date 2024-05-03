import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VendorTile extends StatelessWidget {
  String? image;
  String? title;
  String? description;
  dynamic price;
  dynamic rating;
  VendorTile(
      {super.key,
      this.image,
      this.title,
      this.description,
      this.price,
      this.rating});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image(
              image: NetworkImage(image!),
              height: 120,
              width: 120,
            ),
            addHorizontalSpace(20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: TextStyle(
                      color: AppColours.black2,
                      fontSize: getFontSize(
                        20,
                      ),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  addVerticalSpace(5),
                  Text(
                    description!,
                    style: TextStyle(
                      color: AppColours.grey5,
                      fontSize: getFontSize(
                        16,
                      ),
                    ),
                  ),
                  addVerticalSpace(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          color: AppColours.officialColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImages.star,
                            width: 12,
                            height: 12,
                          ),
                          addHorizontalSpace(3),
                          Text(
                            rating,
                            style: TextStyle(
                              color: AppColours.officialColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                      // InkWell(
                      //   onTap: () {},
                      //   child: SvgPicture.asset(
                      //     'assets/svgs/edit.svg',
                      //     height: 25,
                      //     width: 25,
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        // addHorizontalSpace(50),
        Divider(
          color: Colors.black,
        )
      ],
    );
  }
}
