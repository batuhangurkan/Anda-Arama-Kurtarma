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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: '',
    appId: '',
    messagingSenderId: '189250873172',
    projectId: 'articulate-fort-238120',
    storageBucket: 'articulate-fort-238120.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey:'',
    appId: '1:189250873172:ios:a0f43bf8c63df831b84ac1',
    messagingSenderId: '189250873172',
    projectId: 'articulate-fort-238120',
    storageBucket: 'articulate-fort-238120.appspot.com',
    iosClientId: '189250873172-djm7r9ts80ngoujm1umnqtu6c6sdnk01.apps.googleusercontent.com',
    iosBundleId: 'com.example.bthnTest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: '',
    appId: '1:189250873172:ios:a0f43bf8c63df831b84ac1',
    messagingSenderId: '189250873172',
    projectId: 'articulate-fort-238120',
    storageBucket: 'articulate-fort-238120.appspot.com',
    iosClientId: '189250873172-djm7r9ts80ngoujm1umnqtu6c6sdnk01.apps.googleusercontent.com',
    iosBundleId: 'com.example.bthnTest',
  );
}
