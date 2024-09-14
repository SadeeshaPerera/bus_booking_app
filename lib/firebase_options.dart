// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyBH01jv_26QO_8ZV4VyGUjqlVON9EZG58s',
    appId: '1:283974567418:web:0ce429872072843cde1043',
    messagingSenderId: '283974567418',
    projectId: 'uee-project-bglk',
    authDomain: 'uee-project-bglk.firebaseapp.com',
    storageBucket: 'uee-project-bglk.appspot.com',
    measurementId: 'G-403CGVGHRB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcSaZm2vEnfU0MpGFD0ElQyTyI9FZ85GE',
    appId: '1:283974567418:android:76068e5d6cbe23cade1043',
    messagingSenderId: '283974567418',
    projectId: 'uee-project-bglk',
    storageBucket: 'uee-project-bglk.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDhy70qjZNMzX6C2ruMrBRMm3D3zwSpxyE',
    appId: '1:283974567418:ios:f0a47e36ccfeb9d9de1043',
    messagingSenderId: '283974567418',
    projectId: 'uee-project-bglk',
    storageBucket: 'uee-project-bglk.appspot.com',
    iosBundleId: 'com.example.busBookingApp',
  );
}