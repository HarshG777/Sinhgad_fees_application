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
        return macos;
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
    apiKey: 'AIzaSyAhOe0oXLGyNjorCd1DvUfYoLS3xOkaNqc',
    appId: '1:463503508588:web:c22492c4f51d72c78f0449',
    messagingSenderId: '463503508588',
    projectId: 'sinhgad-application',
    authDomain: 'sinhgad-application.firebaseapp.com',
    storageBucket: 'sinhgad-application.firebasestorage.app',
    measurementId: 'G-QZ8P880RJT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDtUja1jzrwNn7FBl5Dn4uVARbrzQ_ZAY',
    appId: '1:463503508588:android:307a89cc964675298f0449',
    messagingSenderId: '463503508588',
    projectId: 'sinhgad-application',
    storageBucket: 'sinhgad-application.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDiE5de-nUVTL3tBv1tsGTPw4TW0ZZztkY',
    appId: '1:463503508588:ios:2d74d3c1feed50f28f0449',
    messagingSenderId: '463503508588',
    projectId: 'sinhgad-application',
    storageBucket: 'sinhgad-application.firebasestorage.app',
    iosBundleId: 'com.example.sinhgadFeesApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDiE5de-nUVTL3tBv1tsGTPw4TW0ZZztkY',
    appId: '1:463503508588:ios:2d74d3c1feed50f28f0449',
    messagingSenderId: '463503508588',
    projectId: 'sinhgad-application',
    storageBucket: 'sinhgad-application.firebasestorage.app',
    iosBundleId: 'com.example.sinhgadFeesApplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAhOe0oXLGyNjorCd1DvUfYoLS3xOkaNqc',
    appId: '1:463503508588:web:21c89052ae97fd878f0449',
    messagingSenderId: '463503508588',
    projectId: 'sinhgad-application',
    authDomain: 'sinhgad-application.firebaseapp.com',
    storageBucket: 'sinhgad-application.firebasestorage.app',
    measurementId: 'G-1R5QGP13LJ',
  );
}
