import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoStatusUpload extends StatefulWidget {
  final File video;
  const VideoStatusUpload({super.key, required this.video});

  @override
  State<VideoStatusUpload> createState() => _VideoStatusUploadState();
}

class _VideoStatusUploadState extends State<VideoStatusUpload> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.video)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? Stack(
              children: [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                Positioned(
                  bottom:380,left: 180,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                            size: 40,
                            color: Colors.blue,
                      )),
                )
              ],
            )
          : Container(),
    );
    // // floatingActionButton: FloatingActionButton(

    // );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
