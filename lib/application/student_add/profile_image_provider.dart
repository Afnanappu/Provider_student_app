import 'package:flutter/material.dart';
import 'package:student_app_provider/core/functions/image_picker.dart';

class ProfileImageProvider extends ChangeNotifier {
  static final ProfileImageProvider _instance =
      ProfileImageProvider._internal();
  factory ProfileImageProvider() => _instance;

  ProfileImageProvider._internal();
  //image
  String? _image;

  //image getter
  String? get image => _image;

  //image setter.
  set setImage(String image) => _image = image;

  //for picking images from gallery
  Future<void> pickImage() async {
    _image = await myImagePicker();
    notifyListeners();
  }

  void clearImage() {
    _image = null;
  }
}
