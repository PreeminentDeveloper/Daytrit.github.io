import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/size_utils.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColours.white,
          centerTitle: true,
          title: Text(
            "Orders",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColours.black,
              fontSize: getFontSize(
                25,
              ),
              fontFamily: 'Aeonik',
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black45,
            ),
            onTap: () => Navigator.pop(context),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Image(
                image: AssetImage("assets/images/beach_wide.png"),
              ),
              addVerticalSpace(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Name:',
                          style: TextStyle(
                            color: AppColours.bluegray700A2,
                            fontSize: getFontSize(
                              18,
                            ),
                          ),
                        ),
                        Text(
                          'Landmark Beach',
                          style: TextStyle(
                            color: AppColours.bluegray700,
                            fontSize: getFontSize(
                              18,
                            ),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: AppColours.grey702),
                    addVerticalSpace(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Adult(s):',
                          style: TextStyle(
                            color: AppColours.bluegray700A2,
                            fontSize: getFontSize(
                              18,
                            ),
                          ),
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                            color: AppColours.bluegray700,
                            fontSize: getFontSize(
                              18,
                            ),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: AppColours.grey702),
                    addVerticalSpace(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Children:',
                          style: TextStyle(
                            color: AppColours.bluegray700A2,
                            fontSize: getFontSize(
                              18,
                            ),
                          ),
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                            color: AppColours.bluegray700,
                            fontSize: getFontSize(
                              18,
                            ),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: AppColours.grey702),
                    addVerticalSpace(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'From:',
                          style: TextStyle(
                            color: AppColours.bluegray700A2,
                            fontSize: getFontSize(
                              18,
                            ),
                          ),
                        ),
                        Text(
                          '5/5/2023',
                          style: TextStyle(
                            color: AppColours.bluegray700,
                            fontSize: getFontSize(
                              18,
                            ),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: AppColours.grey702),
                    addVerticalSpace(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'To:',
                          style: TextStyle(
                            color: AppColours.bluegray700A2,
                            fontSize: getFontSize(
                              18,
                            ),
                          ),
                        ),
                        Text(
                          '5/5/2023',
                          style: TextStyle(
                            color: AppColours.bluegray700,
                            fontSize: getFontSize(
                              18,
                            ),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: AppColours.grey702),
                    addVerticalSpace(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                            color: AppColours.bluegray700A2,
                            fontSize: getFontSize(
                              18,
                            ),
                          ),
                        ),
                        Text(
                          '\$50',
                          style: TextStyle(
                            color: AppColours.bluegray700,
                            fontSize: getFontSize(
                              18,
                            ),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: AppColours.grey702),
                    addVerticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: AppColours.black,
                            fontSize: getFontSize(
                              18,
                            ),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$200',
                          style: TextStyle(
                            color: AppColours.black,
                            fontSize: getFontSize(
                              18,
                            ),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
