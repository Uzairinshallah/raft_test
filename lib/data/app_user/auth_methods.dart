import 'package:raft_test/data/app_user/user_api.dart';

import '../../firebase_options.dart';
import '../../models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthMethods{

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static User? get getCurrentUser => _auth.currentUser;

  static String _uid = _auth.currentUser?.uid ?? '';
  static String get uid => _uid;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      clientId: DefaultFirebaseOptions.currentPlatform.iosClientId);
  Future<UserModel?> convertWithGoogle() async {
    final currentUser = getCurrentUser;
    List<User> temp = [];

    final GoogleSignInAccount? account = await _googleSignIn.signIn();
    final GoogleSignInAuthentication _googleAuth =
    await account!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: _googleAuth.idToken,
      accessToken: _googleAuth.accessToken,
    );


    UserModel? userModel;
    final bool? alreadyAcc =
    await UserApi().checkUserFindWithEmail(email: account.email);
    if (alreadyAcc == true) {
      final UserModel alreadyhaveGoogleAcc =
      await UserApi().userFindWithEmail(email: account.email);
      final UserCredential authResult =
      await _auth.signInWithCredential(credential);
      userModel = alreadyhaveGoogleAcc;
      _uid = alreadyhaveGoogleAcc.uid;
    } else {
      try {
        final UserCredential linkedUserCredential =
        await currentUser!.linkWithCredential(credential);
      } catch (e) {
        _auth.currentUser?.unlink(_uid);

      }
      final UserCredential linkedUserCredential =
      await currentUser!.linkWithCredential(credential);
      User user = linkedUserCredential.user!;
      userModel = UserModel(
        uid: user.uid,
        email: user.email!,
        img: account.photoUrl,
        userName: account.displayName?.split(' ').first ?? '',
        followerCount: 0,
        followingCount: 0,
      );
    }

    // temp.add(linkedUserCredential.user!);
    // temp.add(authResult.user!);
    return userModel;
  }
}