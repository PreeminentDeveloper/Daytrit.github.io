import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/home/models/dataModel/notification_model.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:daytrit/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationDetails extends StatelessWidget {
  final NotificationModel notificationModel;
  const NotificationDetails({super.key, required this.notificationModel});

  @override
  Widget build(BuildContext context) {
    String input = notificationModel.createdAt.toString();
    DateTime dateTime = DateTime.parse(input);

    String formattedDate = DateFormat('d MMM yyyy').format(dateTime);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColours.gray50,
          elevation: 0,
          centerTitle: true,
          title: Text(
            notificationModel.title ?? '',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColours.black,
              fontSize: getFontSize(
                30,
              ),
              fontFamily: 'Aeonik',
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onTap: () => Navigator.pop(context),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpace(30),
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://daytrit.net${notificationModel.featureImage}"),
                      fit: BoxFit.fill),
                  color: Colors.grey),
            ),
            addVerticalSpace(40),
            getText(
                context: context,
                fontSize: getFontSize(
                  20,
                ),
                title: notificationModel.description ?? ''),
            addVerticalSpace(20),
            Align(
              alignment: Alignment.bottomRight,
              child: getText(
                  context: context,
                  fontStyle: FontStyle.italic,
                  color: AppColours.grey3,
                  fontSize: getFontSize(
                    20,
                  ),
                  title: formattedDate),
            ),
          ],
        ),
      ),
    );
  }
}
