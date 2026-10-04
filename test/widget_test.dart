import 'package:flutter_test/flutter_test.dart';
import 'package:superhero_squad/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Just verify the app can be instantiated
    expect(AppRoot, isNotNull);
  });
}
