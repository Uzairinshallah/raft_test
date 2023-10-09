
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../data/post/post_api.dart';
import '../models/post_model.dart';
import '../utilities /image_picker.dart';

class PostProvider extends ChangeNotifier{

  //
  // uploadNewPost() async {
  //   final newPost = PostModel(
  //     pId: 'post123',
  //     caption: 'This is a post caption.',
  //     img: 'image_url_here',
  //     time: DateTime.now().microsecondsSinceEpoch,
  //   );
  //
  //   await PostApi().uploadPost(newPost);
  // }
  Uint8List? _profilePhoto;
  Uint8List? get profilePhoto => _profilePhoto;


  void pickProfilePhoto() async {
    Uint8List? im = await pickImage(ImageSource.gallery);
    if (im == null) return;
    _profilePhoto = im;
    notifyListeners();
  }
}