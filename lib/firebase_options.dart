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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdH67xjkZHnqU0eR73DbmrpjbI8VXM0bI',
    appId: '1:540356586928:android:abbbac0e3e3af531c6fa75',
    messagingSenderId: '540356586928',
    projectId: 'cwc-cryptic-crusade',
    storageBucket: 'cwc-cryptic-crusade.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyATOKqplpzJdxgdJYaLc5ouI6SxGq6AExM',
    appId: '1:540356586928:ios:cfb133d358bc503bc6fa75',
    messagingSenderId: '540356586928',
    projectId: 'cwc-cryptic-crusade',
    storageBucket: 'cwc-cryptic-crusade.appspot.com',
    iosBundleId: 'dev.xkaper.cwcCrypticCrusade',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBVDQ-me3HDf93o1fTZR8pm_v0OkKNzPNU',
    appId: '1:540356586928:web:e29ff7591c78f6f4c6fa75',
    messagingSenderId: '540356586928',
    projectId: 'cwc-cryptic-crusade',
    authDomain: 'cwc-cryptic-crusade.firebaseapp.com',
    storageBucket: 'cwc-cryptic-crusade.appspot.com',
  );

}