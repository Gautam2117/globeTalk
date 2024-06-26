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
        return macos;
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
    apiKey: 'AIzaSyBL6aK-TVLrpkUhoIiJgAVd3Nn9tHcrYZ4',
    appId: '1:49126005168:web:2b8cdd414fa58ea71f9e75',
    messagingSenderId: '49126005168',
    projectId: 'globetalk-424a2',
    authDomain: 'globetalk-424a2.firebaseapp.com',
    storageBucket: 'globetalk-424a2.appspot.com',
    measurementId: 'G-9NWH5DPBMF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBsFPHJN8pnbMh94FfF4aNVJOClXtNtPes',
    appId: '1:49126005168:android:6d865009b32c35f01f9e75',
    messagingSenderId: '49126005168',
    projectId: 'globetalk-424a2',
    storageBucket: 'globetalk-424a2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAdLeQ2wl1Vh1hh0fi-alTLh5hjxlsx4RM',
    appId: '1:49126005168:ios:ad1a06e6f8b9ec791f9e75',
    messagingSenderId: '49126005168',
    projectId: 'globetalk-424a2',
    storageBucket: 'globetalk-424a2.appspot.com',
    iosBundleId: 'com.example.globetalk',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAdLeQ2wl1Vh1hh0fi-alTLh5hjxlsx4RM',
    appId: '1:49126005168:ios:2ecfdbe6ea1e71111f9e75',
    messagingSenderId: '49126005168',
    projectId: 'globetalk-424a2',
    storageBucket: 'globetalk-424a2.appspot.com',
    iosBundleId: 'com.example.globetalk.RunnerTests',
  );
}
