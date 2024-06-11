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
    apiKey: 'AIzaSyBPkezo3ij-i82BIKrpKJMPoZw9FCqOkMk',
    appId: '1:8912849631:web:96013561c17e445d4bb76a',
    messagingSenderId: '8912849631',
    projectId: 'covidtrackerai',
    authDomain: 'covidtrackerai.firebaseapp.com',
    storageBucket: 'covidtrackerai.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBq3_44wpWV8KoHFqoYD53iduuO-VPGwqg',
    appId: '1:8912849631:android:f9c3b3c9992c23ab4bb76a',
    messagingSenderId: '8912849631',
    projectId: 'covidtrackerai',
    storageBucket: 'covidtrackerai.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6Pr-d39gx9TO3oR2kdDh2joPzUOB0h8I',
    appId: '1:8912849631:ios:b5d2b65eb6eb723e4bb76a',
    messagingSenderId: '8912849631',
    projectId: 'covidtrackerai',
    storageBucket: 'covidtrackerai.appspot.com',
    iosBundleId: 'com.example.covidTracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6Pr-d39gx9TO3oR2kdDh2joPzUOB0h8I',
    appId: '1:8912849631:ios:b5d2b65eb6eb723e4bb76a',
    messagingSenderId: '8912849631',
    projectId: 'covidtrackerai',
    storageBucket: 'covidtrackerai.appspot.com',
    iosBundleId: 'com.example.covidTracker',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBPkezo3ij-i82BIKrpKJMPoZw9FCqOkMk',
    appId: '1:8912849631:web:da459d091e0f47664bb76a',
    messagingSenderId: '8912849631',
    projectId: 'covidtrackerai',
    authDomain: 'covidtrackerai.firebaseapp.com',
    storageBucket: 'covidtrackerai.appspot.com',
  );

}