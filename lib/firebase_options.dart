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
    apiKey: 'AIzaSyCFsRNTwsPi1z6eta2-gUvdSyTmJQOdWoI',
    appId: '1:1072950184581:web:f1a9bb6cc0f57f374ab7ec',
    messagingSenderId: '1072950184581',
    projectId: 'flutter-expense-a1920',
    authDomain: 'flutter-expense-a1920.firebaseapp.com',
    storageBucket: 'flutter-expense-a1920.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAF9FzKlXDJLiAMuUHf9m8IDa0ZZ4XTaW4',
    appId: '1:1072950184581:android:f3a6032d059737ff4ab7ec',
    messagingSenderId: '1072950184581',
    projectId: 'flutter-expense-a1920',
    storageBucket: 'flutter-expense-a1920.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDvMCz1YmkWLLWgsQlXlquPibLNOGnpZ70',
    appId: '1:1072950184581:ios:821d272890caa9154ab7ec',
    messagingSenderId: '1072950184581',
    projectId: 'flutter-expense-a1920',
    storageBucket: 'flutter-expense-a1920.appspot.com',
    iosClientId: '1072950184581-01i3hq3bda21vadf78v3d6h8vci41raf.apps.googleusercontent.com',
    iosBundleId: 'com.example.expensetracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDvMCz1YmkWLLWgsQlXlquPibLNOGnpZ70',
    appId: '1:1072950184581:ios:821d272890caa9154ab7ec',
    messagingSenderId: '1072950184581',
    projectId: 'flutter-expense-a1920',
    storageBucket: 'flutter-expense-a1920.appspot.com',
    iosClientId: '1072950184581-01i3hq3bda21vadf78v3d6h8vci41raf.apps.googleusercontent.com',
    iosBundleId: 'com.example.expensetracker',
  );
}