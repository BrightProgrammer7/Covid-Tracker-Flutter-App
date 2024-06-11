import 'dart:io';

import 'package:covid_tracker/screens/home.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class FacePage extends StatefulWidget {
  const FacePage({super.key});

  @override
  State<FacePage> createState() => _FacePageState();
  // _FaceState createState() => _FaceState();
}

class _FacePageState extends State<FacePage> {
  File? _imageFile;
  // XFile? _imageFile;
  late List<Face>? _faces;

  Future _getImageAndDetectFaces() async {
    // Future _getImageAndDetectFaces(ImageSource source) async {
    // final imageFile = await ImagePicker().pickImage(
    final imageFile = await ImagePickerPlugin().getImageFromSource(
      // source: source,
      source: ImageSource.gallery,
      // source: ImageSource.camera,
      // imageQuality: 100,
    );
    // setState(() {
    //   _image= File(image.path)
    // });

    final image = FirebaseVisionImage.fromFile(File(imageFile!.path));
    final faceDetect =
        FirebaseVision.instance.faceDetector(const FaceDetectorOptions(
      mode: FaceDetectorMode.accurate,
      enableLandmarks: true,
    ));
    // final options = FirebaseVisionFaceDetectorOptions(
    //   enableLandmarks: true,
    //   mode: FaceDetectorMode.accurate,
    // );
    // final faceDetector = FirebaseVision.instance.vision.faceDetector(options: options);

    // final analyzer = FirebaseVision.instance.faceDetector(
    // mode: FaceDetectorMode.accurate,
    // enableLandmarks: true,
    // );
    // final imageAnalyzer = await FirebaseVisionImageAnalyzer(analyzer: analyzer);
    // final result = await imageAnalyzer.detectInImage(image);
    // final options = await FaceDetectorOptions;

    // await faceDetector.detectInImage(image);
    final faces = await faceDetect.processImage(image);
    if (mounted) {
      setState(() {
        // _imageFile = imageFile as XFile?;
        _imageFile = File(imageFile.path);
        _faces = faces.cast<Face>();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Detector'),
        actions: <Widget>[
          // FlatButton.icon(
          TextButton.icon(
              onPressed: () {
                // print('Register');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
              icon: const Icon(Icons.home),
              label: const Text('Home'))
        ],
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
          onPressed: _getImageAndDetectFaces,
          tooltip: 'Pick an image',
          child: const Icon(Icons.add_a_photo)),
    );
  }
}

class ImagesAndFaces extends StatelessWidget {
  ImagesAndFaces({super.key, this.imageFile, this.faces});
  // XFile? imageFile;
  File? imageFile;
  late List<Face>? faces;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
            flex: 2,
            child: Container(
              constraints: const BoxConstraints.expand(),
              child: Image.file(
                // imageFile! as File,
                File(imageFile!.path),
                fit: BoxFit.cover,
              ),
            )),
        Flexible(
          child: ListView(
            children: faces!.map<Widget>((f) => FaceCoordinates(f)).toList(),
          ),
        )
      ],
    );
  }
}

class FaceCoordinates extends StatelessWidget {
  const FaceCoordinates(this.face, {super.key});
  final Face face;
  // late final Rectangle<int> boundingBox;

  @override
  Widget build(BuildContext context) {
    final pos = face.boundingBox;
    return ListTile(
        title: Text('(${pos.top}, ${pos.left}),(${pos.bottom}, ${pos.right})'));
  }
}
