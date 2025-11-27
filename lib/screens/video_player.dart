import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreenState extends StatefulWidget {
  const VideoScreenState({super.key});



  @override
  State<VideoScreenState> createState() => _VideoScreenStateState();
}


class _VideoScreenStateState extends State<VideoScreenState> {
  late VideoPlayerController _controller;
  ChewieController? chewieController;


  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(Uri.parse("https://filesamples.com/samples/video/mp4/sample_1280x720.mp4",
    )
      
    )..initialize().then((_) {
      chewieController =ChewieController(videoPlayerController: _controller,
      autoPlay: true,
      looping: false,
      allowFullScreen: true,
      allowPlaybackSpeedChanging: true);
        setState(() {});
        _controller.play();    
      });

  }


  @override
  void dispose(){
    _controller.dispose();
    chewieController?.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:chewieController != null &&
                chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(controller: chewieController!)
               : CircularProgressIndicator(),

      ),
      
    );
  }
}