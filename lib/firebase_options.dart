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
    apiKey: 'AIzaSyAsTv5xTZrdwiRtxlLDbNPDDoRiqMdW2k4',
    appId: '1:1041276403876:web:0de9d829be353ae1116631',
    messagingSenderId: '1041276403876',
    projectId: 'exercise1-week8',
    authDomain: 'exercise1-week8.firebaseapp.com',
    databaseURL: 'https://exercise1-week8-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'exercise1-week8.firebasestorage.app',
    measurementId: 'G-94BMP356D5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCOcFPXFU3yUq_9N5HwQctx3EdyTFSgxAc',
    appId: '1:1041276403876:android:e25495cc35a64a63116631',
    messagingSenderId: '1041276403876',
    projectId: 'exercise1-week8',
    databaseURL: 'https://exercise1-week8-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'exercise1-week8.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjtgRhigRn8ZYtAGEO16yMAljCCHgMad0',
    appId: '1:1041276403876:ios:cade1e06ddcc28f3116631',
    messagingSenderId: '1041276403876',
    projectId: 'exercise1-week8',
    databaseURL: 'https://exercise1-week8-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'exercise1-week8.firebasestorage.app',
    iosBundleId: 'com.example.crudWeek8',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDjtgRhigRn8ZYtAGEO16yMAljCCHgMad0',
    appId: '1:1041276403876:ios:cade1e06ddcc28f3116631',
    messagingSenderId: '1041276403876',
    projectId: 'exercise1-week8',
    databaseURL: 'https://exercise1-week8-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'exercise1-week8.firebasestorage.app',
    iosBundleId: 'com.example.crudWeek8',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAsTv5xTZrdwiRtxlLDbNPDDoRiqMdW2k4',
    appId: '1:1041276403876:web:394f7fffa9896dd6116631',
    messagingSenderId: '1041276403876',
    projectId: 'exercise1-week8',
    authDomain: 'exercise1-week8.firebaseapp.com',
    databaseURL: 'https://exercise1-week8-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'exercise1-week8.firebasestorage.app',
    measurementId: 'G-G39XF3V405',
  );
}
