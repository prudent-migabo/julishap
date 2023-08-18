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
    apiKey: 'AIzaSyCNJvyQVEBRuRmoGIg4vigA4jqjlGo4-fs',
    appId: '1:441344757160:web:0a71296e42222883c0e19d',
    messagingSenderId: '441344757160',
    projectId: 'prudent-julishap',
    authDomain: 'prudent-julishap.firebaseapp.com',
    storageBucket: 'prudent-julishap.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnSbumxkrsnegQ8lpbMRCwGyYJI_EGGdg',
    appId: '1:441344757160:android:bd0a04e0e629a793c0e19d',
    messagingSenderId: '441344757160',
    projectId: 'prudent-julishap',
    storageBucket: 'prudent-julishap.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCq3CTFBbjRgFNVKc5Xpwv7dT-ds6dbodk',
    appId: '1:441344757160:ios:29d44132bc7fe28ec0e19d',
    messagingSenderId: '441344757160',
    projectId: 'prudent-julishap',
    storageBucket: 'prudent-julishap.appspot.com',
    iosClientId: '441344757160-8k21a1ncco3lhqj1jnaev0s70onlnt2i.apps.googleusercontent.com',
    iosBundleId: 'com.example.julishapPolice',
  );
}