import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
///
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
///

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
      apiKey: "AIzaSyCbF7lRB7Zo2Hvrdevpcf28fR82IY4Ox-k",
      authDomain: "miaged-7009c.firebaseapp.com",
      projectId: "miaged-7009c",
      storageBucket: "miaged-7009c.appspot.com",
      messagingSenderId: "723969571442",
      appId: "1:723969571442:web:29c76ca1d5b196bf1c20eb");

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbF7lRB7Zo2Hvrdevpcf28fR82IY4Ox-k',
    appId: '1:723969571442:android:7391b12984a7f1e51c20eb',
    messagingSenderId: '723969571442',
    projectId: 'miaged-7009c',
    storageBucket: "miaged-7009c.appspot.com",
  );
}
