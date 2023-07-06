import 'package:chewie/chewie.dart';
import 'package:daytrit/authentication/components/loader/loader.dart';
import 'package:daytrit/home/view/explore/video_player/widget/options_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDetails extends StatefulWidget {
  final String? videoUrl;
  String title;
  String description;

  VideoDetails(
      {Key? key, this.videoUrl, required this.title, required this.description})
      : super(key: key);

  @override
  _VideoDetailsState createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl!);
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(
                controller: _chewieController!,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Loader()],
              ),
        OptionsScreen(title: widget.title, description: widget.description)
      ],
    );
  }
}
