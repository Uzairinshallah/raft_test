// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAx9YdmAbuqZuqJGpsubyTG0EA7N5jmTEc',
    appId: '1:180358565486:web:2910fa3d78aab89df4607f',
    messagingSenderId: '180358565486',
    projectId: 'ogigifts-4639b',
    authDomain: 'ogigifts-4639b.firebaseapp.com',
    storageBucket: 'ogigifts-4639b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDyK3E4AahtZN4_sGevktWAGK4meUVBHCM',
    appId: '1:180358565486:android:092eeca9b5a0b277f4607f',
    messagingSenderId: '180358565486',
    projectId: 'ogigifts-4639b',
    storageBucket: 'ogigifts-4639b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBH0ttAaBrutxIgNE3oa9cZ6naCt5BBxww',
    appId: '1:180358565486:ios:9be4675cfb9f422af4607f',
    messagingSenderId: '180358565486',
    projectId: 'ogigifts-4639b',
    storageBucket: 'ogigifts-4639b.appspot.com',
    iosBundleId: 'com.example.raftTest',
  );
}
