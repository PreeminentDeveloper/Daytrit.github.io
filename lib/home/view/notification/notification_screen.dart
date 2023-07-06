import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/home/models/dataModel/notification_model.dart';
import 'package:daytrit/home/view/notification/notification_details.dart';
import 'package:daytrit/home/view_models/notification_view_model.dart';
import 'package:daytrit/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<String> formattedDate = [];
  String createdDay = '';
  @override
  void initState() {
    initialize();
    super.initState();
  }

  void initialize() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final notificationModel =
          Provider.of<NotificationViewModel>(context, listen: false);
      await notificationModel.getNotification();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notification = Provider.of<NotificationViewModel>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            getText(
                context: context,
                title: "Notification",
                fontSize: 31.4,
                color: AppColours.blue2,
                weight: FontWeight.w700),
            SizedBox(
              height: 20,
            ),
            ScrollConfiguration(
              behavior: ScrollBehavior(),
              child: GroupedListView<NotificationModel, DateTime>(
                  shrinkWrap: true,
                  elements: notification.notify,
                  groupBy: (element) {
                    return DateTime(element.createdAt!.year,
                        element.createdAt!.month, element.createdAt!.day);
                  },
                  groupComparator: (value1, value2) =>
                      DateTime(value2.year, value2.month, value2.day).compareTo(
                          DateTime(value1.year, value1.month, value1.day)),
                  useStickyGroupSeparators: true,
                  groupSeparatorBuilder: (DateTime value) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        GetTimeAgo.parse(value),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColours.lightOrange,
                            fontWeight: FontWeight.w700),
                      ),
                    );
                  },
                  itemBuilder: (
                    context,
                    element,
                  ) =>
                      NotificationTile(notifications: element)),
            )
          ],
        ),
      ),
    );
  }
}

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
                          fit: BoxFit.fill),
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
