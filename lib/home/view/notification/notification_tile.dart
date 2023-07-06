import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/home/models/dataModel/notification_model.dart';
import 'package:daytrit/home/view/notification/notification_details.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    required this.notifications,
  });

  final NotificationModel notifications;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NotificationDetails(
                        notificationModel: notifications,
                      )));
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          width: double.infinity,
          height: 110,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 94,
                  height: 94,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://daytrit.net${notifications.featureImage}"),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle,
                      color: Colors.grey),
                ),
                SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getText(
                          context: context,
                          title: notifications.title ?? '',
                          fontSize: 15,
                          color: AppColours.blue2,
                          weight: FontWeight.w700),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: getText(
                            softwrap: true,
                            maxLines: 5,
                            textOverflow: TextOverflow.ellipsis,
                            context: context,
                            title: notifications.description ?? '',
                            fontSize: 12,
                            color: AppColours.darkBlue,
                            weight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
