import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_stacked_nested_navigation/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('UnknownViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
