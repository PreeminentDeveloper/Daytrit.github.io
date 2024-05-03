import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/home/models/dataModel/transaction_model.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class WalletDetailsScreen extends StatelessWidget {
  final TransactionModel transactionModel;
  const WalletDetailsScreen({super.key, required this.transactionModel});

  @override
  Widget build(BuildContext context) {
    String dateTimeString = transactionModel.createdAt.toString();
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDateTime = DateFormat("d MMM, HH:mm").format(dateTime);
    String day = DateFormat("d").format(dateTime);
    String suffix = _getDaySuffix(int.parse(day));
    formattedDateTime = formattedDateTime.replaceFirst(day, "$day$suffix");

    String createdDate = transactionModel.createdAt.toString();
    DateTime createdTime = DateTime.parse(createdDate);
    String createdEventDate = DateFormat("d MMM, y").format(createdTime);
    String days = DateFormat("d").format(dateTime);
    String suffixs = _getDaySuffix(int.parse(day));
    createdEventDate = createdEventDate.replaceFirst(days, "$day$suffixs");
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColours.gray50,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Transaction details",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColours.black,
              fontSize: getFontSize(
                28,
              ),
              fontFamily: 'Aeonik',
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black45,
              size: 20,
            ),
            onTap: () => Navigator.pop(context),
          )),
      body: Column(
        children: [
          addVerticalSpace(20),
          Container(
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColours.white,
                borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  getText(
                      context: context,
                      title: formattedDateTime,
                      fontSize: 14,
                      weight: FontWeight.w600,
                      color: AppColours.gray700),
                  addVerticalSpace(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(transactionModel.type == 'Credit'
                              ? 'assets/svgs/deep_wallet.svg'
                              : 'assets/svgs/light_wallet.svg'),
                          addHorizontalSpace(10),
                          getText(
                              context: context,
                              title: transactionModel.description ?? '',
                              fontSize: 14,
                              weight: FontWeight.w600,
                              color: AppColours.gray700),
                        ],
                      ),
                      Row(
                        children: [
                          getText(
                              context: context,
                              title: transactionModel.amount ?? '',
                              fontSize: 18,
                              weight: FontWeight.w600,
                              color: AppColours.dayTritPrimaryColor),
                          getText(
                              context: context,
                              title: ' TC',
                              fontSize: 18,
                              weight: FontWeight.w600,
                              color: AppColours.dayTritPrimaryColor),
                        ],
                      )
                    ],
                  ),
                  addVerticalSpace(10),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: AppColours.gray700,
                  ),
                  addVerticalSpace(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getText(
                          context: context,
                          title: 'Event Date',
                          fontSize: 14,
                          weight: FontWeight.w600,
                          color: AppColours.gray700),
                      getText(
                          context: context,
                          title: transactionModel.dateOfEvent ?? '',
                          weight: FontWeight.w700,
                          fontSize: 12,
                          color: AppColours.dayTritPrimaryColor)
                    ],
                  ),
                  addVerticalSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getText(
                          context: context,
                          title: 'Status',
                          fontSize: 14,
                          weight: FontWeight.w600,
                          color: AppColours.gray700),
                      getText(
                          context: context,
                          title: transactionModel.status ?? '',
                          weight: FontWeight.w700,
                          fontSize: 12,
                          color: AppColours.dayTritPrimaryColor)
                    ],
                  ),
                  addVerticalSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getText(
                          context: context,
                          title: 'Type',
                          fontSize: 14,
                          weight: FontWeight.w600,
                          color: AppColours.gray700),
                      getText(
                          context: context,
                          title: transactionModel.type ?? '',
                          weight: FontWeight.w700,
                          fontSize: 12,
                          color: AppColours.dayTritPrimaryColor)
                    ],
                  ),
                  addVerticalSpace(20),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: AppColours.gray700,
                  ),
                  addVerticalSpace(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getText(
                          context: context,
                          title: 'Transaction  ID',
                          weight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColours.gray700),
                      getText(
                          context: context,
                          title: transactionModel.transactionId ?? '',
                          weight: FontWeight.w700,
                          fontSize: 12,
                          color: AppColours.black)
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return "th";
    }
    switch (day % 10) {
      case 1:
        return "st";
      case 2:
        return "nd";
      case 3:
        return "rd";
      default:
        return "th";
    }
  }
}
