import '../../models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../widgets/custom_widgets/custom_toast.dart';



class UserApi{

  static const String _collection = 'users';
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;
  Future<UserModel?> user({required String uid}) async {
    final DocumentSnapshot<Map<String, dynamic>> doc =
    await _instance.collection(_collection).doc(uid).get();
    if (!doc.exists) return null;
    final UserModel userModel = UserModel.fromMap(doc.data()!);
    return userModel;
  }

  Future<bool?> checkUserFindWithEmail({required String email}) async {
    final List<UserModel> appUser = <UserModel>[];
    final QuerySnapshot<Map<String, dynamic>> doc = (await _instance
        .collection(_collection)
        .where('email', isEqualTo: email)
        .get());
    if (doc.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> register({required UserModel user}) async {
    try {
      await _instance.collection(_collection).doc(user.uid).set(user.toMap());
      return true;
    } catch (e) {
      CustomToast.errorToast(message: e.toString());
      return false;
    }
  }


  Future<UserModel> userFindWithEmail({required String email}) async {
    final List<UserModel> appUser = <UserModel>[];
    final QuerySnapshot<Map<String, dynamic>> doc = (await _instance
        .collection(_collection)
        .where('email', isEqualTo: email)
        .get());
    for (DocumentSnapshot<Map<String, dynamic>> element in doc.docs) {
      appUser.add(UserModel.fromMap(element.data()!));
    }

    final UserModel appUser1 = appUser[0];

    return appUser1;
  }


  Future<List<UserModel>> getAllUsers() async {
    final List<UserModel> appUser = <UserModel>[];
    final QuerySnapshot<Map<String, dynamic>> doc = await _instance
        .collection(_collection)
        .get();

    for (DocumentSnapshot<Map<String, dynamic>> element in doc.docs) {
      appUser.add(UserModel.fromMap(element.data()!));
    }
    return appUser;
  }


}