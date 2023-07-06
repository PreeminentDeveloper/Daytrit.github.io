import 'package:card_swiper/card_swiper.dart';
import 'package:daytrit/authentication/components/screen_properties.dart/spaces.dart';
import 'package:daytrit/home/models/dataModel/explore_model.dart';
import 'package:daytrit/home/view/explore/video_player/widget/video_details.dart';
import 'package:flutter/material.dart';

class VideoPlayerScreen extends StatelessWidget {
  List<Datum>? videoData;
  int? videoIndex;

  VideoPlayerScreen({super.key, this.videoData, this.videoIndex});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //We need swiper for every content
            Swiper(
              itemBuilder: (BuildContext context, int index) {
                // index = 4;
                return VideoDetails(
                  videoUrl: videoData![index].youtubeUrl,
                  title: videoData![index].title,
                  description: videoData![index].description,
                );
              },
              index: videoIndex,
              itemCount: videoData!.length,
              scrollDirection: Axis.vertical,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios)),
                  addHorizontalSpace(30),
                  Text(
                    'Reels',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
