import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:music_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('verify application flow', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      expect(find.text("No Albums added yet"), findsOneWidget);
      expect(find.text("Music App"), findsOneWidget);
      var textFind = find.text("No Albums added yet");
      expect(textFind, findsOneWidget);
      final Finder searchIcon = find.byIcon(Icons.search);
      expect(searchIcon, findsOneWidget);
      await tester.tap(searchIcon);
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), 'Test');
      await tester.pumpAndSettle();
      await tester.tap(searchIcon);
      await tester.pumpAndSettle();

      var searchItems = find.text("Testament");
      expect(searchItems, findsOneWidget);

      await tester.tap(searchItems);
      await tester.pumpAndSettle();

      expect(find.text("British Steel"), findsOneWidget);
      expect(find.text("Testament Top Albums"), findsOneWidget);
      await tester.pumpAndSettle();

      await tester.tap(find.text("British Steel"));
      await tester.pumpAndSettle();
      expect(find.text("Album"), findsOneWidget);
      expect(find.text("British Steel"), findsOneWidget);
      expect(find.text("Music App"), findsOneWidget);

// VERIFY PAGE SCROLL
      final gesture = await tester.startGesture(Offset(0, 300));
      await gesture.moveBy(Offset(0, -300));
      await tester.pump();

      final backBtn = find.byTooltip("Back");
      await tester.pumpAndSettle();

      await gesture.moveBy(Offset(0, -300));
      await tester.pump();

      await tester.tap(backBtn);
      await tester.pumpAndSettle();

      await gesture.moveBy(Offset(0, -300));
      await tester.pump();
    });
  });
}
