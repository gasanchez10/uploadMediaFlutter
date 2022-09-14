import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_camera/flutter_camera.dart';
import './video_page.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return FlutterCamera(
      color: Colors.blue[100],
      onImageCaptured: (value) {
        final path = value.path;

        print("Image path: ");
        print(path);
        if (path.contains('.jpg')) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Image.file(File(path)),
                );
              });
        }
      },
      onVideoRecorded: (value) {
        final path = value.path;
        print('Video Path: ');
        print(path);
        final route = MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => VideoPage(filePath: [path, value.name]),
        );
        Navigator.push(context, route);
      },
    );
  }
}
