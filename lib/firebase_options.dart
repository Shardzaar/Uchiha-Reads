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
    apiKey: 'AIzaSyDgjX7wVhr1hfZsdyPfc3gpoYfUUhCsQwM',
    appId: '1:1001057534257:web:f10a63b575bb2c0e19b010',
    messagingSenderId: '1001057534257',
    projectId: 'uchihareads',
    authDomain: 'uchihareads.firebaseapp.com',
    storageBucket: 'uchihareads.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD8Q6Awi9jUyD-NBBDr04Fkbco3xWSKuQg',
    appId: '1:1001057534257:android:b9e222922114951d19b010',
    messagingSenderId: '1001057534257',
    projectId: 'uchihareads',
    storageBucket: 'uchihareads.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCp82jj3eBFf_5BHOlRofH9HY6EGc6MUeg',
    appId: '1:1001057534257:ios:4135983f76044d9619b010',
    messagingSenderId: '1001057534257',
    projectId: 'uchihareads',
    storageBucket: 'uchihareads.appspot.com',
    iosBundleId: 'com.example.uchihaReads',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCp82jj3eBFf_5BHOlRofH9HY6EGc6MUeg',
    appId: '1:1001057534257:ios:117d07d0498c3af719b010',
    messagingSenderId: '1001057534257',
    projectId: 'uchihareads',
    storageBucket: 'uchihareads.appspot.com',
    iosBundleId: 'com.example.uchihaReads.RunnerTests',
  );
}