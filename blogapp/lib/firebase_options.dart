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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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
        return windows;
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9pZi2lYfOyn4FixQQv45ksF6wsBOrE68',
    appId: '1:565790117632:android:daedb1a46e33353255ede5',
    messagingSenderId: '565790117632',
    projectId: 'otpandfirestore',
    storageBucket: 'otpandfirestore.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdVYEV0UEBXwtgrbKJLrBNHQUL1FcwvKo',
    appId: '1:565790117632:ios:698a65b86b49daeb55ede5',
    messagingSenderId: '565790117632',
    projectId: 'otpandfirestore',
    storageBucket: 'otpandfirestore.appspot.com',
    iosBundleId: 'com.example.blogapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBIKXxzhNWdeRlL62ohIRzv6AAPknqOb48',
    appId: '1:565790117632:web:666ef8fdddd2c47255ede5',
    messagingSenderId: '565790117632',
    projectId: 'otpandfirestore',
    authDomain: 'otpandfirestore.firebaseapp.com',
    storageBucket: 'otpandfirestore.appspot.com',
    measurementId: 'G-WZ0D8HERNW',
  );
}