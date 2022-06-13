import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../firebase_default_options.dart';
import 'data_snapshot_e2e_test.dart';

late FirebaseDatabase database;

// The port we've set the Firebase Database emulator to run on via the
// `firebase.json` configuration file.
const emulatorPort = 9000;

// Android device emulators consider localhost of the host machine as 10.0.2.2
// so let's use that if running on Android.
final emulatorHost =
    (!kIsWeb && defaultTargetPlatform == TargetPlatform.android)
        ? '10.0.2.2'
        : 'localhost';

void main() {
  group('firebase_database', () {
    setUpAll(() async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      database = FirebaseDatabase.instance;
      database.useDatabaseEmulator(emulatorHost, emulatorPort);
      await database.goOnline();
    });

    setupDataSnapshotTests();
  });
}
