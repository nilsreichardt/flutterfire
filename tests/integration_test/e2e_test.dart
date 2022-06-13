import 'package:flutter_test/flutter_test.dart';
import 'cloud_functions/cloud_functions_e2e_test.dart' as cloud_functions;
import 'firebase_core/firebase_core_e2e_test.dart' as firebase_core;
import 'firebase_database/firebase_database_e2e_test.dart' as firebase_database;

void main() {
  group('FlutterFire', () {
    firebase_core.main();
    firebase_database.main();
    cloud_functions.main();
  });
}
