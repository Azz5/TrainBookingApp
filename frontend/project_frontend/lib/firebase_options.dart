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
    apiKey: 'AIzaSyDKTtDoZoBVXx4vdoPjx1cgbTzZNitYSoI',
    appId: '1:1003330636557:web:ce9bf818fe4f1df3817e44',
    messagingSenderId: '1003330636557',
    projectId: 'ics321-project-auth',
    authDomain: 'ics321-project-auth.firebaseapp.com',
    storageBucket: 'ics321-project-auth.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkRSLqZ3tBZCsOJRQbDqgDuqRMaqBL1kI',
    appId: '1:1003330636557:android:214b5c654412d553817e44',
    messagingSenderId: '1003330636557',
    projectId: 'ics321-project-auth',
    storageBucket: 'ics321-project-auth.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAfOmb1lvS_XRAnrJfugpTux29lYtgmNl8',
    appId: '1:1003330636557:ios:454d839413e58d0b817e44',
    messagingSenderId: '1003330636557',
    projectId: 'ics321-project-auth',
    storageBucket: 'ics321-project-auth.firebasestorage.app',
    iosBundleId: 'com.example.projectFrontend',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAfOmb1lvS_XRAnrJfugpTux29lYtgmNl8',
    appId: '1:1003330636557:ios:454d839413e58d0b817e44',
    messagingSenderId: '1003330636557',
    projectId: 'ics321-project-auth',
    storageBucket: 'ics321-project-auth.firebasestorage.app',
    iosBundleId: 'com.example.projectFrontend',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDKTtDoZoBVXx4vdoPjx1cgbTzZNitYSoI',
    appId: '1:1003330636557:web:22f3c20b61847cc3817e44',
    messagingSenderId: '1003330636557',
    projectId: 'ics321-project-auth',
    authDomain: 'ics321-project-auth.firebaseapp.com',
    storageBucket: 'ics321-project-auth.firebasestorage.app',
  );

}