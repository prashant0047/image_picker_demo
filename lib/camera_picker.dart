import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<File?> cameraPicker() async {
  final ImagePicker picker = ImagePicker();

  try {
    // Pick an image.
    final XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 100);

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
