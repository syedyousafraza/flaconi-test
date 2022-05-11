import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:music_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('verify home screen and search feature',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text("No Albums added yet"), findsOneWidget);
    expect(find.text("Music App"), findsOneWidget);

    final Finder searchIcon = find.byIcon(Icons.search);
    final Finder searchField = find.byType(TextField);
    expect(searchIcon, findsOneWidget);
    await tester.tap(searchIcon);
    await tester.pumpAndSettle();
  });
}
