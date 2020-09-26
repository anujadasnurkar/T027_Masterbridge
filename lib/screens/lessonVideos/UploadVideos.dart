import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadVideos extends StatefulWidget {
  @override
  _UploadVideosState createState() => _UploadVideosState();
}

class _UploadVideosState extends State<UploadVideos> {
  VideoPlayerController playerController;
  File video;
  final picker = ImagePicker();
  Future getVideo() async {
//    var tempVideo = await picker.getVideo(source: ImageSource.gallery);
    PickedFile tempVideo = await picker.getVideo(source: ImageSource.gallery);
    setState(() {
      if (tempVideo != null) {
        video = File(tempVideo.path);
      } else {
        print('No video selected.');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Videos'),
      ),
      body: Center(
        child: video == null ? Text("Select a video") : enableUpload(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getVideo,
        tooltip: 'Add Video',
        child: Icon(Icons.add),
      ),
    );
  }
}


Widget enableUpload() {
  return Container(
    child: Column(
//      children: [
//        Image.file(sampleImage, height: 300, width: 300,),
//        RaisedButton(
//          elevation: 7,
//          child: Text('Upload'),
//          textColor: Colors.white,
//          color: Colors.black,
//          onPressed: () async {
//            final StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child('image.jpg');
//            final StorageUploadTask task = firebaseStorageRef.putFile(sampleImage);
//          },
//        ),
//      ],
    ),
  );
}