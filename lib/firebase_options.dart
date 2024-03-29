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
    apiKey: 'AIzaSyB9S7mkYTajttlD0b539wxdMncdwA9fC2g',
    appId: '1:598534081363:web:e89281b595da2865b56fa6',
    messagingSenderId: '598534081363',
    projectId: 'crud-app-7ba70',
    authDomain: 'crud-app-7ba70.firebaseapp.com',
    storageBucket: 'crud-app-7ba70.appspot.com',
    measurementId: 'G-R1KXWNF3D3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAs8Yi3fKumLYdXvRvkk0GfeAThz5-t6Cs',
    appId: '1:598534081363:android:8d7f4148d7323154b56fa6',
    messagingSenderId: '598534081363',
    projectId: 'crud-app-7ba70',
    storageBucket: 'crud-app-7ba70.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyApfDNEZBbsYwC7xRQlOVLx0BzXKJerZGo',
    appId: '1:598534081363:ios:de907123069b7a6bb56fa6',
    messagingSenderId: '598534081363',
    projectId: 'crud-app-7ba70',
    storageBucket: 'crud-app-7ba70.appspot.com',
    iosClientId: '598534081363-1bum19did9tlq5o8e040aotopirdq5l2.apps.googleusercontent.com',
    iosBundleId: 'com.example.proyectC1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyApfDNEZBbsYwC7xRQlOVLx0BzXKJerZGo',
    appId: '1:598534081363:ios:51baf0cd01ad8d84b56fa6',
    messagingSenderId: '598534081363',
    projectId: 'crud-app-7ba70',
    storageBucket: 'crud-app-7ba70.appspot.com',
    iosClientId: '598534081363-tt13c5uv85l150eph665li144de9vn8s.apps.googleusercontent.com',
    iosBundleId: 'com.example.proyectC1.RunnerTests',
  );
}
