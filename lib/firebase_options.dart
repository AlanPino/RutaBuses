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
    apiKey: 'AIzaSyDI4kUjNDc14Btm41WSs9liigwfvLEL_VI',
    appId: '1:888373884547:web:885be7e27ea51e9c710db6',
    messagingSenderId: '888373884547',
    projectId: 'ruta-buses',
    authDomain: 'ruta-buses.firebaseapp.com',
    storageBucket: 'ruta-buses.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6PFKqOAHhyFCJ-A3f4cK7sPsQD1kopAY',
    appId: '1:888373884547:android:c5f5accf25934e42710db6',
    messagingSenderId: '888373884547',
    projectId: 'ruta-buses',
    storageBucket: 'ruta-buses.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNXEsbh6pqK7Yo7IgU8Yc54LCsRTh4pU8',
    appId: '1:888373884547:ios:6369515f72379ef2710db6',
    messagingSenderId: '888373884547',
    projectId: 'ruta-buses',
    storageBucket: 'ruta-buses.appspot.com',
    iosBundleId: 'com.example.rutaBuses',
  );
}