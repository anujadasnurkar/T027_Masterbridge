import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LessonVideo extends StatefulWidget {
  @override
  _LessonVideoState createState() => _LessonVideoState();
}

class _LessonVideoState extends State<LessonVideo> {
  VideoPlayerController playerController;
  VoidCallback listener;

  @override

  void initState(){
    super.initState();
    listener=() {
      setState(() {

      });
    };
  }

  void createVideo() {
    if (playerController == null) {
      playerController = VideoPlayerController.asset("assets/videos/vid.mp4")
          ..addListener(listener)
          ..setVolume(1.0)
          ..initialize()
          ..play();
    }
//    else{
//      if (playerController.value.isPlaying){
//        playerController.pause();
//      } else {
//        playerController.initialize();
//        playerController.play();
//      }
//    }
  }

  @override
  void deactivate (){
    super.deactivate();
    playerController.setVolume(0.0);
    playerController.removeListener(listener);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Video'),
        ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16/9,
          child: Container(
            child: (playerController != null ? VideoPlayer(playerController) : Container()),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createVideo();
//          playerController.play();
          playerController.value.isPlaying
              ? playerController.pause()
              : playerController.play();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
