import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:raft_test/models/user_model.dart';
import 'package:raft_test/provider/user_provider.dart';

import '../data/app_user/auth_methods.dart';
import '../data/app_user/user_api.dart';

class AuthProvider extends ChangeNotifier{


  Future<void> convertGoogleSignInUser(
      BuildContext context,
      UserProvider userPro,
      ) async {
    UserModel? temp = await AuthMethods().convertWithGoogle();
    log(temp!.email.toString());
    log(temp.uid);
    final bool? alreadyAcc =
    await UserApi().checkUserFindWithEmail(email: temp.email!);

    if (alreadyAcc == false) {
      await UserApi().register(user: temp);
    }
    notifyListeners();
    if (temp.uid.isNotEmpty) {
      userPro.init();
    }
  }



}