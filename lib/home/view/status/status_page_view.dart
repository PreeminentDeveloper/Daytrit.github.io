import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/home/models/dataModel/status_details_model.dart';
import 'package:daytrit/home/view_models/status_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
// import 'package:story_view/controller/story_controller.dart';
// import 'package:story_view/story_view.dart';
// import 'package:story_view/widgets/story_view.dart';

class StatusPageView extends StatefulWidget {
  final List<StatusDetailsModel> statusModel;
  const StatusPageView({super.key, required this.statusModel});

  @override
  State<StatusPageView> createState() => _StatusPageViewState();
}

class _StatusPageViewState extends State<StatusPageView> {
  // final controller = StoryController();

  // List<StoryItem> status = <StoryItem>[];

  // void  addStoryItems(){

  // @override
  // void initState() {
  //   super.initState();
  //   var stats = widget.statusModel.map((e) {
  //     if (e.fileUrl!.contains('mp4')) {
  //       return StoryItem.pageVideo("https://daytrit.net${e.fileUrl}",
  //           caption: e.caption, controller: controller);
  //     } else {
  //       return StoryItem.pageImage(
  //           url: "https://daytrit.net${e.fileUrl}",
  //           caption: e.caption,
  //           controller: controller);
  //     }
  //   }).toList();
  //   status.addAll(stats);
  //   setState(() {});
  // }

  // void completed(){
  //   final currentIndex = widget.statusModel.indexOf(widget.statusModel,);
  //   final isLastPage = widget.statusModel.length == currentIndex;
  //   if(isLastPage){
  //     Navigator.pop(context);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final statusses = Provider.of<StatusViewModel>(context);
    ;

    return Scaffold(
      body: Stack(
        children: [
          // StoryView(
          //     controller: controller,
          //     storyItems: status,
          //     inline: false,
          //     repeat: true,
          //     onVerticalSwipeComplete: (direction) {
          //       if (direction == Direction.down) {
          //         Navigator.pop(context);
          //       }
          //     }),
          Positioned(
            top: 50,
            child: Row(
              children: [
                addHorizontalSpace(5),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
                CircleAvatar(
                  radius: 20,
                  //backgroundColor: Colors.blue,
                  backgroundImage: NetworkImage(
                    "https://daytrit.net${statusses.status.first.user!.photo}",
                  ),
                ),
                addHorizontalSpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getText(
                        context: context,
                        title: 'Me',
                        fontSize: 15,
                        color: Colors.white),
                    addVerticalSpace(5),
                    getText(
                        context: context,
                        title: DateFormat.jm()
                            .format(statusses.status.first.createdAt!)
                            .toString(),
                        fontSize: 15,
                        color: Colors.white)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
