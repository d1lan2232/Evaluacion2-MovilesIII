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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCi_0kRKSFQZojs-MyS1g7q0u03EjM6l2o',
    appId: '1:85965874085:web:f5b58e2509f367cfc0be4c',
    messagingSenderId: '85965874085',
    projectId: 'evaluacion2-movilesiii',
    authDomain: 'evaluacion2-movilesiii.firebaseapp.com',
    databaseURL: 'https://evaluacion2-movilesiii-default-rtdb.firebaseio.com',
    storageBucket: 'evaluacion2-movilesiii.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2EU5SvI1qtm2TyMbFj8DdV5a-D52yzwg',
    appId: '1:85965874085:android:d3e2b74ccd5fff78c0be4c',
    messagingSenderId: '85965874085',
    projectId: 'evaluacion2-movilesiii',
    databaseURL: 'https://evaluacion2-movilesiii-default-rtdb.firebaseio.com',
    storageBucket: 'evaluacion2-movilesiii.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCi_0kRKSFQZojs-MyS1g7q0u03EjM6l2o',
    appId: '1:85965874085:web:d0585a30bd596956c0be4c',
    messagingSenderId: '85965874085',
    projectId: 'evaluacion2-movilesiii',
    authDomain: 'evaluacion2-movilesiii.firebaseapp.com',
    databaseURL: 'https://evaluacion2-movilesiii-default-rtdb.firebaseio.com',
    storageBucket: 'evaluacion2-movilesiii.firebasestorage.app',
  );
}
