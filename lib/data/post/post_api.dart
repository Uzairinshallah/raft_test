
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../models/post_model.dart';

class PostApi{

  Future<void> uploadPost(PostModel post) async {
    final response = await Supabase.instance.client.from('posts').upsert([
      post.toMap(),
    ]).execute();

    if (response.status != 200) {
      throw Exception('Error uploading post: ${response.toString()}');
    }
  }



}
