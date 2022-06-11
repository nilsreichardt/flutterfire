import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_driver/firebase_default_options.dart';

void main() {
  group('firebase_core', () {
    String testAppName = '[DEFAULT]';

    setUp(() async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    });

    test('Firebase.apps', () async {
      List<FirebaseApp> apps = Firebase.apps;
      expect(apps.length, 1);
      expect(apps[0].name, testAppName);
      expect(apps[0].options, DefaultFirebaseOptions.currentPlatform);
    });

    test('Firebase.app()', () async {
      FirebaseApp app = Firebase.app(testAppName);

      expect(app.name, testAppName);
      expect(app.options, DefaultFirebaseOptions.currentPlatform);
    });

    test('Firebase.app() Exception', () async {
      expect(
        () => Firebase.app('NoApp'),
        throwsA(noAppExists('NoApp')),
      );
    });
  });
}
