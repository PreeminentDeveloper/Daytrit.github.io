import 'dart:developer';

import 'package:daytrit/authentication/components/custom_text/get_text.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/home/models/dataModel/all_status_model.dart';
import 'package:daytrit/home/view_models/status_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
// import 'package:story_view/controller/story_controller.dart';
// import 'package:story_view/story_view.dart';
// import 'package:story_view/widgets/story_view.dart';

class AllStatusPageView extends StatefulWidget {
  final List<AllStatusModel> statusModel;
  const AllStatusPageView({super.key, required this.statusModel});

  @override
  State<AllStatusPageView> createState() => _AllStatusPageViewState();
}

class _AllStatusPageViewState extends State<AllStatusPageView> {
  // final controller = StoryController();

  // List<StoryItem> status = <StoryItem>[];
  // @override
  // void initState() {
  //   for (var i = 0; i < widget.statusModel.length; i++) {
  //     if (widget.statusModel[i].statuses![i].fileUrl!.contains('mp4')) {
  //       log('video ${widget.statusModel[i].statuses![i].fileUrl!.length}');
  //       status.add(StoryItem.pageVideo(
  //           "https://daytrit.net${widget.statusModel[i].statuses![i].fileUrl}",
  //           caption: widget.statusModel[i].statuses![i].caption,
  //           controller: controller));
  //     } else {
  //       status.add(StoryItem.pageImage(
  //           url:
  //               "https://daytrit.net${widget.statusModel[i].statuses![i].fileUrl}",
  //           caption: widget.statusModel[i].statuses![i].caption,
  //           controller: controller));
  //     }
  //   }
  //   super.initState();
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
                    "https://daytrit.net${statusses.allStatus.first.photo}",
                  ),
                ),
                addHorizontalSpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getText(
                        context: context,
                        title: widget.statusModel.first.name ?? '',
                        fontSize: 15,
                        color: Colors.white),
                    addVerticalSpace(5),
                    getText(
                        context: context,
                        title: DateFormat.jm()
                            .format(widget.statusModel.first.createdAt!)
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
