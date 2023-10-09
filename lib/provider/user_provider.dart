import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:raft_test/models/user_model.dart';

import '../data/app_user/auth_methods.dart';
import '../data/app_user/user_api.dart';

class UserProvider extends ChangeNotifier{

  UserProvider() {
    init();
  }


  List<UserModel> usersFromListOfString({required List<String> uidsList}) {
    List<UserModel> tempList = <UserModel>[];
    for (String element in uidsList) {
      tempList.add(_user[_indexOf(element)]);
    }
    return tempList;
  }


  int _indexOf(String uid) {
    int index = _user.indexWhere((UserModel element) => element.uid == uid);
    return index;
  }

  UserModel user(String uid) {
    int index = _indexOf(uid);
    return index < 0 ? _null : _user[index];
  }

  static UserModel get _null => UserModel(
    uid: 'null',
    email: 'null',
    userName: 'anonymous',
    followingCount: 0,
    followerCount: 0,
    img: '',
  );

  List<UserModel> _user = <UserModel>[];

  Future<void> init() async {
    _user.clear();
    //_actualUser.clear();

    final List<UserModel> temp = await UserApi().getAllUsers();
    _user = temp;
    print("_user");
    print(_user.length);
    UserModel currentUser = user(AuthMethods.uid);


    notifyListeners();
    log('App_Provider.dart: No of Users: ${_user.length}');
  }
}