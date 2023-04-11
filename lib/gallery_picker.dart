import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> galleryPicker() async {
  final ImagePicker picker = ImagePicker();

  try {
    // Pick an image.
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (image != null) {
      File file = File(image.path);
      return file;
    } else {
      return null;
    }
  } catch (e) {
    print("error : $e");
    return null;
  }
}
