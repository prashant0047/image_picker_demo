import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_demo/camera_picker.dart';
import 'package:image_picker_demo/gallery_picker.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePeg(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePeg extends StatefulWidget {
  const HomePeg({Key? key}) : super(key: key);

  @override
  State<HomePeg> createState() => _HomePegState();
}

class _HomePegState extends State<HomePeg> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ElevatedButton(onPressed: () async {
              //   final ImagePicker picker = ImagePicker();
              //
              //   // Pick an image.
              //   final XFile? image = await picker.pickImage(source: ImageSource.gallery,imageQuality: 100);
              //   setState(() {
              //     if(image != null){
              //       file = File(image.path);
              //       print("file : $file");
              //     }else{
              //       file = null;
              //     }
              //   });
              //   print("Image => $image");
              // }, child: Text("Pick From Gallery")),

              ElevatedButton(
                  onPressed: () async {
                    file = await galleryPicker();
                    setState(() {});
                  },
                  child: const Text('Gallery')),

              const SizedBox(
                height: 10,
              ),

              //show image
              if (file != null) Image.file(file!)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          file = await cameraPicker();
          print("file ===> $file");
          setState(() {});
        },
        child: const Icon(Icons.camera_alt_outlined),
      ),
    );
  }
}
